	
	
--deletes


	DELETE FROM Osoby WHERE Imiê='Steven';
	DELETE FROM U¿ytkownicy WHERE Login='John_smith90';
	DELETE FROM Osoby WHERE Imiê='Micha³';
	DELETE FROM Aktorzy WHERE PESEL='12345678916';
	DELETE FROM Filmy WHERE Tytu³='Top Gun';
	DELETE FROM Wystêpy WHERE ID_wystêpu=1



--updates

	
	
	
	UPDATE U¿ytkownicy SET Login='Jan_Nowak1337' WHERE Login='Jan_Nowak1'
	UPDATE Osoby SET PESEL='22222222221' WHERE Imiê='Tom';
	UPDATE Osoby SET PESEL='11111111111' WHERE Nazwisko='Cruise';
	UPDATE Osoby SET PESEL='1122344456' WHERE PESEL='11223344456';
	UPDATE Oceny SET Ocena=10.0 WHERE ID_oceny=1



