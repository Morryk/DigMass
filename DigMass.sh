#!/bin/bash

# Controlla se l'utente ha fornito il file di input
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 file_domini"
    exit 1
fi

domini="$1"

# Controlla se il file di input esiste
if [ ! -f "$domini" ]; then
    echo "Il file $input_file non esiste."
    exit 1
fi

# Leggi ogni riga del file di input
while IFS= read -r domain; do
    if [ -n "$domain" ]; then
        # Utilizza dig per ottenere il record A
        ip=$(dig +short A "$domain")
        if [ -n "$ip" ]; then
            echo "$domain - $ip"
        else
            echo "$domain - Nessun record A trovato"
        fi
    fi
done < "$domini"
