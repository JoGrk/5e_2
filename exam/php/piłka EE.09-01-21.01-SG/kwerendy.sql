-- ‒ Zapytanie 1: wybierające jedynie pola zespol1, zespol2, wynik, data_rozgrywki z tabeli rozgrywka dla rekordów o wartości pola zespol1 równej „EVG”

SELECT zespol1, zespol2, wynik, data_rozgrywki
FROM rozgrywka 
WHERE zespol1 = 'EVG';

-- ‒ Zapytanie 2: wybierające jedynie pola imie i nazwisko z tabeli zawodnik dla zawodników, dla których przypisane jest id pozycji równe 3
SELECT imie, nazwisko
FROM zawodnik 
WHERE pozycja_id = 3;

-- ‒ Zapytanie 3: wybierające jedynie pola id, nazwisko z tabeli zawodnik oraz nazwę pozycji z tabeli pozycja dla zawodników, którym przypisane jest id równe 1, 2 lub 3 
SELECT zawodnik.id, nazwisko
FROM zawodnik
    INNER JOIN pozycja ON pozycja.id = zawodnik.pozycja_id
WHERE zawodnik.id IN (1,2,3);


-- ‒ Zapytanie 4: usuwające tabelę liga
DROP TABLE liga;