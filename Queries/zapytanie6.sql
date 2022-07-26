
--W³aœciciel serwisu mo¿e chcieæ wiedzieæ, którzy u¿ytkownicy s¹ wymagaj¹cy w stosunku do filmów i daj¹ niskie oceny oraz których filmy bardzo ciesz¹ co sprawia, ¿e wystawione przez nich oceny s¹ wysokie. Stwórz zestawienie wszystkich u¿ytkowników oraz œredni¹ wystawionych przez nich ocen posortowan¹ rosn¹co, zaokr¹glon¹ do 1 miejsca po przecinku. 
--Warto do tego wykorzystaæ wczeœniej stworzony view

SELECT Login, ROUND(AVG(Ocena),1) AS ŒreniaWystawionychOcen
	FROM v_oceny_filmów
	GROUP BY Login
	ORDER BY ŒreniaWystawionychOcen;
