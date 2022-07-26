
--Jan obejrza� jeden z film�w, kt�rego re�yserem by� Quentin Tarantino i od razu spodoba�a mu si� jego tw�rczo��. Chce przeszukac baz� film�w w poszukiwaniu innych wyre�yserowanych przez niego tytu��w. Stw�rz zestawienie wszytskich film�w, kt�rych re�yserem jest Quentin Tarantino posortowanych rosn�co wed�ug daty premiery.

SELECT DISTINCT Tytu�, Data
	FROM Filmy
	WHERE ID_re� = 
		(SELECT ID_re�
			FROM Re�yserzy
			JOIN Osoby ON Osoby.PESEL=Re�yserzy.PESEL
			WHERE Osoby.Imi�='Quentin' AND Nazwisko='Tarantino')		
	ORDER BY Data;