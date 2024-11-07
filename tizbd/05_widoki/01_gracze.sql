-- 1. Zaimportuj dane

-- 2 Przygotuj widok Gracze2018  ilu graczy dołączyło do gry w 2018 z poszczególnych krajów.
CREATE VIEW Gracze2018 AS 
SELECT COUNT(*) AS ilosc, kraj
FROM gracze 
WHERE data_dolaczenia LIKE '2018%'
GROUP BY kraj;


-- 3. Korzystając z widoku Gracze2018 podaj 5 krajów, z których najwięcej graczy dołączyło do gry w 2018 roku. Dla każdego z tych krajów podaj liczbę graczy, którzy dołączyli w 2018 roku.
SELECT kraj, ilosc 
FROM Gracze2018
ORDER BY ilosc DESC
LIMIT 5;

-- 4. Utwórz widok klasyJednostki, który zawiera pola: id_jednostki, nazwa, sila, strzal.
CREATE VIEW klasyJEdnostki AS
SELECT id_jednostki, jednostki.nazwa, sila, strzal
FROM klasy
    INNER JOIN jednostki ON klasy.nazwa = jednostki.nazwa;

-- 5. Korzystając z widoku klasyJednostki  podaj sumę wartości pola strzał (strzal) dla każdej klasy jednostek, które mają „elf” jako część nazwy.
SELECT SUM(strzal), nazwa
FROM klasyJEdnostki
    WHERE nazwa LIKE "%elf%"
    GROUP BY nazwa;


-- 6. Przygotuj widok Artylerzysci zawierający numery graczy, którzy mają jednostki o nazwie artylerzysta
CREATE VIEW Artylerzysci AS 
SELECT id_gracza
FROM jednostki
WHERE nazwa='artylerzysta';

-- 7. Podaj numery graczy, którzy nie mają artylerzystów (jednostek o nazwie artylerzysta). Numery podaj w porządku rosnącym (numery graczy, których nie ma w wyniku zwracanym przez Artylerzysci) (?)
SELECT distinct id_gracza
FROM jednostki
WHERE id_gracza NOT IN(SELECT id_gracza FROM Artylerzysci)
ORDER BY id_gracza;
