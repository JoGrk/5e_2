‒ Zapytanie 1: wybierające jedynie pola tytul i plik z tabeli zdjecia dla zdjęć z polubieniami większymi lub
równymi 100
SELECT tytul,plik 
FROM zdjecia 
WHERE polubienia >=100;

‒ Zapytanie 2: wybierające jedynie pola plik, tytul, polubienia z tabeli zdjecia oraz odpowiadające im pola
imie i nazwisko z tabeli autorzy posortowane rosnąco według nazwiska. Należy posłużyć się relacją
SELECT plik,tytul,polubienia ,imie,nazwisko
FROM zdjecia 
INNER JOIN autorzy ON zdjecia.autorzy_id=autorzy.id
ORDER BY nazwisko  ;

‒ Zapytanie 3: wybierające jedynie pole imie oraz liczące ile jest zdjęć dla tego imienia. Należy
posłużyć się relacją

SELECT imie,COUNT(*) AS zdjecia
FROM autorzy
INNER JOIN zdjecia ON autorzy.id=zdjecia.autorzy_id
GROUP BY imie;

‒ Zapytanie 4: modyfikujące strukturę tabeli zdjecia. Dodana jest kolumna rozmiarPliku typu
całkowitego

ALTER TABLE zdjecia 
ADD rozmiarPliku int ;