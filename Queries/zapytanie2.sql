--Ulubionymi gatunkami filmu Stasia s¹ sci-fi oraz akcja. Jego ulubieni aktorzy to Tom Cruise i Harrison Ford. Stasio chce wyszukaæ wszystkie filmy z ulubionych gatunków, w których wystêpuj¹ jego ulubienie aktorzy (posortowane od najbardziej lubianych do najmniej).


SELECT DISTINCT Tytu³, Œr_ocen
	FROM Filmy 
	JOIN Gatunki ON Filmy.ID_gatunku = Gatunki.ID_gatunku
	JOIN Wystêpy ON Filmy.ID_filmu = Wystêpy.ID_filmu
	JOIN Aktorzy ON Aktorzy.ID_aktora = Wystêpy.ID_aktora
	JOIN Osoby ON Aktorzy.PESEL = Osoby.PESEL
	WHERE (Imiê = 'Tom' AND Nazwisko = 'Cruise') OR (Imiê = 'Harrison' AND Nazwisko = 'Ford')
		AND Gatunki.ID_gatunku IN
			(SELECT ID_gatunku 
				FROM Gatunki
				WHERE Nazwa	IN('akcja', 'sci-fi'))
	ORDER BY Œr_ocen DESC;
