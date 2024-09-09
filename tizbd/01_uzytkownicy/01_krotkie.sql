-- 1. Utwórz użytkowników jeden i dwa (bez hasła).
CREATE USER jeden; 
CREATE USER dwa;
--  A. Nadaj uprawnienia wprowadzania, zmiany i usuwania danych w całej bazie komis dla użytkownika jeden
GRANT INSERT,UPDATE,SELECT,DELETE ON 4e_2_komis.* TO 'jeden'@'localhost';
-- B. nadaj wszystkie uprawnienia do tabeli Auta użytkownikowi dwa

GRANT ALL ON 4e_2_komis.Auta TO 'dwa'@"localhost";

-- C. odbierz użytkownikowi jeden prawa usuwania danych

REVOKE DELETE ON 4e_2_komis.* FROM "jeden"@"localhost";

-- D. odbierz wszystkie uprawnienia użytkownikowi dwa do tabeli Auta

REVOKE ALL ON 4e_2_komis.auta FROM 'dwa'@'localhost';

-- 2. 
-- A. Zaloguj się jako użytkownik jeden i ustaw hasło 'zaq1@WSX'
mysql -u jeden 
SET PASSWORD = PASSWORD('zaq1@WSX');
-- B. Ustaw hasło dla użytkownika dwa na 'zaq1@WSX'
mysql -u dwa
SET PASSWORD = PASSWORD('zaq!@WSX');
-- C. z poziomu konta root zmień hasło dla użytkownika jeden na 'haslo'
SET PASSWORD FOR 'jeden' = PASSWORD('zaq!@WSX');