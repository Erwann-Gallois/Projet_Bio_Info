#!/bin/bash

# $1 : Fichier des ids

# Supression des > des identifiants
fichier=$1
while read LINE
do 
    set $LINE
    blastdbcmd -db new_TAIR10_TE.fasta -entry $1
done < $fichier