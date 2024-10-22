-- ‒ Zapytanie 1: wstawiające do tabeli logowanie nick „Jeremi” z hasłem „Jer123”. Wstawianemu wierszowi należy nadać identyfikator, odpowiadający wartości klucza obcego dla wiersza z danymi „Jeremi Kowalski” z tabeli uczestnicy

insert into logowanie
values ((select logowanie_id from uczestnicy
where imie = 'Jeremi' and nazwisko = 'Kowalski' ),'Jeremi','Jer123');

select logowanie_id from uczestnicy
where imie = 'Jeremi' and nazwisko = 'Kowalski';

-- ‒ Zapytanie 2: obliczające średni rok urodzenia uczestników. Wybrana kolumna powinna mieć nazwę (alias) „Średni rok urodzenia”, a obliczony wynik powinien być zaokrąglony w dół do liczby całkowitej

select FLOOR(avg(rokUr)) as 'Średni rok urodzenia' 
from uczestnicy;

-- ‒ Zapytanie 3: wybierające jedynie imię i nazwisko uczestnika oraz odpowiadające mu nick i hasło dla imion rozpoczynających się literą J. Należy posłużyć się relacją
SELECT imie,nazwisko,nick,haslo
FROM uczestnicy
    INNER JOIN logowanie ON uczestnicy.logowanie_id=logowanie.id 
    WHERE imie LIKE 'J%';

-- ‒ Zapytanie 4: tworzące użytkownika uczestnik na localhost z hasłem Ucz123& 
CREATE USER 'uczestnik'@'localhost'
IDENTIFIED BY 'Ucz123&';

-- ‒ Zapytanie 5: nadające utworzonemu użytkownikowi prawa do wybierania i aktualizacji danych jedynie dla tabeli uczestnicy
GRANT SELECT , UPDATE ON 5e_2_chat.uczestnicy TO  'uczestnik'@'localhost';