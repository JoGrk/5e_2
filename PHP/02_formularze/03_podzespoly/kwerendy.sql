--  Dodaje dane do tabeli podzespoły (typy_id, nazwa, cena)
INSERT INTO podzespoly (typy_id,nazwa,cena)
VALUES(1,'ramm','123');
--  Wyświetla nazwy podzespołów i cenę (tabela podzespoły)
SELECT nazwa,cena 
FROM podzespoly;
--  dla poszczególnych typów podzespołów wyświetla maksymalną cenę
SELECT MAX(cena),typy_id
FROM podzespoly
GROUP BY typy_id;
--  wyświetli nazwę podzespołów i nazwy ich typów(kategorii) (tabela podzespoly i typy)
SELECT nazwa ,kategoria
FROM podzespoly
    INNER JOIN typy ON podzespoly.typy_id=typy.id;
-- Uzupełnij powyższe zapytanie o  id podzespołu i cenę
SELECT nazwa,podzespoly.id,cena ,kategoria
FROM podzespoly
    INNER JOIN typy ON podzespoly.typy_id=typy.id;
-- Usuwa podzespół o podanym id
DELETE FROM podzespoly
WHERE ID = 1;
