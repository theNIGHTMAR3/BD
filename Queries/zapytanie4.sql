
-- Aktywni u�ytkownicy serwisu s� nagradzani i raz w miesi�cu sprawdzana jest ich aktywno�� w ocenianiu obejrzanych film�w. Tworzone jest wtedy zestawienie zliczaj�ce, TOP 3 u�ytkownik�w, kt�rzy wystawili najwi�cej opinii posortowane wzgl�dem ilo�ci ocen. 
--u�ycie view zawieraj�ce zestawienie login�w, wystawionych ocen oraz dotycz�cych ich film�w

SELECT TOP 3 Login, COUNT (Tytu�) AS Ilo��Ocen
	FROM v_oceny_film�w
	GROUP BY Login
	ORDER BY Ilo��Ocen DESC;