#!/bin/bash

# Ustawienie zmiennej, która odpowiada za liczbę plików do utworzenia
num_of_files=100

# Sprawdzenie przekazanych argumentów
while [[ $# -gt 0 ]]
do
    case "$1" in
        -h|--help)
        echo "Dostępne opcje:"
        echo "--date    Wyświetla dzisiejszą datę"
        echo "--logs    Tworzy 100 plików logx.txt z datą i nazwą skryptu"
        echo "--logs n  Tworzy n plików logx.txt z datą i nazwą skryptu"
        echo "--error   Tworzy 100 plików errorx.txt z datą i nazwą skryptu"
        echo "--error n Tworzy n plików errorx.txt z datą i nazwą skryptu"
        echo "--init    Klonuje repozytorium i dodaje ścieżkę do PATH"
        exit 0
        ;;
        -d|--date)
        date
        exit 0
        ;;
        -l|--logs)
        if [[ -n $2 && $2 =~ ^[0-9]+$ ]]
        then
            num_of_files=$2
        fi
        for ((i=1;i<=$num_of_files;i++))
        do
            echo "Nazwa pliku: log$i.txt" > log$i.txt
            echo "Nazwa skryptu: EM51593" >> log$i.txt
            date >> log$i.txt
        done
        exit 0
        ;;
        -e|--error)
        if [[ -n $2 && $2 =~ ^[0-9]+$ ]]
        then
            num_of_files=$2
        fi
        for ((i=1;i<=$num_of_files;i++))
        do
            echo "Nazwa pliku: error$i.txt" > error$i.txt
            echo "Nazwa skryptu: EM51593" >> error$i.txt
            date >> error$i.txt
        done
        exit 0
        ;;
        --init)
        git clone https://github.com/user/repo.git
        export PATH=$PATH:/path/to/repo
        exit 0
        ;;
        *)
        echo "Nieznana opcja: $1. Użyj -h lub --help, aby zobaczyć dostępne opcje."
        exit 1
        ;;
    esac
    shift
done

if [[ $# -eq 0 ]]
then
    echo "Nie podano argumentów. Użyj -h lub --help, aby zobaczyć dostępne opcje."
fi
