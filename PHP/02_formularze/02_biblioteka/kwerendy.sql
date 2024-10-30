-- Wyświetla wszystkie książki wypożyczone przez  czytelnika Adam Milek (kiedykolwiek, nie tylko aktualnie) w postaci osobnych paragrafów. ( tytuł)

select tytul 
from ksiazki 
inner join wypozyczenia
 on ksiazki.id = wypozyczenia.id_ksiazka
inner join czytelnicy
 on wypozyczenia.id_czytelnik = czytelnicy.id
where imie = 'Adam' and nazwisko = 'Milek';

-------------------

-- wyświetli id i nazwa wydawnictwa z tabeli wydawnictwa
SELECT id, nazwa
FROM wydawnictwa;

-- wyświetli tytuły książek wydawnictwa o id 1
SELECT tytul
FROM ksiazki
WHERE ID_wydawnictwo = 1;


--imei i nazwisko autoa id 

select id, imie ,nazwisko 
FROM autorzy;


SELECT imie,nazwisko , tytul 
FROM autorzy 
INNER JOIN ksiazki ON autorzy.id=ksiazki.id_autor
WHERE id_autor=1 ;

DELETE FROM ksiazki
WHERE tytul="Poezje";