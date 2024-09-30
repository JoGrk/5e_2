-- − Zapytanie 1: wybierające jedynie pola imie i nazwisko dla wszystkich rekordów w tabeli autorzy, posortowane rosnąco nazwiskami autorów

SELECT imie, nazwisko
FROM autorzy
ORDER BY nazwisko ASC;

-- − Zapytanie 2: wstawiające do tabeli czytelnicy nowy rekord z danymi: Ewa Kowalska z kodem 145321. Wartość klucza głównego nadawana automatycznie

INSERT INTO czytelnicy (imie, nazwisko, kod)
VALUES ("Ewa", "Kowalska", 145321);

-- − Zapytanie 3: wybierające jedynie pole tytul dla wszystkich utworów w tabeli ksiazki, należących do kategorii dramat

SELECT tytul 
FROM ksiazki
INNER JOIN kategorie ON ksiazki.id_kategoria = kategorie.id
WHERE kategorie.nazwa = "dramat";

-- − Zapytanie 4: wybierające jedynie pole tytul wszystkich utworów w tabeli książki, wypożyczonych przez czytelnika o identyfikatorze 2. W zapytaniu 4 należy posłużyć się relacją

SELECT tytul 
FROM ksiazki
INNER JOIN wypozyczenia ON ksiazki.id = wypozyczenia.id_ksiazka
INNER JOIN czytelnicy ON wypozyczenia.id_czytelnik = czytelnicy.id
WHERE czytelnicy.id = 2;

-- − Zapytanie 5: Ustawiające w tabeli czytelnicy kod czytelnika Adam Milek na wartość '56677'

UPDATE czytelnicy
SET kod = 56677
WHERE imie = 'Adam' AND nazwisko = 'Milek';

-- − Zapytanie 6: wybierające jedynie pola imie i nazwisko dla wszystkich rekordów w tabeli czytelnicy, posortowane rosnąco według nazwisk

SELECT imie, nazwisko
FROM czytelnicy
ORDER BY nazwisko ASC;

-- − Zapytanie 7: wybierające jedynie pole tytul dla wszystkich utworów, których nazwisko autora to Sienkiewicz

SELECT tytul
FROM ksiazki 
INNER JOIN autorzy ON ksiazki.id_autor = autorzy.id
WHERE autorzy.nazwisko = 'Sienkiewicz';

-- − Zapytanie 8: wybierające jedynie pole nazwisko dla wszystkich rekordów w tabeli autorzy oraz obliczające liczbę tytułów 
-- danego autora znajdujących się w bazie biblioteka. Nazwa kolumny (alias) dla zliczania tytułów: ile_tytulow

SELECT nazwisko, COUNT(tytlu) AS ile_tytulow
FROM autorzy
LEFT JOIN ksiazki ON autorzy.id = ksiazki.id_autor
GROUP BY nazwisko;

-- - Zapytanie 9: tworzące użytkownika andrzej na localhost z hasłem andrzej1@

CREATE USER 'andrzej'@'localhost' IDENTIFIED BY 'andrzej1@';

-- - Zapytanie 10: nadające użytkownikowi andrzej prawo do przeglądania danych i zmieniania danych w tabeli ksiazki

GRANT SELECT, UPDATE ON ksiazki TO andrzej;