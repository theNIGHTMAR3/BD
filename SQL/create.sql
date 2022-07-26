CREATE TABLE Osoby (
    PESEL varchar(11) CHECK(PESEL LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') PRIMARY KEY, --czy PESEL jest odpowiedni
    Imiê varchar(20) NOT NULL,	--imie osoby
    Nazwisko varchar(40) NOT NULL,	--nazwisko osoby
	P³eæ char(1)check(P³eæ='K' or P³eæ='M') NOT NULL, --enum Kobieta(K) lub Mê¿czyzna(M)
	Data_ur date NOT NULL,	--data urodzenia osoby
);

CREATE TABLE Aktorzy (
    ID_aktora int IDENTITY (1,1) PRIMARY KEY, --sztuczny klucz g³ówny 
	PESEL varchar(11) UNIQUE FOREIGN KEY REFERENCES Osoby(PESEL) ON DELETE CASCADE ON UPDATE CASCADE,	  --PESEL osoby, która jest te¿ aktorem
    Szko³a_aktorska varchar(200) --szko³a aktorka, nie musi byæ podana
);

CREATE TABLE Re¿yserzy (
    ID_re¿ int IDENTITY (1,1) PRIMARY KEY,	--sztuczny klucz g³ówny 
	PESEL varchar(11) UNIQUE FOREIGN KEY REFERENCES Osoby(PESEL) ON DELETE CASCADE ON UPDATE CASCADE,	  --PESEL osoby, która jest te¿ re¿yserem
    Wykszta³cenie varchar(30)	--wykszta³cenie nie musi byc podane
);

CREATE TABLE Producenci (
    ID_prod int IDENTITY (1,1) PRIMARY KEY,	--sztuczny klucz g³ówny
	PESEL varchar(11) UNIQUE FOREIGN KEY REFERENCES Osoby(PESEL) ON DELETE CASCADE ON UPDATE CASCADE,	  --PESEL osoby, która jest te¿ producentem
    Firma varchar(50),	--firma lub agencja dla której pracuje re¿yser, nie musi byæ podana
	Wk³ad_finansowy float CHECK (Wk³ad_finansowy >= 0)	--wk³ad finansowy nie musi byæ podany, lecz te¿ nie mo¿e byæ ujemny
);

CREATE TABLE U¿ytkownicy (
    Login varchar(30)CHECK(LEN(Login)>=10) PRIMARY KEY,	--sprawdza czy login jest wystarczaj¹co d³ugi
	PESEL varchar(11) UNIQUE FOREIGN KEY REFERENCES Osoby(PESEL) ON DELETE CASCADE ON UPDATE CASCADE,	  --PESEL osoby, która jest te¿ u¿ytkownikiem
    Has³o_hash varchar(100) CHECK(LEN(Has³o_hash)>=10) NOT NULL, --minimalna d³ugoœæ hasha
	Data_rej date NOT NULL	--data rejestracji uzytwkownika
);

CREATE TABLE Gatunki (
    ID_gatunku int IDENTITY (1,1) PRIMARY KEY, --sztuczny klucz g³ówny 
	Nazwa varchar(20) UNIQUE NOT NULL, --niepowstarzalna nazwa gatunku filmowego
	Opis varchar(200) --opis nie jest wymagany
);

CREATE TABLE Filmy (
    ID_filmu int IDENTITY (1,1) PRIMARY KEY,	--sztuczny klucz g³ówny 
	Tytu³ varchar(100) NOT NULL,	--tytu³ filmu
    Œr_ocen float Check(Œr_ocen between 0 and 10), --œrednia ocen krytyków musi byæ miêdzy 0.0 a 10.0
	Data date not null,	--data premiery filmu
	ID_gatunku int REFERENCES Gatunki(ID_gatunku) ON DELETE CASCADE ON UPDATE CASCADE, --ID gatunku, którego jest film
	D³ugoœæ int check(D³ugoœæ>0) NOT NULL, --d³ugoœæ filmu w minutach, nie mo¿e byæ ujemna ani zerowa
	ID_re¿ int REFERENCES Re¿yserzy(ID_re¿) ,	--ID re¿ysera, który nakrêci³ film
	ID_prod int REFERENCES Producenci(ID_prod) ,	--ID producenta, który wyprodukowa³ film
	Bud¿et float check(Bud¿et>=0)	--bud¿et filmu, nie musi byæ podany, ale nie mo¿e byæ ujemny
);


CREATE TABLE Nagrody (
    ID_Nagrody int IDENTITY (1,1) PRIMARY KEY,	--sztuczny klucz g³ówny 
	ID_filmu int REFERENCES Filmy(ID_filmu) ON DELETE CASCADE ON UPDATE CASCADE,	--ID filmu, którego dotyczy nagroda
	Instytucja varchar(50) NOT NULL,	--instytucja, która wrêczy³a nagrodê
	Kategoria varchar(50) NOT NULL,		--kategori, za któr¹ film otrzyma³ nagrodê 
	Opis varchar(200),	--dodatkowy opis nagrody, nie musi byæ podany
	Nagrodzenie varchar(7)check(Nagrodzenie='aktor' or Nagrodzenie='re¿yser' or Nagrodzenie='film') NOT NULL,	--enum, sprawdza komu zosta³a przyznana nagroda
	Data date NOT NULL	--data wrêczenia nagrody
);

CREATE TABLE Oceny (
    ID_Oceny int IDENTITY (1,1) PRIMARY KEY,	--sztuczny klucz g³ówny
	Ocena float Check(Ocena between 0 and 10) NOT NULL,	--wystawiona ocena musi byc miedzy 0.0 a 10.0
	ID_filmu int REFERENCES Filmy(ID_filmu)  ON DELETE CASCADE ON UPDATE CASCADE,	--ID filmu, którego dotyczy ocena
	Login varchar(30) REFERENCES U¿ytkownicy(Login) ON DELETE CASCADE ON UPDATE CASCADE,	--Login u¿ytkownika, który wystawi³ ocenê
	Data date NOT NULL	--data wystawienia oceny
);


CREATE TABLE Wystêpy (
    ID_wystêpu int IDENTITY (1,1) PRIMARY KEY,	--sztuczny klucz g³ówny
	ID_aktora int REFERENCES Aktorzy(ID_aktora) ON DELETE CASCADE ON UPDATE CASCADE,	--ID aktora, który wzi¹³ udzia³ w wystêpie
	ID_filmu int REFERENCES Filmy(ID_filmu) ON DELETE CASCADE ON UPDATE CASCADE,	--ID filmu, którego dotyczy³ wystêp
	Zarobek float check(zarobek>=0),	--zarobek jaki otrzyma³ aktor za wystêp, nie misi byæ podany, lecz nie mo¿e byæ ujemny
	Rola varchar(50) NOT NULL	--rola, w której zagra³ aktor
);