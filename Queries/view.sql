
--view sk³¹daj¹cy ze sob¹ Login u¿ytkowników, wystawion¹ ocenê oraz film jej dotycz¹cy
--view
CREATE VIEW v_oceny_filmów
AS
SELECT U¿ytkownicy.Login, Oceny.Ocena, Filmy.Tytu³ FROM Filmy
JOIN Oceny ON Filmy.ID_filmu = Oceny.ID_filmu
JOIN U¿ytkownicy ON Oceny.Login = U¿ytkownicy.Login;

