-- Utwórz tabele:

-- Producenci
--  kod całkowity, klucz podstawowy, autoinkrementacja
-- nazwa  tekst, pole nie może być puste
CREATE TABLE Producenci(
    kod int PRIMARY KEY auto_increment,
    nazwa varchar(255) NOT NULL
);

-- Produkty
-- kod całkowite, klucz podstawowy,  autoinkrementacja
-- nazwa tekst, pole nie może puste
-- cena dwa miejsca po przecinku, przed przecinkiem 5 cyfr
-- producent całkowite, klucz obcy odwołujący się do pola kod w tabeli producenci
CREATE TABLE Produkty (
    kod int PRIMARY KEY auto_increment,
    nazwa varchar(255) NOT NULL,
    cena dec(7,2),
    producent int,
    FOREIGN KEY(producent) REFERENCES Producenci(kod)

);

 
-- 1. Wyświetl nazwy wszystkich produktów|
SELECT nazwa 
FROM Produkty;


-- 2. Wyświetl nazwy i ceny wszystkich produktów w sklepie 
SELECT nazwa,cena
FROM Produkty;
-- 3. Wyświetl nazwy produktów o cenie mniejszej lub równiej  $200.
SELECT nazwa,cena
FROM Produkty
WHERE cena <=200;
-- 4. Wyświetl wszystkie produkty o cenie pomiędzy $60 i $120.
SELECT nazwa, cena
FROM produkty
WHERE cena BETWEEN 60 and 120;
-- 5. Wyświetl nazwy produktów i ceny w centach (tzn. pomnóż ceny przez 100) 
SELECT nazwa,cena*100 
FROM produkty ;

-- 6. Wyświetl średnią cenę wszystkich produktów 
SELECT AVG(cena)
FROM Produkty;

-- 7. Wyświetl średną ceną wszystkich produktów producenta o kodzie 2 
SELECT AVG(cena)
FROM Produkty
WHERE producent=2;
 

-- 8. Ile jest produktów o cenie większej lub równiej $180.
SELECT COUNT(*) 
FROM produkty
WHERE cena >= 180;

-- 9. Wyświetl nazwy i ceny wszystkich produktów o cenie większej lub równej  $180, i posortuj je najpierw według ceny (rosnąco), a następnie według nazwy (malejąco) 
SELECT nazwa, cena 
FROM produkty 
WHERE cena >= 180 
ORDER BY Cena, nazwa DESC;
-- 10. Wyświetl wszystkie dane z z tabeli produkty oraz wszystkie dane z tabeli producenci 
SELECT *
FROM produkty
    INNER JOIN producenci ON produkty.producent=producenci.kod;
-- 11. Wyświetl nazwę produktu, cenę i nazwę producenta dla wszystkich produktów 
SELECT Producenci.nazwa, cena,Produkty.nazwa 
FROM Producenci
    INNER JOIN Produkty On Producenci.kod=produkty.producent;
-- 12. Wyświetl średnią cenę produktów każdego producenta, pokazując tylko kod producenta
SELECT AVG(cena), Producent 
FROM Produkty
GROUP BY Producent;

-- 13. Wyświetl średnią cenę produktów każdego producenta, pokazując nazwę producenta 
SELECT AVG(cena),Producenci.nazwa
FROM Produkty
    INNER JOIN Producenci On Producenci.kod=produkty.producent
GROUP BY Producenci.nazwa;

-- 14. Wyświetl nazwę każdego producenta, którego produkty mają średnią cenę większą lub równą $150
SELECT AVG(cena),Producenci.nazwa
FROM Produkty
    INNER JOIN Producenci On Producenci.kod=produkty.producent
GROUP BY Producenci.nazwa
HAVING AVG(cena) >= 150;

-- 15. Wyświetl nazwę i cenę najtańszego produktu  (LIMIT lub podzapytanie)

SELECT nazwa,cena
from produkty
Order by cena 
LIMIT 1;


SELECT nazwa,cena
from produkty 
Where cena=
(
    SELECT MIN(cena)
    from produkty 
);


-- 16.Wyświetl nazwę każdego producenta razem z nazwą i najdroższą ceną ich produktów  
SELECT Producenci.nazwa , cena ,Produkty.nazwa 
FROM Producenci 
    INNER JOIN Produkty ON producenci.kod = Produkty.producent 
WHERE cena=(SELECT MAX(cena) 
            FROM produkty
            WHERE produkty.producent=producenci.kod );
-- 17. Dodaj nowy produkt:  Loudspeakers, $70, producent 2.
INSERT INTO produkty(nazwa, cena, producent) VALUES ('Loudspeakers', 70, 2);
-- 18. Zmień nazwę produktu o kodzie 8 na "Laser Printer".
UPDATE produkty
SET nazwa = "Laser Printer"
WHERE kod = 8;
-- 19. Wykonaj 10% przecenę każdego produktu 
UPDATE produkty
SET cena=cena*0.9;
-- 20. Wykonaj 10% przecenę każdego produktu o cenie większej lub równiej $120.

UPDATE produkty
SET cena=cena*0.9
WHERE cena >= 120;