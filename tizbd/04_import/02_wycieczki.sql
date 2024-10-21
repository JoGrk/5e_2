

use 5e_2_import;
CREATE TABLE osoby(
    id_osoby INT PRIMARY KEY AUTO_INCREMENT,
    imie varchar(255),
    nazwisko varchar(255)
);
CREATE TABLE wycieczki(
    id_wycieczki INT PRIMARY KEY AUTO_INCREMENT,
    kraj varchar(255),
    miejsce varchar(255),
    wylot varchar(255),
    data_od date,
    data_do date,
    cena INT check (cena>0)
);
CREATE TABLE rezerwacje(
    id_rezerwacji INT PRIMARY KEY AUTO_INCREMENT,
    id_osoby INT,
    id_wycieczki INT,
    dorosli INT,
    dzieci INT
);

-- A. Z wiersza poleceń zaimportuj do tabeli osoby dane z pliku osoby.txt (oddzielone tabulatorem  \t, zignoruj pierwszy wiersz zawierający nazwy pól)
LOAD DATA LOCAL INFILE "C:\\xampp\\htdocs\\5e_2\\tizbd\\04_import\\osoby.txt"
INTO TABLE osoby
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

-- B. Z wiersza poleceń zaimportuj do tabeli wycieczki dane z pliku wycieczki.txt (oddzielone tabulatorem, zignoruj pierwszy wiersz zawierający nazwy pól)
LOAD DATA LOCAL INFILE "C:\\xampp\\htdocs\\5e_2\\tizbd\\04_import\\wycieczki.txt"
INTO TABLE wycieczki
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

-- C. Z wiersza poleceń zaimportuj do tabeli rezerwacje dane z pliku rezerwacje.txt (oddzielone tabulatorem, zignoruj pierwszy wiersz zawierający nazwy pól)
LOAD DATA LOCAL INFILE "C:\\xampp\\htdocs\\5e_2\\tizbd\\04_import\\rezerwacje.txt"
INTO TABLE rezerwacje
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;
 

-- 6.

 

-- A. Z wiersza poleceń wyeksportuj wszystkie pola z tabeli osoby do pliku osoby_inicjały.csv. Pola powinny być oddzielone średnikiem, teksty ujęte w cudzysłów, znak kończący linie '\n'. Pokaż na zrzucie także początek zawartości pliku. Sprawdź wygląd w systemowym notatniku i dowolnym innym programie do edycji plików tekstowych (Notepad+, Sublime, Brackets)
SELECT * FROM osoby
INTO OUTFILE 'C:\\xampp\\htdocs\\5e_2\\tizbd\\04_import\\osoby.csv' 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';
-- B. Z wiersza poleceń wyeksportuj dane z tabeli wycieczki (tylko kraj, miejsce i wylot) do pliku wycieczki_inicjały.csv. Pola powinny być oddzielone średnikiem, teksty ujęte w cudzysłów, znak kończący linie '\r\n'. Pokaż na zrzucie także początek zawartości pliku. Sprawdź wygląd w systemowym notatniku i dowolnym innym programie do edycji plików tekstowych 
SELECT kraj, miejsce, wylot FROM wycieczki
INTO OUTFILE 'C:\\xampp\\htdocs\\5e_2\\tizbd\\04_import\\wycieczki.csv' 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n';
-- 7. Wykonaj zrzut bazy danych (gorącą kopię logiczną)  do pliku wycieczka.sql
mysqldump -u root 5e_2_import > wycieczka.sql 
-- 8. Do pliku osoby.sql wykonaj zrzut tabeli osoby(z poziomu wiersza poleceń)
mysqldump -u root 5e_2_import osoby > osoby.sql
-- 9. Usuń tabelę osoby
DROP TABLE osoby
-- 10. Zaimportuj z pliku osoby.sql (z poziomu wiersza poleceń)
mysql -u root 5e_2_import < osoby.sql
-- 11. Usuń bazę danych puchar_imie_nazwisko. 

-- 12. Z poziomu wiersza poleceń za pomocą przekierowania odtwórz bazę danych (przekieruj plik z kopią bazy
