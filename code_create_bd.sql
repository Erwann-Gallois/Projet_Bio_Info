CREATE TABLE chromosome (
    num_k   int,
    taille  int,
    is_somatique    boolean,
    CONSTRAINT num_k PRIMARY KEY (num_k)
);


CREATE TABLE famille_ET (
    nom_famille varchar(50),
    type_famille varchar(50),
    ordre varchar(50),
    CONSTRAINT nom_famille PRIMARY KEY (nom_famille)
);

CREATE TABLE gene (
    nom_gene    varchar(50),
    is_codant   boolean,
    CONSTRAINT nom_gene PRIMARY KEY (nom_gene)
);

CREATE TABLE copie_ET (
    nom_copie_ET  varchar(50),
    taille  int,
    seq    text,
    caracterisation text,
    is_reference    boolean,
    nom_famille varchar(50),
    CONSTRAINT nom_copie_ET PRIMARY KEY (nom_copie_ET),
    CONSTRAINT fk_nom_famille FOREIGN KEY (nom_famille) REFERENCES famille_ET (nom_famille)
);

CREATE TABLE blastit (
    id_blast int PRIMARY KEY,
    evalue float,
    mismatch int,
    gapopen int,
    bitscore float,
    qstart int,
    qend int,
    s_start int,
    s_end int,
    nom_ET1 varchar(50),
    nom_ET2 varchar(50),
    CONSTRAINT nom_ET1 FOREIGN KEY (nom_ET1) REFERENCES copie_ET (nom_copie_ET),
    CONSTRAINT nom_ET2 FOREIGN KEY (nom_ET2) REFERENCES copie_ET (nom_copie_ET)
);

CREATE TABLE localisation_ET (
    debut int,
    fin int,
    orientation varchar(1),
    nom_copie_ET varchar(50),
    chromosome int,
    CONSTRAINT fk_nom_copie_ET FOREIGN KEY (nom_copie_ET) REFERENCES copie_ET (nom_copie_ET),
    CONSTRAINT fk_chromosome FOREIGN KEY (chromosome) REFERENCES chromosome (num_k),
    CONSTRAINT pk_nom_copie_ET PRIMARY KEY (nom_copie_ET)
);

CREATE TABLE localisation_gene (
    debut   int,
    fin     int,
    orientation varchar(1),
    nom_gene varchar(50),
    chromosome int,
    CONSTRAINT fk_nom_gene FOREIGN KEY (nom_gene) REFERENCES gene (nom_gene),
    CONSTRAINT fk_chromosome_gene FOREIGN KEY (chromosome) REFERENCES chromosome (num_k),
    CONSTRAINT pk_nom_gene PRIMARY KEY (nom_gene)
);