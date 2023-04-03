#!/bin/bash

function help_message {
    echo "EM51593 - bash script with various functions"
    echo ""
    echo "Usage:"
    echo "  em51593.sh [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -h, --help          Display help message"
    echo "  -d, --date          Display today's date"
    echo "  -l, --logs [N]      Create N (default: 100) log files with names logX.txt (X = 1 to N) with script name and date in each file"
    echo "  -e, --error [N]     Create N (default: 100) error files with names errorX.txt (X = 1 to N) with script name and date in each file"
    echo "  --init              Clone the entire repository and set the PATH variable"
    echo "  --version           Display script version"
}

function display_version {
    echo "EM51593 version 1.0"
}


function create_log_files {
    local count=${1:-100}    local i=1
    while [ $i -le $count ]
    do
        echo "Creating log$i.txt file..."
        echo "File name: log$i.txt" > log$i.txt
        echo "Script name: $0" >> log$i.txt
        echo "Date: $(date)" >> log$i.txt
        i=$((i+1))
    done
    echo "$count log files created."
}


function create_error_files {
    local count=${1:-100}
    local i=1
    while [ $i -le $count ]
    do
        echo "Creating error$i.txt file..."
        echo "File name: error$i.txt" > error$i.txt
        echo "Script name: $0" >> error$i.txt
        echo "Date: $(date)" >> error$i.txt
        i=$((i+1))
    done
    echo "$count error files created."
}


while [[ $# -gt 0 ]]
do
    key="$1"

    case $key in
        -h|--help)
        help_message
        exit 0
        ;;
        -d|--date)
        date
        exit 0
        ;;
        -l|--logs)
        create_log_files "$2"
        exit 0
        ;;
        -e|--error)
        create_error_files "$2"
        exit 0
        ;;
        --init)
        git clone git@github.com:<username>/<repository>.git
        export PATH=$PATH:$(pwd)/<repository>
        exit 0
        ;;
        --version)
        display_version
        exit 0
        ;;
        *)
        echo "Invalid option: $1. Use --help option to see the usage."
        exit 1
        ;;
    esac
    shift
done


