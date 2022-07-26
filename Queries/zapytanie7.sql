
--Jan obejrza³ jeden z filmów, którego re¿yserem by³ Quentin Tarantino i od razu spodoba³a mu siê jego twórczoœæ. Chce przeszukac bazê filmów w poszukiwaniu innych wyre¿yserowanych przez niego tytu³ów. Stwórz zestawienie wszytskich filmów, których re¿yserem jest Quentin Tarantino posortowanych rosn¹co wed³ug daty premiery.

SELECT DISTINCT Tytu³, Data
	FROM Filmy
	WHERE ID_re¿ = 
		(SELECT ID_re¿
			FROM Re¿yserzy
			JOIN Osoby ON Osoby.PESEL=Re¿yserzy.PESEL
			WHERE Osoby.Imiê='Quentin' AND Nazwisko='Tarantino')		
	ORDER BY Data;