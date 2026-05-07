#!/usr/bin/env bash

# Store numbers passed as args
num1=$1
num2=$2
# Print Sum of nums
echo "Sum is: $(( num1 + num2 ))"

touch {foo,bar,baz}{.txt,.md} # Create foo, bar, and baz as both .txt & .md files

# Echo current working directory, bash directory, and bash PID
echo "Current Directory is: $PWD"
echo "Current bash instance is type: $BASH"
echo "Current Bash PID is: $BASHPID"

# Find all .txt files in directory, then clean directory
ls *.txt
rm {foo,bar,baz}*
