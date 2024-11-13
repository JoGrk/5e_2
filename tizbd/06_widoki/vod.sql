CREATE TABLE IF NOT EXISTS klienci(
    pesel char(11) PRIMARY KEY,
    imie varchar(255),
    nazwisko varchar(255)
);

LOAD DATA INFILE 'C:\\xampp\\htdocs\\5e_2\\tizbd\\06_widoki\\klienci.txt'
INTO TABLE klienci
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


CREATE INDEX index_wypozyczenia ON wypozyczenia(data_wyp);
CREATE INDEX index_filmy on filmy(tytul);

SELECT tytul, kraj_produkcji, gatunek
FROM filmy INTO OUTFILE 'C:\\xampp\\htdocs\\5e_2\\tizbd\\06_widoki\\filmy.csv'
FIELDS TERMINATED BY ';';

CREATE VIEW FilmyWypozyczenia AS 
SELECT filmy.ID_filmu,tytul,kraj_produkcji,data_wyp
FROM filmy
    INNER JOIN wypozyczenia ON filmy.ID_filmu=wypozyczenia.ID_filmu;


SELECT tytul
FROM filmy
WHERE ID_filmu NOT IN(SELECT id_filmu FROM FilmyWypozyczenia);
-- 9. Usuń indeks z tabeli wypozyczenia.
ALTER TABLE wypozyczenia 
DROP INDEX index_wypozyczenia;
-- 10. Utwórz widok IloscWypozyczen obliczające ile razy film o danym ID był wypożyczany
CREATE VIEW IloscWypozyczen AS 
SELECT id_filmu, COUNT(*) AS ilosc 
FROM wypozyczenia 
GROUP BY id_filmu;

-- 11. Korzystając z widoku IloscWypozyczen wyświetl tytuły pięciu najczęściej wypożyczanych filmów
SELECT tytul, ilosc 
FROM filmy
    INNER JOIN IloscWypozyczen ON filmy.id_filmu=IloscWypozyczen.id_filmu
ORDER BY ilosc desc
LIMIT 5;