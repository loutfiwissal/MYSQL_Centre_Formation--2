Enter password: ***********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 16
Server version: 8.0.36 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| bd_vol             |
| centre_formation   |
| djallabasoft       |
| ecuri              |
| hollywood          |
| information_schema |
| isgi               |
| mysql              |
| performance_schema |
| resto              |
| sakila             |
| stordb             |
| sys                |
| test1              |
| tramway            |
| world              |
+--------------------+
16 rows in set (0.01 sec)

mysql> use centre_formation;
Database changed
mysql> show tables;
+----------------------------+
| Tables_in_centre_formation |
+----------------------------+
| catalogue                  |
| etudiant                   |
| formation                  |
| inscription                |
| session                    |
| specialite                 |
+----------------------------+
6 rows in set (0.01 sec)

mysql> select * from etudiant;
+----------+---------------+--------------+----------------+-------------------------------------+------------+------------+
| num_cin  | nom           | prenom       | date_naissance | adresse                             | niveau     | ville      |
+----------+---------------+--------------+----------------+-------------------------------------+------------+------------+
| AB234567 | alami         | ahmad        | 1986-01-01     | rue de port 13                      | bac        | tanger     |
| C0987265 | souni         | sanaa        | 1998-04-30     | place du peuple n 2                 | niveau bac | tanger     |
| d2356903 | idrissi alami | mohammed     | 1996-05-05     | lotissement najah,rue n12 immeuble3 | bac+4      | rabat      |
| F9827363 | boudiaf       | fatima zohra | 1997-01-10     | immeuble iftikhar, n13 ettakadoum   | bac+2      | rabat      |
| G5346789 | toumi         | aicha        | 2000-03-12     | n12 immeuble jaouhar                | master     | casablanca |
| J3578902 | ben omar      | abd allah    | 1990-06-25     | villa amina n12 bir rami            | phd        | kenitra    |
| Y1234987 | ouled thami   | ali          | 1979-12-04     | la ville haute,rue chouhada n6      | bachelor   | tanger     |
+----------+---------------+--------------+----------------+-------------------------------------+------------+------------+
7 rows in set (0.01 sec)

mysql>  select * from session;
+------+-------------+------------+------------+-----------+
| code | nomSess     | dateDebut  | datefin    | codeforme |
+------+-------------+------------+------------+-----------+
| 1101 | session1101 | 2022-01-02 | 2022-01-14 |        11 |
| 1102 | session1102 | 2022-02-03 | 2022-02-15 |        11 |
| 1104 | session1104 | 2022-10-15 | 2022-10-27 |        11 |
| 1201 | session1202 | 2022-03-04 | 2022-03-18 |        12 |
| 1202 | session1202 | 2022-04-05 | 2022-04-19 |        12 |
| 1203 | session1203 | 2022-11-16 | 2022-11-30 |        12 |
| 1204 | session1204 | 2022-12-17 | 2022-12-31 |        12 |
| 1301 | session1301 | 2022-01-06 | 2022-01-21 |        13 |
| 1302 | session1302 | 2022-05-07 | 2022-05-22 |        13 |
| 1401 | session1401 | 2022-09-01 | 2022-09-11 |        14 |
| 1402 | session1402 | 2022-08-08 | 2022-08-18 |        14 |
| 1501 | session1501 | 2022-11-11 | 2022-12-01 |        15 |
| 1502 | session1502 | 2022-09-12 | 2022-10-02 |        15 |
| 1601 | session1601 | 2022-09-13 | 2022-09-25 |        16 |
| 1602 | session1602 | 2022-10-14 | 2022-10-26 |        16 |
+------+-------------+------------+------------+-----------+
15 rows in set (0.00 sec)

mysql> select * from formation;
+-----------+-----------------------+-----------+-----------+
| codeforme | tittreform            | dureeform | prixforme |
+-----------+-----------------------+-----------+-----------+
|        11 | programming java      |        12 |      3600 |
|        12 | web developpment      |        14 |      4200 |
|        13 | anglais technique     |        15 |      3750 |
|        14 | communication         |        10 |      2500 |
|        15 | base de donnes oracle |        20 |      6000 |
|        16 | soft skills           |        12 |      3000 |
+-----------+-----------------------+-----------+-----------+
6 rows in set (0.00 sec)

mysql> select distinct session.nomSess,session.dateDebut,session.datefin,formation.tittreform
    -> from session
    -> Join  formation on session.codeforme = formation.codeforme;
+-------------+------------+------------+-----------------------+
| nomSess     | dateDebut  | datefin    | tittreform            |
+-------------+------------+------------+-----------------------+
| session1101 | 2022-01-02 | 2022-01-14 | programming java      |
| session1102 | 2022-02-03 | 2022-02-15 | programming java      |
| session1104 | 2022-10-15 | 2022-10-27 | programming java      |
| session1202 | 2022-03-04 | 2022-03-18 | web developpment      |
| session1202 | 2022-04-05 | 2022-04-19 | web developpment      |
| session1203 | 2022-11-16 | 2022-11-30 | web developpment      |
| session1204 | 2022-12-17 | 2022-12-31 | web developpment      |
| session1301 | 2022-01-06 | 2022-01-21 | anglais technique     |
| session1302 | 2022-05-07 | 2022-05-22 | anglais technique     |
| session1401 | 2022-09-01 | 2022-09-11 | communication         |
| session1402 | 2022-08-08 | 2022-08-18 | communication         |
| session1501 | 2022-11-11 | 2022-12-01 | base de donnes oracle |
| session1502 | 2022-09-12 | 2022-10-02 | base de donnes oracle |
| session1601 | 2022-09-13 | 2022-09-25 | soft skills           |
| session1602 | 2022-10-14 | 2022-10-26 | soft skills           |
+-------------+------------+------------+-----------------------+
15 rows in set (0.00 sec)

mysql> select * from  inscription;
+------+----------+-------------+
| code | num_cine | typeCours   |
+------+----------+-------------+
| 1101 | AB234567 | Distanciel  |
| 1101 | C0987265 | Distanciel  |
| 1101 | D2356903 | Distanciel  |
| 1101 | F9827363 | Distanciel  |
| 1101 | G5346789 | Distanciel  |
| 1101 | J3578902 | Distanciel  |
| 1101 | Y1234987 | Distanciel  |
| 1201 | AB234567 | Présentiel  |
| 1201 | C0987265 | Présentiel  |
| 1201 | D2356903 | Présentiel  |
| 1201 | G5346789 | Présentiel  |
| 1201 | J3578902 | Présentiel  |
| 1201 | Y1234987 | Présentiel  |
| 1301 | AB234567 | Présentiel  |
| 1302 | C0987265 | Présentiel  |
| 1302 | D2356903 | Présentiel  |
| 1302 | G5346789 | Distanciel  |
| 1302 | Y1234987 | Présentiel  |
| 1401 | C0987265 | Distanciel  |
| 1401 | D2356903 | Distanciel  |
| 1401 | F9827363 | Distanciel  |
| 1401 | G5346789 | Distanciel  |
| 1401 | J3578902 | Distanciel  |
| 1401 | Y1234987 | Distanciel  |
| 1501 | AB234567 | Distanciel  |
| 1501 | C0987265 | Distanciel  |
| 1501 | D2356903 | Présentiel  |
| 1501 | F9827363 | Présentiel  |
| 1501 | G5346789 | Présentiel  |
| 1501 | J3578902 | Présentiel  |
| 1501 | Y1234987 | Présentiel  |
+------+----------+-------------+
31 rows in set (0.00 sec)

mysql> select distinct inscription.num_cine,etudiant.nom,etudiant.prenom, formation.tittreform
    -> from etudiant
    -> join inscription on etudiant.num_cin = inscription.num_cine
    -> join session on  inscription.code = session.code
    -> join formation on session.codeforme = formation.codeforme
    -> ORDER By formation.tittreform;
+----------+---------------+--------------+-----------------------+
| num_cine | nom           | prenom       | tittreform            |
+----------+---------------+--------------+-----------------------+
| AB234567 | alami         | ahmad        | anglais technique     |
| C0987265 | souni         | sanaa        | anglais technique     |
| D2356903 | idrissi alami | mohammed     | anglais technique     |
| G5346789 | toumi         | aicha        | anglais technique     |
| Y1234987 | ouled thami   | ali          | anglais technique     |
| AB234567 | alami         | ahmad        | base de donnes oracle |
| C0987265 | souni         | sanaa        | base de donnes oracle |
| D2356903 | idrissi alami | mohammed     | base de donnes oracle |
| F9827363 | boudiaf       | fatima zohra | base de donnes oracle |
| G5346789 | toumi         | aicha        | base de donnes oracle |
| J3578902 | ben omar      | abd allah    | base de donnes oracle |
| Y1234987 | ouled thami   | ali          | base de donnes oracle |
| C0987265 | souni         | sanaa        | communication         |
| D2356903 | idrissi alami | mohammed     | communication         |
| F9827363 | boudiaf       | fatima zohra | communication         |
| G5346789 | toumi         | aicha        | communication         |
| J3578902 | ben omar      | abd allah    | communication         |
| Y1234987 | ouled thami   | ali          | communication         |
| AB234567 | alami         | ahmad        | programming java      |
| C0987265 | souni         | sanaa        | programming java      |
| D2356903 | idrissi alami | mohammed     | programming java      |
| F9827363 | boudiaf       | fatima zohra | programming java      |
| G5346789 | toumi         | aicha        | programming java      |
| J3578902 | ben omar      | abd allah    | programming java      |
| Y1234987 | ouled thami   | ali          | programming java      |
| AB234567 | alami         | ahmad        | web developpment      |
| C0987265 | souni         | sanaa        | web developpment      |
| D2356903 | idrissi alami | mohammed     | web developpment      |
| G5346789 | toumi         | aicha        | web developpment      |
| J3578902 | ben omar      | abd allah    | web developpment      |
| Y1234987 | ouled thami   | ali          | web developpment      |
+----------+---------------+--------------+-----------------------+
31 rows in set (0.00 sec)

mysql> select COUNT(typeCours) as Nb_Ins from inscription
    -> join session on  inscription.code = session.code
    -> join formation on session.codeforme = formation.codeforme
    -> where formation.tittreform = 'web developpment';
+--------+
| Nb_Ins |
+--------+
|      6 |
+--------+
1 row in set (0.00 sec)

mysql>  select formation.tittreform,COUNT(typeCours) as Nb_Ins from inscription
    -> join session on  inscription.code = session.code
    ->  join formation on session.codeforme = formation.codeforme
    -> where  inscription.typeCours = 'Distanciel'
    -> GROUP BY formation.tittreform
    ->  HAVING COUNT(*) >= 3
    ->  HAVING COUNT(*) >= 3
    -> ORDER BY  Nb_Ins;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'HAVING COUNT(*) >= 3
ORDER BY  Nb_Ins' at line 7
mysql>  select formation.tittreform,COUNT(typeCours) as Nb_Ins from inscription
    -> join session on  inscription.code = session.code
    -> join formation on session.codeforme = formation.codeforme
    ->  where  inscription.typeCours = 'Distanciel'
    -> GROUP BY formation.tittreform
    -> HAVING COUNT(*) >= 3
    -> ORDER BY  Nb_Ins;
+------------------+--------+
| tittreform       | Nb_Ins |
+------------------+--------+
| communication    |      6 |
| programming java |      7 |
+------------------+--------+
2 rows in set (0.00 sec)

mysql> select formation.tittreform,formation.dureeform,formation.prixforme,catalogue.codeform
    -> from catalogue
    ->  join formation on catalogue.codeform = formation.codeforme
    ->  where  catalogue.codespec in (select distinct codespec from catalogue)
    -> ORDER BY  catalogue.codespec DESC, formation.tittreform;
+-----------------------+-----------+-----------+----------+
| tittreform            | dureeform | prixforme | codeform |
+-----------------------+-----------+-----------+----------+
| anglais technique     |        15 |      3750 |       13 |
| communication         |        10 |      2500 |       14 |
| soft skills           |        12 |      3000 |       16 |
| anglais technique     |        15 |      3750 |       13 |
| base de donnes oracle |        20 |      6000 |       15 |
| base de donnes oracle |        20 |      6000 |       15 |
| programming java      |        12 |      3600 |       11 |
| web developpment      |        14 |      4200 |       12 |
+-----------------------+-----------+-----------+----------+
8 rows in set (0.01 sec)

mysql>


