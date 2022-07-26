

--osoby
insert into Osoby values ('12345678911','Micha³','Kuprianowicz','M','2001-01-08'),
						 ('12345678912','Jan','Nowak','M','2001-01-08'),
						 ('12345678913','Jan','Kowalski','M','2001-01-07'),
						 ('12345678914','Ela','Kowalska','K','2001-01-06'),
						 ('12345678916','Tom','Cruise','M','1962-07-03'),
						 ('12345678921','Harrison','Ford','M','1942-07-13'),
						 ('12345678922','Mark','Hamill','M','1951-09-25'),
						 ('12345678917','Steven','Spielberg','M','1946-12-18'),
						 ('12345678920','George','Lucas','M','1944-05-14'),
						 ('12345678918','Stan','Lee','M','1922-12-28'),
						 ('12345678919','Tony','Scott','M','1944-06-21'),
						 ('12345678925','John','Smith','M','1990-08-02'),
						 ('12345678926','Jessica','Miller','K','1992-11-13'),
						 ('12345678927','James','Cameron','M','1952-08-16'),
						 ('12345678928','Quentin','Tarantino','M','1963-03-27'),
						 ('12345678929','Kurt','Russel','M','1951-03-17'),
						 ('12345678930','Samuel','L. Jackson','M','1948-12-21'),
						 ('12345678931','Richard ','N. Gladstein','M','1961-06-04'),
						 ('12345678932','Jennifer ','Lason Leigh','K','1962-02-05'),
						 ('12345678933','Sam ','Worthington','M','1976-08-02'),
						 ('12345678934','Tim ','Johnson','M','1977-11-29');


--aktorzy
insert into Aktorzy values ('12345678916','St. Xavier High School'),
						   ('12345678921','Maine East High School in Park Ridge'),
						   ('12345678911','Szko³a aktorska w Bydgoszczy'),
						   ('12345678913','Szko³a aktorska w Warszawie'),
						   ('12345678922','Yokohama’s High School'),
						   ('12345678929','Thousand Oaks High School'),
						   ('12345678930','Morehouse College Atlanta'),
						   ('12345678932',null),
						   ('12345678933','National Institute of Dramatic Art in Sydney');
--re¿yserzy
insert into Re¿yserzy values ('12345678917','Wy¿sze'),
							 ('12345678919',null),
							 ('12345678920','Wy¿sze'),
							 ('12345678927','Wy¿sze'),
							 ('12345678928','Wy¿sze');

--producenci
insert into Producenci values ('12345678918','Atlas Comics',100000.0),
							  ('12345678920',null,150000000.0),
							  ('12345678927','New World Pictures',200000000.0),
							  ('12345678931','FilmColony',3000000.0);

--u¿ytkownicy
insert into U¿ytkownicy values ('Jan_Nowak1','12345678912','passwordhash#1','2021-10-01'),
							   ('Ela_Kowalska','12345678914','passwordhash#2','2021-12-19'),
							   ('John_smith90','12345678925','passwordhash#3','2021-09-02'),
							   ('Jessica_Miller95','12345678926','passwordhash#4','2021-07-20'),
							   ('Tim_Johnson77','12345678934','passwordhash#5','2021-07-29');
							   

--gatunki
insert into Gatunki values('akcja','gatunek nastawiony na akcjê oraz spektakularne sceny'),
						  ('sci-fi','gatunek science-fioction, czyli pokazuj¹cy œwiat z zaawansowan¹ technologi¹'),
						  ('fantasy','gatunek przedstawiaj¹cy œwiat fantastyczny'),
						  ('horror','Celem filmowego horroru jest wywo³anie u widza klimatu grozy, niepokoju lub obrzydzenia i szoku.'),
						  ('edukacyjny','film nastawiony na edukacjê widzów'),
						  ('animowany','rodzaj filmu , który jest tworzony technik¹ zdjêæ poklatkowych , rejestruj¹cych na pojedynczych klatkach filmu kolejne fazy ruchu'),
						  ('komedia','gatunek nastawiony rozœmieszenie widza i ukazania zabawnych scen'),
						  ('thriller','gatunek maj¹cy wywo³aæ u widza dreszcz emocji'),
						  ('wojenny','gatunek maj¹cy ukazaæ dzia³ania wojenne lub sceny batalistyczne'),
						  ('western','film rozgrywaj¹cy siê w okresie kolonizacji i stabilizowania siê ¿ycia na terenach zachodnich stanów USA');

 --filmy
insert into Filmy values('Top Gun',7.2,'1989-12-31',(SELECT ID_gatunku FROM Gatunki where Nazwa='akcja'),110,(SELECT ID_re¿ FROM Re¿yserzy where PESEL='12345678919'),(SELECT ID_prod FROM Producenci where PESEL='12345678918'),15000000),
						('Star Wars: Episode IV - A New Hope',8.6,'1977-05-25',(SELECT ID_gatunku FROM Gatunki where Nazwa='sci-fi'),121,(SELECT ID_re¿ FROM Re¿yserzy where PESEL='12345678920'),(SELECT ID_prod FROM Producenci where PESEL='12345678920'),11000000),
						('Avatar',7.4,'2009-12-10',(SELECT ID_gatunku FROM Gatunki where Nazwa='sci-fi'),162,(SELECT ID_re¿ FROM Re¿yserzy where PESEL='12345678927'),(SELECT ID_prod FROM Producenci where PESEL='12345678927'),237000000),
						('The hateful Eight',7.6,'2015-12-07',(SELECT ID_gatunku FROM Gatunki where Nazwa='western'),168,(SELECT ID_re¿ FROM Re¿yserzy where PESEL='12345678928'),(SELECT ID_prod FROM Producenci where PESEL='12345678931'),50000000);



--nagrody
insert into Nagrody values((SELECT ID_filmu FROM Filmy where Tytu³='Top Gun'),'Oskary','Najlepsza piosenka','Nagroda za najlepsz¹ piosenkê - "Take My Breath Away", wyk. Berlin','film','1987-01-01'),

						 ((SELECT ID_filmu FROM Filmy where Tytu³='Top Gun'),'AMERYKAÑSKI INSTYTUT FILMOWY','Najlepsze kwestie filmowe wszech czasów','Pete "Maverick" Mitchell i porucznik Nick "Goose" Bradshaw: "I feel the need?the need for speed!"','film','2005-01-01'),

						 ((SELECT ID_filmu FROM Filmy where Tytu³='Star Wars: Episode IV - A New Hope'),'Oskary','Najlepsza muzyka oryginalna ','Nagroda za najlepsz¹ muzykê oryginaln¹ w wykonaniu John Williams','film','1978-01-01'),

						 ((SELECT ID_filmu FROM Filmy where Tytu³='Star Wars: Episode IV - A New Hope'),'Z³ote Globy','Najlepszy re¿yser ','Nagroda za najlepszego re¿ysera - Georga Lucasa','re¿yser','1978-01-01'),

						 ((SELECT ID_filmu FROM Filmy where Tytu³='Star Wars: Episode IV - A New Hope'),'Oskary','Najlepsze efekty specjalne ','nagrodzeni John Stears, John Dykstra, Richard Edlund, Grant McCune, Robert Blalack','film','1978-01-01'),

						 ((SELECT ID_filmu FROM Filmy where Tytu³='THe Hateful Eight'),'Oskary','Najlepsza muzyka oryginalna','Najlepsza muzyka oryginalna Ennio Morricone','film','2016-01-01'),

						 ((SELECT ID_filmu FROM Filmy where Tytu³='Avatar'),'Oskary','Najlepsze efekty specjalne','Najlepsze efekty specjalne - Joe Letteri, Stephen Rosenbaum, Richard Baneham i Andy Jones','film','2010-01-01'),
						 ((SELECT ID_filmu FROM Filmy where Tytu³='Avatar'),'Z³ote Globy','Najlepszy dramat',null,'film','2010-01-01'),
						 ((SELECT ID_filmu FROM Filmy where Tytu³='Avatar'),'Z³ote Globy','Najlepszy re¿yser','Najlepszy re¿yser James Cameron','re¿yser','2010-01-01');

				

--oceny
insert into Oceny values(8.9,(SELECT ID_filmu FROM Filmy where Tytu³='Top Gun'),'Jan_Nowak1','2021-12-21'),
						(6.9,(SELECT ID_filmu FROM Filmy where Tytu³='Star Wars: Episode IV - A New Hope'),'Jan_Nowak1','2021-12-19'),
						(9.5,(SELECT ID_filmu FROM Filmy where Tytu³='Avatar'),'John_smith90','2021-12-15'),
						(7.1,(SELECT ID_filmu FROM Filmy where Tytu³='Top Gun'),'Ela_Kowalska','2021-11-02'),
						(9.8,(SELECT ID_filmu FROM Filmy where Tytu³='Star Wars: Episode IV - A New Hope'),'Ela_Kowalska','2021-12-15'),
						(7.3,(SELECT ID_filmu FROM Filmy where Tytu³='Star Wars: Episode IV - A New Hope'),'John_smith90','2021-12-15'),
						(9.5,(SELECT ID_filmu FROM Filmy where Tytu³='Avatar'),'John_smith90','2021-12-15'),

						(6.5,(SELECT ID_filmu FROM Filmy where Tytu³='Top Gun'),'Jessica_Miller95','2021-09-11'),
						(8.5,(SELECT ID_filmu FROM Filmy where Tytu³='Star Wars: Episode IV - A New Hope'),'Jessica_Miller95','2021-05-15'),
						(9.2,(SELECT ID_filmu FROM Filmy where Tytu³='Avatar'),'Jessica_Miller95','2021-12-13'),

						(9.0,(SELECT ID_filmu FROM Filmy where Tytu³='Avatar'),'Tim_Johnson77','2021-11-02'),
						(9.5,(SELECT ID_filmu FROM Filmy where Tytu³='The Hateful Eight'),'Tim_Johnson77','2021-12-10'),
						(7.1,(SELECT ID_filmu FROM Filmy where Tytu³='Top Gun'),'Tim_Johnson77','2021-12-01');


--wystêpy
insert into Wystêpy values((SELECT ID_aktora FROM Aktorzy where PESEL='12345678922'),(SELECT ID_filmu FROM Filmy where Tytu³='Star Wars: Episode IV - A New Hope'),100000,'Luke Skywaker'),
						  ((SELECT ID_aktora FROM Aktorzy where PESEL='12345678921'),(SELECT ID_filmu FROM Filmy where Tytu³='Star Wars: Episode IV - A New Hope'),123456,'Han Solo'),
						  ((SELECT ID_aktora FROM Aktorzy where PESEL='12345678911'),(SELECT ID_filmu FROM Filmy where Tytu³='Star Wars: Episode IV - A New Hope'),100,'Statysta'),

						  ((SELECT ID_aktora FROM Aktorzy where PESEL='12345678916'),(SELECT ID_filmu FROM Filmy where Tytu³='Top Gun'),77000,'Pete "Maverick" Mitchell'),
						  ((SELECT ID_aktora FROM Aktorzy where PESEL='12345678913'),(SELECT ID_filmu FROM Filmy where Tytu³='Top Gun'),150,'Statysta'),

						  ((SELECT ID_aktora FROM Aktorzy where PESEL='12345678929'),(SELECT ID_filmu FROM Filmy where Tytu³='THe Hateful Eight'),300000,'John Ruth'),
						  ((SELECT ID_aktora FROM Aktorzy where PESEL='12345678930'),(SELECT ID_filmu FROM Filmy where Tytu³='THe Hateful Eight'),400000,'Major Marquis Warren'),
						  ((SELECT ID_aktora FROM Aktorzy where PESEL='12345678932'),(SELECT ID_filmu FROM Filmy where Tytu³='THe Hateful Eight'),200000,'Daisy Domergue'),

						  ((SELECT ID_aktora FROM Aktorzy where PESEL='12345678933'),(SELECT ID_filmu FROM Filmy where Tytu³='Avatar'),700000,'Jake Sully'),
						  ((SELECT ID_aktora FROM Aktorzy where PESEL='12345678911'),(SELECT ID_filmu FROM Filmy where Tytu³='Avatar'),3000,'Statytsta');





