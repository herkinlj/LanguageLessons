March 1, 2024

Research Project:  
    Liam Herkins, Aaron Nyaanga, and Alberto Jimenez

Abstract:
    An empirical analysis of performance speedup in Linux utility applications with the use of parallel techniques and various programming languages.

1 Goal:
    The goal of this project is to compare the performance of Linux system utility applications when written with parallel techniques in C, Rust, and Go as compared to the original, serial C/C++ implementations.

2 Relevance:
    The goal is very much relevant to the field of Parallel and Distributed systems as it requires the parallelization of various search and sort algorithms, implementations of parallel algorithms using Foster’s methodology, and writing parallel programs in various languages. Namely, we are writing in: C (OpenMP & Pthreads), Rust (std::thread), and Go (golang.design/x/thread). In addition to the implementation of various programming techniques discussed throughout the course, this project also focuses heavily on program performance analysis. This topic is an integral part of the CS 470 material and is used throughout the course. Our ability to measure performance metrics, analyze the data measured, and create valid conclusions from them will be put to the test.

3 Methods:
    To achieve the project goals, the following steps will be implemented:

    3.1 Analysis of current Linux utility algorithms:
        In order to see a meaningful speedup in computation bound tasks, we must analyze which of the computations can be parallelized and which are strictly serial in nature. This step of the project will require the ability to identify embarrassingly parallel problems as well as the best method of parallelization for each. This will also require our group to be able to identify communication bound issues within our programs, especially with context switches as well as spawning/joining threads.

    3.2 Development of programs to Interact with OS:
        Develop various parallel applications that emulate the already present Linux distribution utilities such as the ’grep’ command, directory search, the ’rsync’ command, and encryption/decryption algorithms. Since both the Linux kernel and the Linux Mint OS distribution are both open source, we will use the preexisting algorithms as a basis for our parallelization. We will be running these programs on the James Madison University Department of Computer Science lab machines and on remote connections to the network named ’stu’. We will be using the previously mentioned libraries/API’s to create these programs. Each of the languages listed has its equivalent function to the ’syscall’ functions used by the Linux kernel, so the primary focus of this part of the experiment is to simply parallelize the algorithms used for each tool.

    3.3 Testing Framework:
        For performance metrics, we will be measuring both the wall time and overall execution time for the programs. Our control for the experiment will be the serial C/C++ programs that come with the Linux distribution for which we will be using. In this case, Linux mint. These tests will measure both wall time and total execution time. While our focus is mostly on the performance increase within the previously serial regions of code, we will also focus on the overall execution time of the programs. Since we are testing these languages in applications commonly used by casual Linux users, it is important to note how fast the overall execution is. For our C implementation (OpenMP), we will be using ”/usr/bin/time” and ”omp-get-time()” for wall and elapsed execution time. For rust we will be using ”std::time” for both. For Go, we will be using the ”time” package as part of its standard library for both.

4 Possible Roadblocks: 
    Anticipated challenges that arise from this experiment will most likely be due to the nature of the experiment at hand. Since we are writing a program which requires many system calls, type safety is of utmost importance. Thankful, rust has very strict type safety guidelines in its syntactic structure which should aid us in this struggle. In addition to type safety, the raw scale of the Linux code base might prove a challenge, as one can become lost while searching through the endless directories within the various Linux repositories. We must keep our scope small, and stick to what we know we can achieve during this time. In addition, typical difficulties which arise form the use of synchronization techniques and parallel programming will also arise. This includes the introduction of race conditions, data races, memory leaks, and general added complexity to the original program.

5 Draft Deliverable:
    The draft deliverable will include a working prototype of one of the applications types listed above. It will be an application run through the Linux command-line interface and all performance metrics at this time will be displayed through standard output. By the draft deliverable date, we will have at least one program in each of the languages running in parallel to see a baseline of performance increase between the different languages.

6 Showcase:
    For our showcase, we will create a poster board that outlines and displays the project’s, goals, methods, roadblocks encountered, and findings. The poster will not only highlight the specific performance increases in the field of parallel and distributed computing, but also an advancement in the Linux user space. We will display how the addition of the framework we have created can be improved upon further and possibly even integrated into a Linux distribution. We will display performance based metrics with graphical representations of speed discrepancies between the various languages and the overall development experience during our time.

7 Final Deliverable:
    Accompanied with a detailed project report, our final deliverable will include a GitHub repository filled with heavily documented source code for our programs. In addition, we will occupy the repository with detailed compilation and runtime instructions for the programs. In our report, we will perform an in depth performance analysis on the parallel program vs. serial program. Program analysis techniques which we have discussed in class will be implemented for this report. Here we will further delve into the discussion of which of these languages performs most optimally, development experience, current support for each language, and how this open sourced project might evolve in the future.

 Running Test cases for every language.

 Testing C

./mass_compile.sh (-lpthread compilation script)
cd into src_C directory then run the following 
command below.
sbatch ./multithread_grep.sh 

Output will be in the slurm-out file


cd into src_rust directory

Testing Rust

Run cargo build and cd into target then debug.
Then the script should be in there where you will be able to run
the following command below.

sbatch ./multithread_grep.sh 

Output will be in the slurm-out file

Testing Go
cd into src_Go directory then run the following 
command below.

sbatch ./runningGo.sh

Output will be in the slurm-out file


8 Cited Sources:
    Rust parallelism guide: Fearless Concurrency - The Rust Programming Language. (n.d.). https://doc.rust-lang.org/book ch16-00-concurrency.html 
    
    Parallel techniques in Go: S. (2023, October 16). Understanding Concurrency and Parallelism in Go(Golang). Medium. https://medium.com/@ksandeeptech07/understanding-concurrency-and-parallelism-in-go-golang-f53afaf0387b

    Go Implementation of Grep Resource Used:
    https://github.com/ishan-p/go-grep/


Commands to parallelize:
- Grep
- sed
- Chaining together commands that cannot be parallelized
- Find?
