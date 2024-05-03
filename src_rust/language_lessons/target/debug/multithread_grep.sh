#!/bin/bash
#SBATCH --job-name=test_multithread
#SBATCH --output=result-%j.out
#SBATCH --error=result-%j.err
#SBATCH --time=01:00:00
#SBATCH --ntasks=16          # Total number of tasks
#SBATCH --cpus-per-task=4    # Number of cores per task


echo "howdy partner\n"

cp -r /nfs/home/herkinlj/cs470/research_proj/LanguageLessons/src_rust/language_lessons /tmp/Language_Lessons_rust

# Navigate to your experiment directory
cd /tmp/Language_Lessons_rust/language_lessons/target/debug

# Specify threads
THREADS="1 4 8 16 32 64"


for THREAD_COUNT in $THREADS; do
    export RAYON_NUM_THREADS=$THREAD_COUNT
    echo "Running rust grep with $THREAD_COUNT threads:"
    time ./language_lessons "specialKEY123" test_grep.txt
done
