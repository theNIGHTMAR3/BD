CREATE TABLE Osoby (
    PESEL varchar(11) CHECK(PESEL LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') PRIMARY KEY, --czy PESEL jest odpowiedni
    Imi� varchar(20) NOT NULL,	--imie osoby
    Nazwisko varchar(40) NOT NULL,	--nazwisko osoby
	P�e� char(1)check(P�e�='K' or P�e�='M') NOT NULL, --enum Kobieta(K) lub M�czyzna(M)
	Data_ur date NOT NULL,	--data urodzenia osoby
);

CREATE TABLE Aktorzy (
    ID_aktora int IDENTITY (1,1) PRIMARY KEY, --sztuczny klucz g��wny 
	PESEL varchar(11) UNIQUE FOREIGN KEY REFERENCES Osoby(PESEL) ON DELETE CASCADE ON UPDATE CASCADE,	  --PESEL osoby, kt�ra jest te� aktorem
    Szko�a_aktorska varchar(200) --szko�a aktorka, nie musi by� podana
);

CREATE TABLE Re�yserzy (
    ID_re� int IDENTITY (1,1) PRIMARY KEY,	--sztuczny klucz g��wny 
	PESEL varchar(11) UNIQUE FOREIGN KEY REFERENCES Osoby(PESEL) ON DELETE CASCADE ON UPDATE CASCADE,	  --PESEL osoby, kt�ra jest te� re�yserem
    Wykszta�cenie varchar(30)	--wykszta�cenie nie musi byc podane
);

CREATE TABLE Producenci (
    ID_prod int IDENTITY (1,1) PRIMARY KEY,	--sztuczny klucz g��wny
	PESEL varchar(11) UNIQUE FOREIGN KEY REFERENCES Osoby(PESEL) ON DELETE CASCADE ON UPDATE CASCADE,	  --PESEL osoby, kt�ra jest te� producentem
    Firma varchar(50),	--firma lub agencja dla kt�rej pracuje re�yser, nie musi by� podana
	Wk�ad_finansowy float CHECK (Wk�ad_finansowy >= 0)	--wk�ad finansowy nie musi by� podany, lecz te� nie mo�e by� ujemny
);

CREATE TABLE U�ytkownicy (
    Login varchar(30)CHECK(LEN(Login)>=10) PRIMARY KEY,	--sprawdza czy login jest wystarczaj�co d�ugi
	PESEL varchar(11) UNIQUE FOREIGN KEY REFERENCES Osoby(PESEL) ON DELETE CASCADE ON UPDATE CASCADE,	  --PESEL osoby, kt�ra jest te� u�ytkownikiem
    Has�o_hash varchar(100) CHECK(LEN(Has�o_hash)>=10) NOT NULL, --minimalna d�ugo�� hasha
	Data_rej date NOT NULL	--data rejestracji uzytwkownika
);

CREATE TABLE Gatunki (
    ID_gatunku int IDENTITY (1,1) PRIMARY KEY, --sztuczny klucz g��wny 
	Nazwa varchar(20) UNIQUE NOT NULL, --niepowstarzalna nazwa gatunku filmowego
	Opis varchar(200) --opis nie jest wymagany
);

CREATE TABLE Filmy (
    ID_filmu int IDENTITY (1,1) PRIMARY KEY,	--sztuczny klucz g��wny 
	Tytu� varchar(100) NOT NULL,	--tytu� filmu
    �r_ocen float Check(�r_ocen between 0 and 10), --�rednia ocen krytyk�w musi by� mi�dzy 0.0 a 10.0
	Data date not null,	--data premiery filmu
	ID_gatunku int REFERENCES Gatunki(ID_gatunku) ON DELETE CASCADE ON UPDATE CASCADE, --ID gatunku, kt�rego jest film
	D�ugo�� int check(D�ugo��>0) NOT NULL, --d�ugo�� filmu w minutach, nie mo�e by� ujemna ani zerowa
	ID_re� int REFERENCES Re�yserzy(ID_re�) ,	--ID re�ysera, kt�ry nakr�ci� film
	ID_prod int REFERENCES Producenci(ID_prod) ,	--ID producenta, kt�ry wyprodukowa� film
	Bud�et float check(Bud�et>=0)	--bud�et filmu, nie musi by� podany, ale nie mo�e by� ujemny
);


CREATE TABLE Nagrody (
    ID_Nagrody int IDENTITY (1,1) PRIMARY KEY,	--sztuczny klucz g��wny 
	ID_filmu int REFERENCES Filmy(ID_filmu) ON DELETE CASCADE ON UPDATE CASCADE,	--ID filmu, kt�rego dotyczy nagroda
	Instytucja varchar(50) NOT NULL,	--instytucja, kt�ra wr�czy�a nagrod�
	Kategoria varchar(50) NOT NULL,		--kategori, za kt�r� film otrzyma� nagrod� 
	Opis varchar(200),	--dodatkowy opis nagrody, nie musi by� podany
	Nagrodzenie varchar(7)check(Nagrodzenie='aktor' or Nagrodzenie='re�yser' or Nagrodzenie='film') NOT NULL,	--enum, sprawdza komu zosta�a przyznana nagroda
	Data date NOT NULL	--data wr�czenia nagrody
);

CREATE TABLE Oceny (
    ID_Oceny int IDENTITY (1,1) PRIMARY KEY,	--sztuczny klucz g��wny
	Ocena float Check(Ocena between 0 and 10) NOT NULL,	--wystawiona ocena musi byc miedzy 0.0 a 10.0
	ID_filmu int REFERENCES Filmy(ID_filmu)  ON DELETE CASCADE ON UPDATE CASCADE,	--ID filmu, kt�rego dotyczy ocena
	Login varchar(30) REFERENCES U�ytkownicy(Login) ON DELETE CASCADE ON UPDATE CASCADE,	--Login u�ytkownika, kt�ry wystawi� ocen�
	Data date NOT NULL	--data wystawienia oceny
);


CREATE TABLE Wyst�py (
    ID_wyst�pu int IDENTITY (1,1) PRIMARY KEY,	--sztuczny klucz g��wny
	ID_aktora int REFERENCES Aktorzy(ID_aktora) ON DELETE CASCADE ON UPDATE CASCADE,	--ID aktora, kt�ry wzi�� udzia� w wyst�pie
	ID_filmu int REFERENCES Filmy(ID_filmu) ON DELETE CASCADE ON UPDATE CASCADE,	--ID filmu, kt�rego dotyczy� wyst�p
	Zarobek float check(zarobek>=0),	--zarobek jaki otrzyma� aktor za wyst�p, nie misi by� podany, lecz nie mo�e by� ujemny
	Rola varchar(50) NOT NULL	--rola, w kt�rej zagra� aktor
);