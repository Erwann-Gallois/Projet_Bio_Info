import re
import matplotlib.pyplot as plt
import sys

def extract_sequence_lengths(fasta_file):
    lengths = []
    with open(fasta_file, 'r') as file:
        for line in file:
            if line.startswith('>'):
                # Utiliser une expression régulière pour extraire la longueur de la séquence
                match = re.search(r'(\d+) bp', line)
                if match:
                    length = int(match.group(1))
                    lengths.append(length)
    return lengths

def plot_histogram(lengths, family_name):
    plt.figure(figsize=(10, 6))
    plt.hist(lengths, bins=20, alpha=0.7, color='blue')
    plt.xlabel('Taille de la séquence (bp)')
    plt.ylabel('Frequence')
    plt.title(f'Histogramme de la taille des séquences de la famille {family_name}')
    plt.axvline(x=sum(lengths)/len(lengths), color='r', linestyle='dashed', linewidth=2, label='Taille moyenne')
    plt.legend()
    plt.savefig(f'histogramme_fasta_{family_name}.png')
    plt.show()

# Exemple d'utilisation
if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python plot_fasta_histogram.py <fasta_file> <family_name>")
        sys.exit(1)

    fasta_file = sys.argv[1]
    family_name = sys.argv[2]

    # Extraire les tailles des séquences
    lengths = extract_sequence_lengths(fasta_file)

    # Créer et afficher l'histogramme
    plot_histogram(lengths, family_name)
