Zapytanie 1: wybierające jedynie imię, nazwisko i koszt konferencji dla uczestników, którzy jeszcze nie zapłacili za konferencję
SELECT imie,nazwisko,koszt
FROM uczestnicy
WHERE zaplacono = 0; 
‒ Zapytanie 2: liczące dla wszystkich uczestników: średni koszt konferencji z nazwą kolumny (alias) „Średni koszt”, sumę kosztów z nazwą kolumny (alias) „Całkowity koszt”, liczbę zapisanych w bazie uczestników z nazwą kolumny (alias) „Liczba uczestników”
SELECT AVG(koszt) as Średni_koszt,SUM(koszt) as Całkowity_koszt,COUNT(*) as Liczba_uczestników
FROM uczestnicy;
‒ Zapytanie 3: wybierające jedynie nazwę wykładu i przypisane jej nazwiska i e-maile uczestników, dla tych uczestników, którzy zapłacili za konferencję. Należy posłużyć się relacją
SELECT nazwa,nazwisko,email
FROM uczestnicy
    JOIN wyklady ON wyklady.id=uczestnicy=wyklady_id
WHERE zaplacono = 1;
‒ Zapytanie 4: usuwające kolumnę z hasłem uczestnika
ALTER TABLE uczestnicy
DROP haslo;