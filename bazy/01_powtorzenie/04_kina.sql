-- 1. Przygotuj tabele:
-- Filmy
-- Kod liczba całkowita, autoinkrementacja, klucz podstawowy
-- Tytul  tekst
-- Rating tekst
CREATE TABLE Filmy(
    Kod int AUTO_INCREMENT PRIMARY KEY,
    Tytul varchar(255),
    Rating varchar(255)
);

-- Kina
-- Kod  liczba całkowita, autonumerowanie, klucz podstawowy
-- Nazwa tekst nie puste
-- Film liczba całkowita, klucz obcy odwołujący się do pola kod w tabeli Filmy
CREATE TABLE Kina(
    Kod int AUTO_INCREMENT PRIMARY KEY,
    Nazwa varchar(255) NOT NULL,
    Film int,
    FOREIGN KEY (film) references Filmy(kod) 
); 
 
 INSERT INTO Filmy(Kod,Tytul,Rating) VALUES(9,'Citizen King','G');
 INSERT INTO Filmy(Kod,Tytul,Rating) VALUES(1,'Citizen Kane','PG');
 INSERT INTO Filmy(Kod,Tytul,Rating) VALUES(2,'Singin'' in the Rain','G');
 INSERT INTO Filmy(Kod,Tytul,Rating) VALUES(3,'The Wizard of Oz','G');
 INSERT INTO Filmy(Kod,Tytul,Rating) VALUES(4,'The Quiet Man',NULL);
 INSERT INTO Filmy(Kod,Tytul,Rating) VALUES(5,'North by Northwest',NULL);
 INSERT INTO Filmy(Kod,Tytul,Rating) VALUES(6,'The Last Tango in Paris','NC-17');
 INSERT INTO Filmy(Kod,Tytul,Rating) VALUES(7,'Some Like it Hot','PG-13');
 INSERT INTO Filmy(Kod,Tytul,Rating)  VALUES(8,'A Night at the Opera',NULL);
 
 INSERT INTO Kina(Kod,Nazwa,Film) VALUES(1,'Odeon',5);
 INSERT INTO Kina(Kod,Nazwa,Film) VALUES(2,'Imperial',1);
 INSERT INTO Kina(Kod,Nazwa,Film) VALUES(3,'Majestic',NULL);
 INSERT INTO Kina(Kod,Nazwa,Film) VALUES(4,'Royale',6);
 INSERT INTO Kina(Kod,Nazwa,Film) VALUES(5,'Paraiso',3);
 INSERT INTO Kina(Kod,Nazwa,Film) VALUES(6,'Nickelodeon',NULL);
 

 

 

 

-- 1. Wyświetl tytuły wszystkich filmów
SELECT tytul from filmy;
-- 2. Ile różnych poziomów ratingu jest zapisane w bazie? Wyświetl je (dane nie powinny się powtarzać). 
SELECT DISTINCT (rating)
FROM filmy;
-- 3. Wyświetl wszystkie filmy z nieustalonym ratingiem.
SELECT tytul
FROM filmy
WHERE rating IS NULL;
-- 4. Wyświetl wszystkie  kina, w których aktualnie nie są wyświetlane żadne filmy. 
SELECT nazwa 
FROM kina
WHERE film IS NULL;
-- 5. Wyświetl wszystkie dane o kinach i filmach, uwzględnij tylko dane o filmach, które są wyświetlane w tych kinach i dane o kinach, w których są wyświetlane jakieś filmy. 
SELECT *
FROM filmy
    INNER JOIN kina ON filmy.kod = kina.film;
-- 6. Wyświetl wszystkie dane o kinach i filmach, uwzględnij w zestawieniu także te kina, w których aktualnie nie są wyświetlane żadne filmy.
SELECT *
FROM filmy RIGHT JOIN kina ON filmy.kod = kina.film;
-- 7. Wyświetl wszystkie dane o kinach i filmach, uwzględnij w zestawieniu także te filmy, które nie są aktualnie wyświetlane w żadnych kinach. 
SELECT *
FROM filmy LEFT JOIN kina ON filmy.kod = kina.film;
-- 8. Wyświetl wszystkie dane o kinach i filmach, uwzględnij w zestawieniu także te kina, w których aktualnie nie są wyświetlane żadne filmy oraz  te filmy, które nie są aktualnie wyświetlane w żadnych kinach. 
SELECT *
FROM filmy LEFT JOIN kina ON filmy.kod = kina.film
UNION
SELECT *
FROM filmy RIGHT JOIN kina ON filmy.kod = kina.film;

-- 9. Dodaj film  "One, Two, Three" (bez ratingu)
 INSERT INTO filmy(tytul)
 VALUES("One, Two, Three");
-- 10. Ustal rating wszystkich filmów bez ratingu na  "G".
UPDATE filmy
SET rating = 'G'
WHERE rating IS NULL;
-- 11. usuń kina wyświetlające filmy z ratingiem "NC-17".
DELETE FROM kina
WHERE film IN (SELECT kod FROM filmy WHERE rating = 'NC-17');