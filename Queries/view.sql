
--view sk��daj�cy ze sob� Login u�ytkownik�w, wystawion� ocen� oraz film jej dotycz�cy
--view
CREATE VIEW v_oceny_film�w
AS
SELECT U�ytkownicy.Login, Oceny.Ocena, Filmy.Tytu� FROM Filmy
JOIN Oceny ON Filmy.ID_filmu = Oceny.ID_filmu
JOIN U�ytkownicy ON Oceny.Login = U�ytkownicy.Login;

