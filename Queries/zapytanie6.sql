
--W�a�ciciel serwisu mo�e chcie� wiedzie�, kt�rzy u�ytkownicy s� wymagaj�cy w stosunku do film�w i daj� niskie oceny oraz kt�rych filmy bardzo ciesz� co sprawia, �e wystawione przez nich oceny s� wysokie. Stw�rz zestawienie wszystkich u�ytkownik�w oraz �redni� wystawionych przez nich ocen posortowan� rosn�co, zaokr�glon� do 1 miejsca po przecinku. 
--Warto do tego wykorzysta� wcze�niej stworzony view

SELECT Login, ROUND(AVG(Ocena),1) AS �reniaWystawionychOcen
	FROM v_oceny_film�w
	GROUP BY Login
	ORDER BY �reniaWystawionychOcen;
