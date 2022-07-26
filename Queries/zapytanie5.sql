
--Ania lubi ogl¹daæ gale rozdania nagród filmowych, g³ównie Oskary oraz Z³ote Globy. Chce zobaczyæ, których nagród wiêcej przyznano filmom w bazie danych.


SELECT Instytucja, COUNT(ID_nagrody) AS IloœæRozdanychNagród
	FROM Nagrody
	WHERE Instytucja IN ('Oskary','Z³ote Globy')
	GROUP BY Instytucja
	ORDER BY IloœæRozdanychNagród DESC
	