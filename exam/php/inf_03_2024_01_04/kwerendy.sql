-- ‒ Zapytanie 1: wybierające z tabeli Klienci posortowane malejąco według punktów jedynie imię, nazwisko i punkty trzech klientów, których liczba punktów jest najwyższa
SELECT imie, nazwisko, punkty
FROM Klienci
ORDER BY punkty DESC
LIMIT 3;
-- ‒ Zapytanie 2: wybierające nazwę z tabeli Typy oraz liczbę klientów przypisanych do każdego typu. Należy posłużyć się relacją
SELECT nazwa, COUNT(*)
FROM Typy
    INNER JOIN Klienci ON Klienci.typy_id = typy.id
GROUP BY nazwa;
-- ‒ Zapytanie 3: wybierające jedynie pola zdjecie, imie z tabeli Klienci oraz odpowiadające im pole opinia z tabeli opinie dla klientów, których typ ma id o wartościach 2, 3. Należy posłużyć się relacją

SELECT zdjecie, imie, opinia
FROM Klienci 
    JOIN opinie ON klienci.id = opinie.Klienci_id
WHERE Typy_id IN (2,3);

-- ‒ Zapytanie 4: dodające do tabeli Klienci kolumnę o nazwie adres i typie napisowym, maksymalnie 50-znakowym

ALTER TABLE Klienci
ADD adres varchar(50);