#!/bin/bash

# Vérifier si le bon nombre d'arguments est fourni
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <fasta_file> <family_name>"
    exit 1
fi

# Assignation des arguments à des variables
FASTA_FILE=$1
FAMILY_NAME=$2

# Activer l'environnement virtuel si nécessaire (optionnel)
# source /path/to/your/venv/bin/activate

# Exécuter le script Python avec les arguments fournis
python3 histo_fasta.py "$FASTA_FILE" "$FAMILY_NAME"

# Désactiver l'environnement virtuel si nécessaire (optionnel)
# deactivate
