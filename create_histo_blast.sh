#!/bin/bash

# Vérifier si un fichier d'entrée est fourni
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 input_file"
    exit 1
fi

# Fichier d'entrée
INPUT_FILE=$1

# Activer l'environnement virtuel (optionnel)
# source /path/to/your/venv/bin/activate

# Exécuter le script Python avec le fichier d'entrée
python3 histo_blast.py "$INPUT_FILE"

# Désactiver l'environnement virtuel (optionnel)
# deactivate
