DROP TABLE GAMES
DROP TABLE STAGES 
DROP TABLE WCEDITIONS 
DROP TABLE REFEREES
DROP TABLE VENUES 
DROP TABLE sponsor 
DROP TABLE SPONSORS
DROP TABLE PLAYERS
DROP TABLE TEAMS
DROP TABLE COACHES 



CREATE TABLE COACHES
(
	CID INT NOT NULL PRIMARY KEY,
	cfname VARCHAR(50),
	clname VARCHAR(50)
)

CREATE TABLE TEAMS
(
	TID INT PRIMARY KEY,
	FKCID INT REFERENCES COACHES,
	--UNIQUE(FKCID),
	tname VARCHAR(50)
)

CREATE TABLE PLAYERS
(
	PID INT PRIMARY KEY,
	FKTID INT REFERENCES TEAMS,
	fname VARCHAR(50),
    lname VARCHAR(50),
	number INT,
	impfac INT,
	age INT
)

CREATE TABLE SPONSORS
(
	SPID INT PRIMARY KEY,
	spname VARCHAR(50)
)

CREATE TABLE sponsor
(
	FKSPID INT REFERENCES SPONSORS,
	FKTID INT REFERENCES TEAMS,
	PRIMARY KEY(FKSPID, FKTID),
	since INT
)

CREATE TABLE VENUES 
(
	VID INT PRIMARY KEY,
	vname VARCHAR(50),
	capacity INT
)

CREATE TABLE REFEREES
(
	RID INT PRIMARY KEY,
	rfname VARCHAR(50),
	rlname VARCHAR(50)
)

CREATE TABLE WCEDITIONS
(
	EID INT PRIMARY KEY,
	yearofedtn INT
)

CREATE TABLE STAGES
(
	STID INT PRIMARY KEY,
	FKEID INT REFERENCES WCEDITIONS,
	nameofstage VARCHAR(50)
)

CREATE TABLE GAMES
(
	GAID INT PRIMARY KEY,
	FKVID INT REFERENCES VENUES,
	FKHTID INT REFERENCES TEAMS,
	FKATID INT REFERENCES TEAMS,
	FKSTID INT REFERENCES STAGES,
	FKCRID INT REFERENCES REFEREES,
	FKLRID1 INT REFERENCES REFEREES,
	FKLRID2 INT REFERENCES REFEREES,
	price INT,
	dateofgame DATE
)


INSERT INTO SPONSORS(SPID, spname)
		VALUES(2, 'NIKE')

INSERT INTO SPONSORS(SPID, spname)
		VALUES(3, 'Adidas')


INSERT INTO SPONSORS(SPID, spname)
		VALUES(4, 'Hummel')

INSERT INTO SPONSORS(SPID, spname)
		VALUES(5, 'New Balance')

INSERT INTO COACHES(CID, cfname, clname)
		VALUES(5, 'Luis','Enrique')

INSERT INTO COACHES(CID, cfname, clname)
		VALUES(6, 'Hans-Dieter','Flick')

INSERT INTO COACHES(CID, cfname, clname)
		VALUES(7, 'Roberto', 'Martinez')

INSERT INTO COACHES(CID, cfname, clname)
		VALUES(8, 'Tite', 'Junior')

INSERT INTO COACHES(CID, cfname, clname)
		VALUES(9, 'Didier', 'Deschamps')

INSERT INTO TEAMS(TID, FKCID, tname)
        VALUES(3, 5, 'Spain')	

INSERT INTO TEAMS(TID, FKCID, tname)
        VALUES(4, 6, 'Germany')	

INSERT INTO TEAMS(TID, FKCID, tname)
		VALUES(5, 7, 'Belgium')

INSERT INTO TEAMS(TID, FKCID, tname)
		VALUES(6, 8, 'Brazil')

INSERT INTO TEAMS(TID, FKCID, tname)
		VALUES(7, 9, 'France')

INSERT INTO sponsor(FKSPID, FKTID, since)
        VALUES(2, 3, 2008)

INSERT INTO sponsor(FKSPID, FKTID, since)
        VALUES(3, 4, 2012)

INSERT INTO sponsor(FKSPID, FKTID, since)
        VALUES(4, 7, 20202)

INSERT INTO PLAYERS(PID, FKTID, fname, lname, number, impfac, age)
        VALUES(3, 3, 'Marcos', 'Alonso', 3, 5, 28)

INSERT INTO PLAYERS(PID, FKTID, fname, lname, number, impfac, age)
        VALUES(4, 3, 'Ansu', 'Fati', 11, 3, 18)

INSERT INTO PLAYERS(PID, FKTID, fname, lname, number, impfac, age)
        VALUES(5, 3, 'Gavi', 'Pablo', 10, 5, 19)

INSERT INTO PLAYERS(PID, FKTID, fname, lname, number, impfac, age)
        VALUES(6, 3, 'Pedri', 'Gonzalez', 6, 7, 19)

INSERT INTO PLAYERS(PID, FKTID, fname, lname, number, impfac, age)
        VALUES(7, 4, 'Manuel', 'Neuer', 1, 5, 34)

INSERT INTO PLAYERS(PID, FKTID, fname, lname, number, impfac, age)
        VALUES(8, 4, 'Leroy', 'Sane', 10, 6, 27)

INSERT INTO PLAYERS(PID, FKTID, fname, lname, number, impfac, age)
        VALUES(9, 4, 'Serge', 'Gnabry', 11, 4, 28)

INSERT INTO PLAYERS(PID, FKTID, fname, lname, number, impfac, age)
        VALUES(10, 4, 'Leon', 'Goretzka', 8, 5, 29)

INSERT INTO VENUES(VID, vname, capacity)
		VALUES(1, 'Al Bayt', 60000)

INSERT INTO VENUES(VID, vname, capacity)
		VALUES(2, 'Lusail', 80000)

INSERT INTO VENUES(VID, vname, capacity)
		VALUES(3, 'Al Thumama', 40000)

INSERT INTO VENUES(VID, vname, capacity)
		VALUES(4, 'Al Janoub', 40000)

INSERT INTO REFEREES(RID, rfname, rlname)
		VALUES(1, 'Istvan', 'Kovacs')

INSERT INTO REFEREES(RID, rfname, rlname)
		VALUES(2, 'Michael' , 'Oliver')

INSERT INTO REFEREES(RID, rfname, rlname)
		VALUES(3, 'Antonio' , 'Mateu')

INSERT INTO REFEREES(RID, rfname, rlname)
		VALUES(4, 'Danny' , 'Makkelie')

INSERT INTO WCEDITIONS(EID, yearofedtn)
		VALUES(1, '2022')

INSERT INTO WCEDITIONS(EID, yearofedtn)
		VALUES(2, '2018')

INSERT INTO STAGES(STID, FKEID, nameofstage)
		VALUES(1, 1, 'Final')

INSERT INTO STAGES(STID, FKEID, nameofstage)
		VALUES(2, 1, 'Semi-Final')

INSERT INTO GAMES(GAID, FKVID, FKHTID, FKATID, FKSTID, FKCRID, FKLRID1, FKLRID2, price, dateofgame)
		VALUES(1, 1, 3, 5, 2, 1, 2, 3, 50, '2023-01-15')

INSERT INTO GAMES(GAID, FKVID, FKHTID, FKATID, FKSTID, FKCRID, FKLRID1, FKLRID2, price, dateofgame)
		VALUES(2, 3, 4, 6, 2, 1, 2, 3, 50, '2023-01-16')

INSERT INTO GAMES(GAID, FKVID, FKHTID, FKATID, FKSTID, FKCRID, FKLRID1, FKLRID2, price, dateofgame)
		VALUES(3, 2, 3, 6, 1, 1, 2, 3, 100, '2023-01-21')


UPDATE GAMES
SET PRICE=1000
WHERE FKHTID=2 AND FKATID=3

UPDATE sponsor
SET since=2022
WHERE FKSPID=5 AND FKTID=4

UPDATE TEAMS
SET FKCID=5
WHERE tname LIKE '_pain'

DELETE FROM P
FROM PLAYERS AS P 
WHERE P.number BETWEEN 90 AND 99

DELETE FROM G
FROM GAMES AS G
WHERE G.price = 200 AND G.FKATID IN ( SELECT T.TID
									  FROM TEAMS T
									  WHERE T.TID = 6 )

SELECT *
FROM COACHES

SELECT *
FROM TEAMS

SELECT *
FROM sponsor

SELECT *
FROM SPONSORS

SELECT *
FROM GAMES





------a. 2 queries with the union operation; use UNION [ALL] and OR


--teams having as sponsors adidas or nike (using UNION [ALL]). Answer should be: Germany, Spain

SELECT T.tname
FROM TEAMS T, sponsor s, SPONSORS SS
WHERE T.TID=s.FKTID AND s.FKSPID = SS.SPID AND SS.spname = 'NIKE'
UNION
SELECT T2.tname
FROM TEAMS T2, sponsor s2, SPONSORS SS2
WHERE T2.TID=s2.FKTID AND s2.FKSPID = SS2.SPID AND SS2.spname = 'Adidas'


--teams having as coaches Luis Enrique or Tite (using OR). Answer should be: Spain, Brazil 

SELECT T.tname
FROM TEAMS T, COACHES C
WHERE T.FKCID=C.CID AND (C.cfname='Luis' OR C.cfname='Tite')





-------b. 2 queries with the intersection operation; use INTERSECT and IN


--all teams who have played in both of the following knock-out rounds: Semifinal, Final. Answer should be: Brazil, Spain

SELECT T.tname 
FROM TEAMS T, GAMES G, STAGES S
WHERE (T.TID = G.FKATID OR T.TID = G.FKHTID) AND S.STID = G.FKSTID AND S.STID = 2
INTERSECT
SELECT T2.tname 
FROM TEAMS T2, GAMES G2, STAGES S2
WHERE (T2.TID = G2.FKATID OR T2.TID = G2.FKHTID) AND S2.STID = G2.FKSTID AND S2.STID = 1


--teams who have adidas as sponsors. Answer should be: Germany

SELECT T.tname
FROM TEAMS T
WHERE T.TID IN ( SELECT s.FKTID
				 FROM sponsor s
				 WHERE s.FKSPID = 3 )





------c.  2 queries with the difference operation; use EXCEPT and NOT IN


--teams who don't have adidas as sponsors. Answer should be: Spain, Belgium, Brazil

SELECT T.tname
FROM TEAMS T
WHERE T.TID NOT IN ( SELECT s.FKTID
				 FROM sponsor s
				 WHERE s.FKSPID = 3 )


--all teams who have played in the Semifinal but not in the Final. Answer should be: Belgium, Germany

SELECT T.tname 
FROM TEAMS T, GAMES G, STAGES S
WHERE (T.TID = G.FKATID OR T.TID = G.FKHTID) AND S.STID = G.FKSTID AND S.STID = 2
EXCEPT
SELECT T2.tname 
FROM TEAMS T2, GAMES G2, STAGES S2
WHERE (T2.TID = G2.FKATID OR T2.TID = G2.FKHTID) AND S2.STID = G2.FKSTID AND S2.STID = 1




------d. 4 queries with INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN (one query per operator);
----	 one query will join at least 3 tables, while another one will join at least two many-to-many relationships;


--get all players and their teams. THEN I GOT ALL PLAYERS, THEIR TEAMS AND THE COACHES for solving the "one query will join at least 3 tables" criteria.
--inner join on players and teams will give only the players who match with a team

SELECT *
FROM PLAYERS P INNER JOIN TEAMS T
			   ON P.FKTID = T.TID


SELECT *
FROM PLAYERS P INNER JOIN
			   ( SELECT *
			     FROM TEAMS T INNER JOIN COACHES C
							  ON T.FKCID = C.CID) R
				ON P.FKTID = R.TID


--left join on teams and sponsor will give the teams who match with the their sponosors but also the teams which don't have a matching sponsor

SELECT *
FROM TEAMS T LEFT JOIN sponsor s
			 ON T.TID = s.FKTID


--right join on games and venues will give the games who match with a venue but will also give the venue which doesn't have a matching game

SELECT *
FROM GAMES G RIGHT JOIN VENUES V
			 ON G.FKVID = V.VID


--full join at least two many many-to-many relationships

SELECT *
FROM GAMES G FULL JOIN sponsor s
			 ON G.FKHTID = s.FKTID





------e. 2 queries with the IN operator and a subquery in the WHERE clause; in at least one case, the subquery must include a subquery in its own WHERE clause


--get all sponsors who are also actively sponsoring a team at the moment. (New Balance shouldn't appear as a result) Answer should be: NIKE, Adidas, Hummel
--->Observation: When using IN, in the nested subquerry we can only give one expression. When using EXIST we can have more expressions specified in the subquerry
--->
--->Bcs of this we can't have: WHERE T.TID in ( SELECT G.FKHTID, FKATID )

SELECT DISTINCT S.spname
FROM SPONSORS S
WHERE S.SPID IN ( SELECT ss.FKSPID
				  FROM sponsor ss )


--get all Venues where the team with team id 3 has played as the home team. (All venues in which Spain has played as home team) Answer should be: Al bayt, Lusail

SELECT V.vname
FROM VENUES V
WHERE V.VID IN ( SELECT G.FKVID
				 FROM GAMES G
				 WHERE G.FKHTID IN ( SELECT T.TID
									 FROM TEAMS T
									 WHERE T.TID = 3 )
													   )





------f. 2 queries with the EXISTS operator and a subquery in the WHERE clause


--get all teams which have played as away teams. Answer should be: Belgium , Brazil
--->Observation: in the WHERE from the EXISTS YOU NEED TO MAKE USE OF THE ROWS FROM THE OUTTER RELATION. It is dependent on them

SELECT T.TID, T.tname
FROM TEAMS T
WHERE EXISTS ( SELECT G.FKHTID, G.FKATID 
			   FROM GAMES G
			   WHERE G.FKATID = T.TID )


--get all CENTRAL referees which have refereed a semi-final but also a final. Answer should be: Istvan Kovacs

SELECT R.RID, R.rfname, R.rlname
FROM REFEREES R
WHERE EXISTS ( SELECT *
			   FROM GAMES G
			   WHERE G.FKCRID = R.RID AND  EXISTS ( SELECT S.STID
													FROM STAGES S
													WHERE G.FKSTID = S.STID AND (S.STID = 1 OR S.STID = 2) 
																										   ) 
																										     )





------g. 2 queries with a subquery in the FROM clause


--get all players having an impact factor greater than the average impact factor. Answer should be: Pedri Gonzalez and Leroy Sane

SELECT DISTINCT P2.fname, P2.lname
FROM ( SELECT avg(P.impfac) AS averageIMPFAC FROM PLAYERS P ) AS Average, PLAYERS P2
WHERE P2.impfac > Average.averageIMPFAC


--get all games with the price greater or equal than the double of the price of the average price of a game. Answer should be: The final, having GameID = 3

SELECT DISTINCT G2.GAID, avrPRICE.averagePRICE AS avrPRICE, avrPRICE.averagePRICE*2+50 AS LASTWCavrPRICE
FROM ( SELECT avg(G.price) AS averagePRICE FROM GAMES G ) AS avrPRICE, GAMES G2
WHERE G2.price >= 1.5 * avrPRICE.averagePRICE

------h. 4 queries with the GROUP BY clause, 3 of which also contain the HAVING clause;
----	 2 of the latter will also have a subquery in the HAVING clause; use the aggregation operators: COUNT, SUM, AVG, MIN, MAX;

--for help so results can be seen better
SELECT P.fname, P.lname, P.impfac, P.number, P.age
FROM PLAYERS P
--for help so results can be seen better




--find the number of the player with the smallest number for each impact factor ordered from the biggest to the smallest impact factor, for the biggest 3 impactfac.

SELECT TOP 3 P.impfac, MIN(P.number) AS NUMBER
FROM PLAYERS P
GROUP BY P.impfac
ORDER BY P.impfac DESC


--find the age of the oldest player for each impact factor of the top 2 smallest impact factors

SELECT TOP 2 P.impfac, MAX(P.AGE) AS maxAGE, MAX(P.AGE) + 15 AS shouldRETIRE
FROM PLAYERS P
GROUP BY P.impfac
ORDER BY P.impfac ASC


--find the average age of players who are at least 20 years old for each impact factor with at least 1 player.

SELECT P.impfac, AVG(P.age) AS AvgAge, AVG(P.age) * 1.12 AS LastWCAvgAge
FROM PLAYERS P
WHERE P.AGE >= 18
GROUP BY P.impfac
HAVING 1 < ( SELECT COUNT (*)
			 FROM PLAYERS P2
			 WHERE P2.impfac = P.impfac )


--find the maximum price of a game who was played by spain either as a home team or away team with Istvan Kovacs as Central Referee 

SELECT MAX(G.price) as MAXPRICE
FROM GAMES G
WHERE G.FKATID = 3 OR G.FKHTID = 3
GROUP BY G.FKCRID
HAVING 1 < ( SELECT COUNT (*)
			 FROM GAMES G2
			 WHERE G2.FKCRID = G.FKCRID AND G2.FKCRID = 1 )





------i. 4 queries using ANY and ALL to introduce a subquery in the WHERE clause (2 queries per operator)
----	 rewrite 2 of them with aggregation operators, and the other 2 with IN / [NOT] IN.



--players with an impact factor greater than the impact factor of any of the players playing with number 10

SELECT *
FROM PLAYERS P
WHERE P.impfac > ANY ( SELECT P2.impfac
					   FROM PLAYERS P2
					   WHERE P2.number = 10 )
--rewriting it to use IN/ [NOT] IN--
SELECT *
FROM PLAYERS P3
WHERE P3.impfac IN    ( SELECT P.impfac
						FROM PLAYERS P
						WHERE P.impfac > ANY   ( SELECT P2.impfac
												 FROM PLAYERS P2
												 WHERE P2.number = 10 ) 
																		)



--games with a price greater than the price of any of the games played in the semi-final stage. The final game.

SELECT *
FROM GAMES G
WHERE G.price > ANY ( SELECT G2.price
					  FROM GAMES G2
					  WHERE G2.FKSTID = 2 )
--rewriting it to use IN/ [NOT] IN--
SELECT *
FROM GAMES G
WHERE G.price NOT IN ( SELECT G2.price
					   FROM GAMES G2
				       WHERE G2.FKSTID = 2 )



--players with an impact factor greater or equal than the impact factor of every player playing with number 11

SELECT *
FROM PLAYERS P
WHERE P.impfac > ALL ( SELECT P2.impfac
					   FROM PLAYERS P2
					   WHERE P2.number = 11 )
--rewriting it to use aggregation operators--
SELECT P.PID, P.FKTID, P.fname, P.lname, P.number, P.impfac, P.age, AVG(P.impfac) AS AVGIMPFACT
FROM PLAYERS P
WHERE P.impfac > ALL ( SELECT P2.impfac
					   FROM PLAYERS P2
					   WHERE P2.number = 11 )
GROUP BY P.PID, P.FKTID, P.fname, P.lname, P.number, P.impfac, P.age



--players with an age smaller or equal than the age of every player with an impact factor >= 6

SELECT *
FROM PLAYERS P
WHERE P.age < ALL ( SELECT P2.age
					FROM PLAYERS P2
					WHERE P2.impfac >= 6 )

--rewriting it to use aggregation operators--
SELECT P.PID, P.FKTID, P.fname, P.lname, P.number, P.impfac, P.age, AVG(P.age) AS AVGAGE
FROM PLAYERS P
WHERE P.age < ALL ( SELECT P2.age
					FROM PLAYERS P2
					WHERE P2.impfac >= 6 )
GROUP BY P.PID, P.FKTID, P.fname, P.lname, P.number, P.impfac, P.age








-----------------------------------------------------------------------ASSIGNMENT 3---------------------------------------------------------------------------------
GO

-------------------------------a  modify the type of a column;
DROP PROCEDURE uspModifyColumnGMPriceFromIntToFloat
GO



CREATE PROCEDURE uspModifyColumnGMPriceFromIntToFloat
AS
	ALTER TABLE GAMES
	ALTER COLUMN price FLOAT;
GO





DROP PROCEDURE uspModifyBackColumnGMPriceFromFloatToInt
GO



CREATE PROCEDURE uspModifyBackColumnGMPriceFromFloatToInt
AS
	ALTER TABLE GAMES
	ALTER COLUMN price INT;
GO




-------------------------------b add / remove a column;
DROP PROCEDURE uspADDsppopularity
GO


CREATE PROCEDURE uspADDsppopularity
AS
	ALTER TABLE SPONSORS
	ADD sppopularity INT
GO





DROP PROCEDURE uspDROPsppopularity
GO


CREATE PROCEDURE uspDROPsppopularity
AS
	ALTER TABLE SPONSORS
	DROP COLUMN sppopularity
GO






-------------------------------c add / remove a DEFAULT constraint;
DROP PROCEDURE uspADDDEFCONSplnr
GO


CREATE PROCEDURE uspADDDEFCONSplnr
AS
	ALTER TABLE PLAYERS
	ADD CONSTRAINT playernumber
	DEFAULT 1 FOR number
GO







DROP PROCEDURE uspDROPDEFCONSplnr
GO


CREATE PROCEDURE uspDROPDEFCONSplnr
AS 
	ALTER TABLE PLAYERS
	DROP CONSTRAINT playernumber
GO




 -------------------------------e  add / remove a candidate key

 GO
 CREATE OR ALTER PROCEDURE uspADDCKref
 AS
	ALTER TABLE REFEREES
	ADD CONSTRAINT REFEREE_CANDIDATE_KEY UNIQUE(RID, rfname, rlanme)


GO 
CREATE OR ALTER PROCEDURE uspDROPCKref
AS
	ALTER TABLE REFEREES
	DROP CONSTRAINT REFEREE_CANDIDATE_KEY




 -------------------------------f add / remove a foreign key

 GO
 CREATE OR ALTER PROCEDURE uspADDFKeyvenues
 AS
	ALTER TABLE VENUES
	ADD CONSTRAINT VENUE_FOREIGN_KEY FOREIGN KEY(FKRID) REFERENCES REFEREES(RID)


GO
CREATE OR ALTER PROCEDURE uspDROPFKeyvenues
AS 
	ALTER TABLE VENUES
	DROP CONSTRAINT VENUE_FOREIGN_KEY



 -------------------------------g create / drop a table.
 
 GO
 CREATE OR ALTER PROCEDURE uspADDTableFans
 AS
		CREATE TABLE FANS(
		TEAMFANID INT,
		TEAMNAME VARCHAR(50) NOT NULL,
		CONSTRAINT TEAM_FAN_ID PRIMARY KEY(TEAMFANID)
	)
GO


GO
CREATE OR ALTER PROCEDURE uspDROPTableFans
AS
	DROP TABLE FANS



 
-------------------------------d add / remove a primary key;

--aici trebe prima data sa adauga un constraint primary key constraint ca pe w3 schools
GO
CREATE OR ALTER PROCEDURE uspADDPKFansTFID
AS
	ALTER TABLE FANS
		DROP CONSTRAINT TEAM_FAN_ID
	ALTER TABLE FANS
		ADD CONSTRAINT TEAM_FAN_ID PRIMARY KEY (TEAMFANID, TEAMNAME)
GO



GO
CREATE OR ALTER PROCEDURE uspDROPPKFansTFID
AS
	ALTER TABLE FANS
		DROP CONSTRAINT TEAM_FAN_ID
	ALTER TABLE FANS
		ADD CONSTRAINT TEAM_FAN_ID PRIMARY KEY(TEAMFANID)
GO

-- A table that contains the current version of the database schema
DROP TABLE versionTable
CREATE TABLE versionTable(
	version INT
)

INSERT INTO versionTable(version)
VALUES (1) --the initial version


-- A table that contains the initial version, the version after the execution of the procedure and the procedure that changes the table in a way
DROP TABLE procedureTable
CREATE TABLE procedureTable(
	initial_version INT,
	final_version INT,
	procedure_name VARCHAR(100),
	PRIMARY KEY (initial_version, final_version)
)

INSERT INTO procedureTable(initial_version, final_version, procedure_name)
VALUES
	--a
	(1, 2, 'uspModifyColumnGMPriceFromIntToFloat'),
	(2, 1, 'uspModifyBackColumnGMPriceFromFloatToInt'),
	--b
	(2, 3, 'uspADDsppopularity'),
	(3, 2, 'uspDROPsppopularity'),
	--c
	(3, 4, 'uspADDDEFCONSplnr'),
	(4, 3, 'uspDROPDEFCONSplnr'),
	--g
	(4, 5, 'uspADDTableFans'),
	(5, 4, 'uspDROPTableFans'),
	--d
	(5, 6, 'uspADDPKFansTFID'),
	(6, 5, 'uspDROPPKFansTFID'),
	--e
	(6, 7, 'uspADDCKref'),
	(7, 6, 'uspDROPCKref'),
	--f
	(7, 8, 'uspADDFKeyvenues'),
	(8, 7, 'uspDROPFKeyvenues')


 --procedure to bring the database to the specified version
 GO
 CREATE OR ALTER PROCEDURE uspGoToVersion(@newVersion INT)
 AS
	DECLARE @current_version INT
	DECLARE @procedureName VARCHAR(100)
	SELECT @current_version = version FROM versionTable

	IF(@newVersion > (SELECT MAX(final_version) FROM procedureTable) OR @newVersion<1)
		PRINT ('Bad version!')
	ELSE
	BEGIN
		IF @newVersion = @current_version
			PRINT('You are already on this version!');
		ELSE
		BEGIN
			IF @current_version > @newVersion
			BEGIN
				WHILE @current_version > @newVersion
				BEGIN
					SELECT @procedureName = procedure_name FROM procedureTable WHERE initial_version = @current_version AND final_version = @current_version-1
					EXEC(@procedureName)
					SET @current_version = @current_version - 1
				END
			END
			IF @current_version < @newVersion
			BEGIN 
				WHILE @current_version < @newVersion
				BEGIN 
					SELECT @procedureName = procedure_name FROM procedureTable WHERE initial_version = @current_version AND final_version = @current_version + 1
					EXEC(@procedureName)
					SET @current_version = @current_version + 1
				END
			END

			UPDATE versionTable SET version = @newVersion
		END
	END

GO
EXEC uspGoToVersion 4

SELECT *
FROM SPONSORS

GO
EXEC uspGoToVersion 5

SELECT *
FROM FANS

GO
EXEC uspGoToVersion 1

SELECT *
FROM SPONSORS

SELECT *
FROM versionTable

SELECT *
FROM procedureTable



SELECT *
FROM sys.objects AS A
WHERE A.schema_id = 1

SELECT *
FROM sys.all_columns

SELECT *
FROM sys.all_views