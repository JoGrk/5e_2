SELECT id,nazwa
FROM typy_dan;

SELECT nazwa,cena
FROM dania
WHERE typ=1;

INSERT INTO dania(typ, nazwa, cena)
VALUES (4, 'zupa z elfa', 1000);