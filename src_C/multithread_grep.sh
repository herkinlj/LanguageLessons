#!/bin/bash
#SBATCH --job-name=test_multithread
#SBATCH --output=result-%j.out
#SBATCH --error=result-%j.err
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1

cp -r /nfs/home/herkinlj/cs470/research_proj/LanguageLessons/src_C /tmp/LanguageLessons_test_grep_C



cd /tmp/LanguageLessons_test_grep_C/src_C




echo "Running Grep with 1 thread:'"
time ./pgrep1 "TESTKEY" test_grep.txt > grep_output.txt

echo "Running Grep with 2 threads: \n"
time ./pgrep2 "TESTKEY" test_grep.txt > grep_output.txt

echo "Running Grep with 4 threads: \n"
time ./pgrep4 "TESTKEY" test_grep.txt > grep_output.txt

echo "Running Grep with 8 threads: \n"
time ./pgrep8 "TESTKEY" test_grep.txt > grep_output.txt

echo "Running Grep with 16 threads: \n"
time ./pgrep8 "TESTKEY" test_grep.txt > grep_output.txt

echo "Running Grep with 32 threads: \n"
time ./pgrep8 "TESTKEY" test_grep.txt > grep_output.txt

echo "Running Grep with 64 threads: \n"
time ./pgrep8 "TESTKEY" test_grep.txt > grep_output.txt

