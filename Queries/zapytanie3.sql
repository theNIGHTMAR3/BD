
--	Halinka chce zostac aktorka. Jest ciekawa ile zarabia znany aktor. Chce wyszukać zarobek nagradzanych atorów (posortowany malejąco) oraz w jakich innych filmach grali i jakie te filmy miały oceny(posortowane od najbardziej lubianych do najmniej)

SELECT Imię, Nazwisko, Zarobek, Rola, Tytuł, Śr_ocen
	FROM Osoby
	JOIN Aktorzy ON Aktorzy.PESEL = Osoby.PESEL
	JOIN Występy ON Aktorzy.ID_aktora = Występy.ID_aktora
	JOIN Filmy ON Filmy.ID_filmu = Występy.ID_filmu
	WHERE Rola IN
		(SELECT Rola
			FROM Występy
			WHERE Rola != 'Statysta')
	ORDER BY Zarobek DESC, Śr_ocen DESC
	