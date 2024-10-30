CREATE DATABASE samochody;

CREATE TABLE wypadki(
    id_wypadku int ,
data_wypadku DATE,
nr_rejestracyjny varchar(10),
strata DEC(9,2)
);
LOAD DATA INFILE 'C:\\xampp\\htdocs\\5e_2\\tizbd\\04_import\\wypadki\\wypadki.txt'
INTO TABLE wypadki
FIELDS TERMINATED BY ' '
LINES TERMINATED BY '\n'
(id_wypadku,data_wypadku,nr_rejestracyjny,@var)
SET strata=REPLACE(@var,',','.');