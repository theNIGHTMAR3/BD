
--Ania lubi ogl�da� gale rozdania nagr�d filmowych, g��wnie Oskary oraz Z�ote Globy. Chce zobaczy�, kt�rych nagr�d wi�cej przyznano filmom w bazie danych.


SELECT Instytucja, COUNT(ID_nagrody) AS Ilo��RozdanychNagr�d
	FROM Nagrody
	WHERE Instytucja IN ('Oskary','Z�ote Globy')
	GROUP BY Instytucja
	ORDER BY Ilo��RozdanychNagr�d DESC
	