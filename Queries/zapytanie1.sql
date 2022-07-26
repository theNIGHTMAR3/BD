-- Gienio nie lubi d�ugich film�w oraz bardzo szanuje nagradzanych re�yserow. Chce wyszuka� wszystkie filmy trwaj�ce kr�cej niz 2 godziny, kt�rych re�yser zosta� nagrodzony (film dostal nagrode za re�yserie), posortowane od najkr�tszych do najd�u�szych.

SELECT Tytu�, D�ugo��
	FROM Filmy 
	JOIN Nagrody ON Filmy.ID_filmu = Nagrody.ID_filmu
	WHERE Nagrodzenie='re�yser' AND D�ugo�� < 120
	ORDER BY D�ugo��;
