-- 1. Dana jest tabela CREATE TABLE student(id_student INT auto_increment PRIMARY KEY, nazwisko VARCHAR(20), nr_indeksu INT, stypendium dec(6,2)); 
 
-- A.  Wprowadź ograniczenia na tabelę student:
-- nazwisko – niepusta kolumna,
-- nr_indeksu – unikatowa kolumna,
-- stypendium –nie może być niższe niż 1000zł,
 
-- B. Dodaj niepustą kolumnę imie (powinna znaleźć się za polem nazwisko).
 
-- C. Zmień typ pola stypendium tak, aby było możliwe wpisanie stypendium o wartości 10000
 
-- D. Dodaj wartość domyślną dla stypendium: 1000
 
 

 

-- 2.  Dane są tabele:
-- CREATE TABLE dostawca(id_dostawca INT auto_increment PRIMARY KEY, nazwa VARCHAR(30));

-- CREATE TABLE towar(id_towar INT auto_increment PRIMARY KEY, kod_kreskowy INT, id_dostawca INT);
 
-- Zmodyfikuj powyższe tabele:
-- A. kolumna nazwa z tabeli dostawca powinna być unikatowa,
 
-- B. do tabeli towar dodaj niepustą kolumnę nazwa (za polem kod_kreskowy),
 
-- C. kolumna kod_kreskowy w tabeli towar powinna być unikatowa,
 
-- D.  kolumna id_dostawca z tabeli towar jest kluczem obcym z tabeli dostawca.
 
-- E. kolumna nazwa w tabeli dostawca powinna dopuszczać dłuższe nazwy (zmień typ)
 
-- 3.  Dane są tabele: 
--  CREATE TABLE kraj(id_kraj INT auto_increment PRIMARY KEY, nazwa VARCHAR(30));
-- CREATE TABLE gatunek(id_gatunek INT auto_increment PRIMARY KEY, nazwa VARCHAR(30));
-- CREATE TABLE zwierze(id_zwierze INT auto_increment PRIMARY KEY, id_gatunek INT, id_kraj INT, cena dec(6,2));
 
-- Zmodyfikuj powyższe tabele:
-- A. kolumny nazwa z tabel kraj i gatunek mają być niepuste i unikatowe,

-- B. W tabeli zwierze zmień nazwę kolumny id_gatunek na gatunek_id oraz id_kraj na kraj_id
 
-- C. kolumna gatunek_id z tabeli zwierze jest kluczem obcym z tabeli gatunek,
 
-- D. kolumna kraj_id z tabeli zwierze jest kluczem obcym z tabeli kraj