-- Gienio nie lubi d³ugich filmów oraz bardzo szanuje nagradzanych re¿yserow. Chce wyszukaæ wszystkie filmy trwaj¹ce krócej niz 2 godziny, których re¿yser zosta³ nagrodzony (film dostal nagrode za re¿yserie), posortowane od najkrótszych do najd³u¿szych.

SELECT Tytu³, D³ugoœæ
	FROM Filmy 
	JOIN Nagrody ON Filmy.ID_filmu = Nagrody.ID_filmu
	WHERE Nagrodzenie='re¿yser' AND D³ugoœæ < 120
	ORDER BY D³ugoœæ;
