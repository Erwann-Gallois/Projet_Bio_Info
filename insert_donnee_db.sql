INSERT INTO chromosome (num_k, taille, is_somatique) VALUES (1, 30973317, TRUE); --ATCOPIA32B
INSERT INTO chromosome (num_k, taille, is_somatique) VALUES (2, , TRUE); --VANDAL11

-- Famille
INSERT INTO famille_et (nom_famille, type_famille, ordre)
VALUES (
    'ATCOPIA32B'
    'LTR',
    'COPIA'
  );
INSERT INTO famille_et (nom_famille, type_famille, ordre)
VALUES (
    'VANDAL11'
    'DNA',
    'MuDR'
  );
INSERT INTO famille_et (nom_famille, type_famille, ordre)
VALUES (
    'ATLINE1_1'
    'non-LTR',
    'LINE-L1'
  );

--Gene
INSERT INTO gene (nom_gene, is_codant)
VALUES (
  ""
)