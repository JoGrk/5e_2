-- ‒ Zapytanie 1: wybierające jedynie nazwy wycieczek, których początek jest w Muszynie, Wieliczce
SELECT nazwa
FROM wycieczki
WHERE poczatek IN ('Muszyna', 'Wieliczka');
-- ‒ Zapytanie 2: wybierające jedynie pola nazwa, opis i poczatek z tabeli wycieczki oraz odpowiadające im pole zrodlo z tabeli zdjecia. Należy posłużyć się relacją
SELECT nazwa, opis, poczatek, zrodlo
FROM wycieczki
    JOIN zdjecia ON wycieczki.zdjecia_id=zdjecia.id;
-- ‒ Zapytanie 3: zliczające liczbę wycieczek wpisanych do tabeli wycieczki 
SELECT COUNT(*) AS ilosc FROM wycieczki;
-- ‒ Zapytanie 4: modyfikujące strukturę tabeli wycieczki, poprzez dodanie kolumny ocena typu całkowitego
ALTER TABLE wycieczki
ADD COLUMN ocena int;