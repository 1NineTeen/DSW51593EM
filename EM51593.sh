#!/bin/bash

if [ "$1" == "--date" ]; then
    echo $(date +%Y-%m-%d)
fi

if [ "$1" == "--logs" ]; then
    for i in {1..100}; do
        echo "Nazwa pliku: log$i.txt" > log$i.txt
        echo "Nazwa skryptu: EM51593.sh" >> log$i.txt
        echo "Data: $(date +%Y-%m-%d)" >> log$i.txt
    done
fi

if [ "$1" == "--logs" ]; then
    if [ "$2" -gt 0 ]; then
        for i in $(seq 1 $2); do
            echo "Nazwa pliku: log$i.txt" > log$i.txt
            echo "Nazwa skryptu: EM51593.sh" >> log$i.txt
            echo "Data: $(date +%Y-%m-%d)" >> log$i.txt
        done
    else
        echo "Nieprawidłowa liczba plików."
    fi
fi

#!/bin/bash

while [[ $# -gt 0 ]]
do
    key="$1"
    case $key in
        -h|--help)
            echo "Dostępne opcje:"
            echo "--date   wyświetla dzisiejszą datę"
            echo "--logs   tworzy 100 plików logx.txt, gdzie x to numer od 1 do 100"
            echo "--logs N tworzy N plików logx.txt, gdzie x to numer od 1 do N"
            echo "--error  tworzy 100 plików errorx.txt, gdzie x to numer od 1 do 100"
            echo "--error N tworzy N plików errorx.txt, gdzie x to numer od 1 do N"
            exit
            ;;
        --date)
            echo $(date '+%Y-%m-%d')
            exit
            ;;
        --logs)
            if [[ $2 =~ ^[0-9]+$ ]]; then
                count=$2
            else
                count=100
            fi
            for ((i=1;i<=count;i++)); do
                echo "log$i.txt skrypt.sh $(date '+%Y-%m-%d')" > log$i.txt
            done
            exit
            ;;
        --error)
            if [[ $2 =~ ^[0-9]+$ ]]; then
                count=$2
            else
                count=100
            fi
            for ((i=1;i<=count;i++)); do
                echo "error$i.txt skrypt.sh $(date '+%Y-%m-%d')" > error$i.txt
            done
            exit
            ;;
        *)
            echo "Nieznana opcja: $key"
            exit 1
            ;;
    esac
done

