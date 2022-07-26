--Ulubionymi gatunkami filmu Stasia s� sci-fi oraz akcja. Jego ulubieni aktorzy to Tom Cruise i Harrison Ford. Stasio chce wyszuka� wszystkie filmy z ulubionych gatunk�w, w kt�rych wyst�puj� jego ulubienie aktorzy (posortowane od najbardziej lubianych do najmniej).


SELECT DISTINCT Tytu�, �r_ocen
	FROM Filmy 
	JOIN Gatunki ON Filmy.ID_gatunku = Gatunki.ID_gatunku
	JOIN Wyst�py ON Filmy.ID_filmu = Wyst�py.ID_filmu
	JOIN Aktorzy ON Aktorzy.ID_aktora = Wyst�py.ID_aktora
	JOIN Osoby ON Aktorzy.PESEL = Osoby.PESEL
	WHERE (Imi� = 'Tom' AND Nazwisko = 'Cruise') OR (Imi� = 'Harrison' AND Nazwisko = 'Ford')
		AND Gatunki.ID_gatunku IN
			(SELECT ID_gatunku 
				FROM Gatunki
				WHERE Nazwa	IN('akcja', 'sci-fi'))
	ORDER BY �r_ocen DESC;
