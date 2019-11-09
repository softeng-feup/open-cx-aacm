PRAGMA foreign_keys = ON;
	-- Palestra Table
	DROP TABLE IF EXISTS Palestra;

	CREATE TABLE Palestra (
		id			INTEGER	 PRIMARY KEY,
		dateP	    DATE NOT NULL,
		hourP		INTEGER NOT NULL,
		minuteP     INTEGER NOT NULL,
		name		TEXT NOT NULL,
		lecturer    TEXT NOT NULL

	);

	--  User Table
    	DROP TABLE IF EXISTS Person;

    	CREATE TABLE Person (
    		id			INTEGER	 PRIMARY KEY,
    		birthDate	DATE NOT NULL,
    		contact		INTEGER	 NOT NULL UNIQUE
    					CHECK((contact >= 910000000 AND contact <= 939999999) OR (contact >= 960000000 AND contact <= 969999999)),
    		name		TEXT NOT NULL,
    		email		TEXT NOT NULL UNIQUE,
    		password    INTEGER NOT NULL

    	);