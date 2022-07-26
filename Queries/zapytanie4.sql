
-- Aktywni u¿ytkownicy serwisu s¹ nagradzani i raz w miesi¹cu sprawdzana jest ich aktywnoœæ w ocenianiu obejrzanych filmów. Tworzone jest wtedy zestawienie zliczaj¹ce, TOP 3 u¿ytkowników, którzy wystawili najwiêcej opinii posortowane wzglêdem iloœci ocen. 
--u¿ycie view zawieraj¹ce zestawienie loginów, wystawionych ocen oraz dotycz¹cych ich filmów

SELECT TOP 3 Login, COUNT (Tytu³) AS IloœæOcen
	FROM v_oceny_filmów
	GROUP BY Login
	ORDER BY IloœæOcen DESC;