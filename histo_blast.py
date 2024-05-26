import pandas as pd
import matplotlib.pyplot as plt
import argparse

def main(input_file):
    df = pd.read_csv(input_file, sep='\t')
    print(df.head())

    # Compter le nombre total de copies par famille
    total_copies = df['query'].value_counts().reset_index()
    total_copies.columns = ['family', 'count']
    print(total_copies)

    # Calculer des statistiques supplémentaires pour chaque famille
    family_stats = df.groupby('query').agg({
        'identity': ['mean', 'std'],
        'mismatches': ['sum'],
        'gaps': ['sum'],
        'length': ['mean', 'std']
    }).reset_index()

    print(family_stats)

    # Créer des histogrammes pour les tailles des copies de chaque famille
    families = df['query'].unique()

    for family in families:
        family_data = df[df['query'] == family]
        plt.figure(figsize=(10, 6))
        plt.hist(family_data['length'], bins=20, alpha=0.7, label=f'{family}')
        plt.axvline(x=family_data['length'].mean(), color='r', linestyle='dashed', linewidth=2, label='Taille moyenne')
        plt.xlabel('Taille des copies (bp)')
        plt.ylabel('Frequences')
        plt.title(f'Histogramme de la taille des copies de la famille {family}')
        plt.legend()
        plt.savefig(f'histogramme_blast_{family}.png')

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Analyze BLAST results.')
    parser.add_argument('input_file', type=str, help='The input file containing BLAST results.')
    args = parser.parse_args()
    main(args.input_file)
