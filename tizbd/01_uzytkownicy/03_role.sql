CREATE DATABASE crm2;

USE crm2;

CREATE TABLE customers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL, 
    last_name VARCHAR(255) NOT NULL, 
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(255)
);

INSERT INTO customers(first_name,last_name,phone,email) VALUES('John','Doe','(408)-987-7654','john.doe@mysqltutorial.org'), ('Lily','Bush','(408)-987-7985','lily.bush@mysqltutorial.org');

-- 1. Utwórz użytkowników: dev1 z hasłem 1234 oraz read1, write1 bez hasła  (dev2, read2, write2)
CREATE USER dev2 identified by '1234';
CREATE USER read2; 
CREATE USER write2; 

-- 2.Zmodyfikuj ustawienia kont:
-- A. hasło dla użytkownika dev powinno wygasnąć za miesiąc
ALTER USER dev2
PASSWORD EXPIRE INTERVAL 30 DAY;
-- B. zablokuj konto read
ALTER USER read2
ACCOUNT LOCK;
-- C. ustaw hasło dla konta write
-- D. użytkownik write powinien mieć prawo tylko do 100 operacji UPDATE na godzinę
-- E. odblokuj konto read

-- 3.Określ uprawnienia:
-- Nadaj wszystkie prawa dla użytkownika dev dla wszystkich tabel w bazie crm
-- Daj prawo użytkownikowi write do modyfikowania struktury tabel w bazie crm
-- daj prawo użytkownikowi read do przeglądania oraz usuwania danych w tabeli customers w bazie crm

-- Odbierz użytkownikowi read prawo do przeglądania danych w tabeli customers
-- Zmień nazwę użytkownika dev na admin

-- Ustaw hasło użytkownikowi read '1234' (użyj set password)

-- Sprawdź uprawnienia:
-- użytkownika admin
-- użytkownika write
-- Utwórz role write_customers oraz read_customers

-- Nadaj uprawnienia rolom:
-- write_customers prawa do wstawiania oraz modyfikowania i usuwania wybranych rekordów
-- read_customers z prawem do przeglądania tabeli customers

-- Przypisz role użytkownikom:
-- write_customers dla write
-- read_customers dla read

-- Sprawdź uprawnienia:
-- użytkownika write
-- użytkownika read (czy ma prawo do usuwania danych?)

-- Zaloguj się i sprawdź uprawnienia. Jeśli jest taka potrzeba użyj SET ROLE i/lub SET DEFAULT ROLE

-- usuń rolę write_customers

-- Usuń użytkownika read