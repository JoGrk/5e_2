-- -- Utwórz tabelę Dzialy z polami:
-- -- kod całkowite, klucz podstawowy 
-- -- nazwa typ tekstowy
-- -- budzet rzeczywisty (real)
    CREATE TABLE dzialy(
        kod int auto_increment PRIMARY KEY,
        nazwa varchar(255),
        budzet real 
    );


-- -- Utwórz tabelę Pracownicy z polami:
-- -- ID całkowite, klucz podstawowy
-- -- imie tekst, nie może być puste
-- -- nazwisko tekst, nie może być puste
-- -- dzial całkowite, jest to również pole klucza obcego, odwołujące się do pola kod w tabeli Działy
 CREATE TABLE pracownicy(
    ID int auto_increment PRIMARY KEY,
    imie  varchar(255) NOT NULL ,
    nazwisko varchar(255) NOT NULL,
    dzial int ,
    FOREIGN KEY(dzial) REFERENCES Dzialy(kod)
 );

--  1. Wyświetl nazwiska wszystkich pracowników
SELECT nazwisko
FROM pracownicy;
-- 2. Wyświetl nazwiska wszystkich pracowników, ale tak, aby się nie powtarzały (DISTINCT) 
SELECT DISTINCT nazwisko
FROM pracownicy;

-- 3. Wyświetl dane wszystkich pracowników o nazwisku  "Smith".   
SELECT nazwisko,imie,id,dzial 
FROM pracownicy 
WHERE nazwisko='Smith';
-- 4. Wyświetl wszystkie dane pracowników o nazwisku  "Smith" lub "Doe".
SELECT *
FROM pracownicy
WHERE nazwisko='Smith' OR nazwisko='Doe';

-- 5. Wyświetl wszystkie dane o pracownikach, którzy pracują w dziale 14.
SELECT *
FROM Pracownicy
WHERE dzial = 14;

-- 6. Wyświetl wszystkie dane o pracownikach z działu 37 i działu 77. 
SELECT *
FROM Pracownicy
WHERE dzial = 37 OR dzial = 77;

-- 7. Wyświetl wszystkie dane o pracownikach, których nazwisko zaczyna się na literę  "S".
SELECT *
FROM pracownicy 
WHERE nazwisko like 'S%';

-- 8. Wyświetl sumę budżetów wszystkich działów. 
SELECT SUM(budzet)
FROM dzialy;

-- 9. Dla każdego działu wyświetl liczbę pracowników (tylko kod działu i liczbę pracowników) 
SELECT dzial, COUNT(*)
FROM pracownicy
GROUP BY dzial;
-- 10. Wyświetl wszystkie dane o pracownikach, łącznie z danymi o działach, w których pracują. 
SELECT * FROM pracownicy
    INNER JOIN dzialy ON pracownicy.dzial=dzialy.kod;
 -- 11. Wyświetl imię i nazwisko każdego pracownika razem z nazwą i budżetem działu, w którym pracownik pracuje. 
SELECT imie, nazwisko, nazwa, budzet
FROM pracownicy
    INNER JOIN Dzialy ON Dzialy.kod=Pracownicy.dzial

 -- 12. Wyświetl imiona i nazwiska pracowników, którzy pracują w działach o budżetach większych niż  $60,000 (czyli sześćdziesiąt tysięcy)
SELECT imie,nazwisko ,budzet   
FROM pracownicy 
    INNER JOIN dzialy ON pracownicy.dzial=dzialy.kod 
WHERE budzet > 60000;
-- 13. Wyświetl działy z budżetem większym niż średni budżet wszystkich działów. 

SELECT nazwa
FROM dzialy
WHERE budzet>(SELECT AVG(budzet) FROM dzialy);
 -- 14. Wyświetl nazwy działów z więcej niż dwoma pracownikami 
 SELECT nazwa
 FROM pracownicy
    INNER JOIN dzialy ON pracownicy.dzial=dzialy.kod
 GROUP BY dzial
 HAVING count(*)>2;

-- 15. Wyświetl imiona i nazwiska pracowników, pracujących w działach (dziale) z najmniejszym budżetem.

SELECT imie, nazwisko 
FROM pracownicy
    INNER JOIN dzialy on pracownicy.dzial=dzialy.kod
WHERE budzet = (SELECT MIN(budzet) FROM dzialy);

-- 16. Dodaj nowy dział  "Quality Assurance" z budżetem $40,000 i kodem 10. 
INSERT INTO dzialy(kod,nazwa,budzet) 
VALUES(10,"Quality Assurance",40000);
-- 17. Dodaj pracownika "Mary Moore", pracującą w dziale o kodzie 10, z ID 847-21-9811.
INSERT INTO Pracownicy(imie,nazwisko,dzial)
VALUES("Mary", "Moore",10);
-- 18. Zmniejsz budżet wszystkich działów o 10%.
UPDATE dzialy
SET budzet=budzet*0.9;
-- 19. przenieś pracowników z działu Research  do działu IT  .

UPDATE pracownicy
SET dzial = 14
WHERE dzial = 77;

UPDATE pracownicy
SET dzial=(SELECT kod 
    from dzialy 
    WHERE nazwa='IT')
WHERE dzial=(SELECT kod 
    FROM dzialy
        WHERE nazwa='Research');

-- 20. Usuń wszystkich pracowników pracujących w dziale   IT.

DELETE FROM Pracownicy
WHERE dzial =(SELECT kod
    FROM dzialy
    WHERE nazwa = 'IT');


SELECT kod
FROM dzialy
WHERE nazwa = 'IT';
-- 21. Usuń wszystkich pracowników, którzy pracują w działach z budżetem większym bądź równym $60,000 (60 tysięcy)
SELECT kod
FROM Dzialy
WHERE budzet >=60000;

DELETE FROM pracownicy
WHERE dzial IN (SELECT kod
    FROM Dzialy
    WHERE budzet >=60000);

-- 22. Usuń wszystkich pracowników
TRUNCATE pracownicy;




-- Wyświetl kody działów zatrudniających co najmniej dwóch pracowników

SELECT dzial, count(*)
FROM pracownicy
GROUP BY dzial
HAVING count(*) >= 2



-- Wyświetl dane wszystkich pracowników, którzy pracują w dziale 37, 77 oraz 18

SELECT imie, nazwisko
FROM pracownicy 
    INNER JOIN dzialy ON pracownicy.dzial=dzialy.kod
WHERE dzial IN (37,77,18)