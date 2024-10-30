INSERT INTO czytelnicy(imie, nazwisko, kod)    
VALUES ('Anna', 'Michalak', 'an05mi');
//2
SELECT imie, nazwisko
FROM czytelnicy;
//3
SELECT tytul, imie, nazwisko 
FROM ksiazki 
    JOIN autorzy ON ksiazki.id_autor = autorzy.id  
WHERE id_autor = 1;
//4
SELECT nazwisko, COUNT(*) AS ilosc
FROM autorzy
    JOIN ksiazki ON autorzy.id = ksiazki.id_autor
GROUP BY nazwisko;


