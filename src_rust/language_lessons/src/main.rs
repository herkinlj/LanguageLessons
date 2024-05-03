extern crate rayon;
extern crate structopt;
extern crate walkdir;
extern crate regex;
extern crate colored;

use std::fs::File;
use std::io::{self, BufReader};
use std::io::prelude::*;
use std::path::PathBuf;
use colored::*;
use rayon::prelude::*;
use regex::Regex;
use structopt::StructOpt;
use walkdir::WalkDir;

#[derive(Debug, StructOpt)]
struct Opt {
    #[structopt(parse(from_str))]
    regex: String,
    #[structopt(parse(from_os_str))]
    file: Option<PathBuf>,
}

fn main() -> io::Result<()> {
    let opt = Opt::from_args();
    let regex = Regex::new(&opt.regex).expect("Could not parse regex!");
    if let Some(path) = opt.file {
        WalkDir::new(path)
            .into_iter()
            .filter_map(Result::ok)
            .filter(|dir_entry| dir_entry.path().is_file())
            .par_bridge()
            .map(|dir_entry| {
                let file = File::open(dir_entry.path())?;
                let mut reader = BufReader::new(file);
                let mut file_content = String::new();
                reader.read_to_string(&mut file_content)?;
                Ok::<_, io::Error>((dir_entry, file_content))
            })
            .filter_map(Result::ok)
            .map(|(dir_entry, file_content)| {
                find_match(&regex, &format!("{}", dir_entry.path().display()), &file_content)
            })
            .collect::<Vec<_>>()
            .iter()
            .for_each(|matches| println!("{}", matches));
    } else {
        let mut file_content = String::new();
        let stdin = io::stdin();
        let mut stdin = stdin.lock();
        stdin.read_to_string(&mut file_content)?;
        find_match(&regex, "stdin", &file_content);
    }
    Ok(())
}

fn find_match(regex: &Regex, file_path: &str, file_content: &str) -> String {
    let mut matches = String::new();
    for (line_number, line) in file_content.lines().enumerate() {
        if let Some(mat) = regex.find(line) {
            matches.push_str(&format!(
                "[{}:{}:]{}{}{}\n",
                file_path,
                line_number + 1,
                &line[..mat.start()],
                &line[mat.start()..mat.end()].red(),
                &line[mat.end()..]
            ));
        }
    }
    matches
}

