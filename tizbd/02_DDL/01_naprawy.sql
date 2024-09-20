CREATE DATABASE 5e_2_naprawy;
USE 5e_2_naprawy;

-- . Utwórz tabelę pracownik(id_pracownik, imie, nazwisko, pesel, data_zatr, pensja), gdzie
-- id_pracownik – jest numerem pracownika nadawanym automatycznie, jest to klucz główny
-- imie i nazwisko – to niepuste łańcuchy znaków zmiennej długości,
-- pesel – stała długość, 11 znaków
-- data_zatr – domyślna wartość daty zatrudnienia to bieżąca data systemowa (curdate)
-- pensja – nie może być niższa niż 1000zł, dane przechowujemy jako stałoprzecinkowe (6 przed przecinkiem, 2 po przecinku)
CREATE TABLE pracownik(
    id_pracownik int AUTO_INCREMENT PRIMARY KEY,
    imie varchar(255) NOT NULL,
    nazwisko varchar(255) NOT NULL,
    pesel char(11),
    data_zatr DATE DEFAULT(CURDATE()),
    pensja decimal(8,2) check(pensja>=1000)
);

 
-- 2. Utwórz tabelę naprawa(id_naprawa, data_przyjecia, opis_usterki, zaliczka), gdzie
-- id_naprawa – jest unikatowym, nadawanym automatycznie numerem naprawy, jest to klucz główny,
-- data_przyjecia – nie może być późniejsza niż bieżąca data systemowa,
-- opis usterki – nie może być pusty, musi mieć długość powyżej 10 znaków, (length)
-- zaliczka – nie może być mniejsza niż 100zł ani większa niż 1000zł.
 
CREATE TABLE naprawa(
    id_naprawa int AUTO_INCREMENT PRIMARY KEY,
    data_przyjecia date,
    opis_usterki varchar(255) NOT NULL CHECK(length(opis_usterki)>10),
    zaliczka int check(zaliczka BETWEEN 100 and 1000)
);
-- 3. Utwórz tabelę wykonane_naprawy(id_pracownik, id_naprawa, data_naprawy, opis_naprawy, cena), gdzie
-- id_pracownik – identyfikator pracownika wykonującego naprawę, klucz obcy powiązany z tabelą pracownik,
-- id_naprawa – identyfikator zgłoszonej naprawy, klucz obcy powiązany z tabelą naprawa,
-- data_naprawy – domyślna wartość daty naprawy to bieżąca data systemowa,
-- opis_naprawy – niepusty opis informujący o sposobie naprawy,
-- cena – cena naprawy.
    CREATE TABLE wykonane_naprawy (
        id_pracownik INT,
        FOREIGN KEY (id_pracownik) REFERENCES pracownik(id_pracownik),
        id_naprawa INT,
        FOREIGN KEY (id_naprawa) REFERENCES naprawa (id_naprawa),
        data_naprawy DATE DEFAULT(CURDATE()),
        opis_naprawy varchar(255) NOT NULL,
        cena int,
        PRIMARY KEY(id_naprawa,id_pracownik)
    );
