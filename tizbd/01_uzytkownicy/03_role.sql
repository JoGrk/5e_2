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
ALTER USER write2
  IDENTIFIED BY '1234' ;
-- D. użytkownik write powinien mieć prawo tylko do 100 operacji UPDATE na godzinę
ALTER USER write2
WITH 
MAX_UPDATES_PER_HOUR 100;
-- E. odblokuj konto read2
 ALTER USER read2 
 ACCOUNT UNLOCK;

-- 3.Określ uprawnienia:
-- A. Nadaj wszystkie prawa dla użytkownika dev dla wszystkich tabel w bazie crm
GRANT ALL ON crm2.* TO dev2;
-- B. Daj prawo użytkownikowi write do modyfikowania struktury tabel w bazie crm
GRANT alter ON crm2.* TO write2;
-- C. daj prawo użytkownikowi read do przeglądania oraz usuwania danych w tabeli customers w bazie crm
GRANT SELECT,DELETE ON crm2.* TO read2;
-- 4. Odbierz użytkownikowi read prawo do przeglądania danych w tabeli customers
REVOKE SELECT ON crm2.* FROM read2;

-- 5. Zmień nazwę użytkownika dev na admin
RENAME USER dev2 to admin2;


-- 6. Ustaw hasło użytkownikowi read '1234' (użyj set password)

SET PASSWORD FOR read2 = Password('1234');

-- 7. Sprawdź uprawnienia:

-- A. użytkownika admin
SHOW GRANTS FOR admin2;
-- B. użytkownika write
SHOW GRANTS FOR write2;
-- 8. Utwórz role write_customers oraz read_customers
CREATE ROLE 'write_customers2';

CREATE ROLE 'read_customers2';


-- 9. Nadaj uprawnienia rolom:

-- A. write_customers prawa do wstawiania oraz modyfikowania wybranych rekordów
GRANT INSERT, SELECT, UPDATE ON crm2.customers TO 'write_customers2';
-- B. read_customers z prawem do przeglądania tabeli customers
GRANT SELECT ON crm2.* TO 'read_customers2';
-- 10. Przypisz role użytkownikom:

-- write_customers dla write
GRANT 'write_customers2' TO write2;
-- read_customers dla read
GRANT 'read_customers2' TO read2;
-- 11. Sprawdź uprawnienia:
SHOW GRANTS FOR write2;
-- użytkownika write
-- użytkownika read (czy ma prawo do usuwania danych?)
SHOW GRANTS FOR read2;
-- roli write_customers;
SHOW GRANTS FOR 'write_customers2';
-- roli read_customers
SHOW GRANTS FOR 'read_customers2'; 
-- 12. Zaloguj się jako read i sprawdź uprawnienia.

-- czy użytkownik read ma prawo do przeglądania danych?
-- jeśli jest taka potrzeba użyj SET ROLE aby "włączyć" rolę
-- czy użytkownik read ma prawo do usunięcia klienta o id 1

-- 13. Z poziomu root ustaw jako domyślną rolę write_customers dla użytkownika write  (SET DEFAULT ROLE)

-- 14. Zaloguj się jako write i sprawdź, czy możesz zmienić nazwisko klienta o id=2 na Tree 

-- 15. Usuń

-- A. rolę write_customers
-- B. Usuń użytkownika read