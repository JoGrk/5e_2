‒ Zapytanie 1: wybierające jedynie pole haslo z tabeli uzytkownicy dla użytkownika o loginie Justyna
SELECT haslo
FROM uzytkownicy
WHERE login='Justyna';
‒ Zapytanie 2: liczące liczbę wierszy w tabeli dane
SELECT COUNT(*) as ilosc
FROM dane;
‒ Zapytanie 3: wybierające jedynie pole login z tabeli uzytkownicy i odpowiadające mu pola rok_urodz, przyjaciol, hobby, zdjecie z tabeli dane dla użytkownika o loginie Justyna. Tabele połączone są relacją 1..1, za pomocą kluczy głównych
SELECT login,rok_urodz,przyjaciol,hobby,zdjecie
FROM uzytkownicy
    INNER JOIN dane ON dane.id=uzytkownicy.id
WHERE login='Justyna';