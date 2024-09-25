-- Zapytanie 1: wstawiające do tabeli filmy jeden rekord o danych: film „Suburbicon” z roku 2017, gatunek filmu to komedia, ocena jest równa 5
insert into filmy (tytul,rok,ocena,gatunki_id)
values("suburbicon",2017,5,5);

insert into filmy (tytul,rok,ocena,gatunki_id)
values("suburbicon",2017,5,
    (SELECT id FROM gatunki WHERE nazwa='komedia')
);

-- Zapytanie 2: wybierające jedynie pole tytul z tabeli filmy oraz odpowiadające mu pole nazwa z tabeli gatunki dla filmów, dla których pole ocena ma wartość 6. Należy posłużyć się relacją

SELECT tytul, gatunki.nazwa
FROM filmy 
    INNER JOIN gatunki ON filmy.gatunki_id=gatunki.id
WHERE ocena=6;
-- Zapytanie 3: wybierające jedynie pola tytul oraz rok z tabeli filmy tylko dla gatunku dramatów o ocenie równej 5

-- Zapytanie 4: tworzące tabelę o nazwie aktorzy i polach id typu numerycznego, imie typu tekstowego, nazwisko typu tekstowego. Pole id nie może przyjmować wartości NULL