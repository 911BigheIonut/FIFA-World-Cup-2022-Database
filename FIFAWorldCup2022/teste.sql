--------Tabela Tables



INSERT INTO Tables(Name) VALUES
('COACHES'), --only one primary key
('TEAMS'), --a primary key and at least a foreign key
('sponsor'); --a multicoloumn primary key

GO

--CREARE VIEW-URI

CREATE OR ALTER VIEW VCOACHES --a view with a SELECT statement operating on one table;
AS
SELECT CID, cfname, clname
FROM COACHES
GO


CREATE OR ALTER VIEW VTEAMS --a view with a SELECT statement that operates on at least 2 different tables and contains at least one JOIN operator;
AS
SELECT T.tname, C.cfname 
FROM TEAMS T
INNER JOIN COACHES C ON C.CID = T.FKCID
GO


CREATE OR ALTER VIEW VSPONSOR --a view with a SELECT statement that has a GROUP BY clause, operates on at least 2 different tables and contains at least one JOIN operator.
AS
SELECT SS.spname, COUNT(*) as 'Nr sponsori'
FROM SPONSORS SS
INNER JOIN sponsor S ON S.FKSPID = SS.SPID
INNER JOIN TEAMS T ON S.FKTID = T.TID
GROUP BY SS.spname
GO

--------Tabela View
INSERT INTO Views VALUES
('VCOACHES'),
('VTEAMS'),
('VSPONSOR');
GO



--------Tabela Tests
INSERT INTO Tests(Name) VALUES
('Inserare10'),
('Inserare100'),
('Inserare1000'),
('Sterge10'),
('Sterge100'),
('Sterge1000'),
('Evaluare')
GO



-------Tabela TestTables
INSERT INTO TestTables VALUES
(1, 1, 10, 1),
(2, 1, 100, 1),
(3, 1, 1000, 1),
(1, 2, 10, 2),
(2, 2, 100, 2),
(3, 2 ,1000, 2),
(1, 3, 10, 3),
(2, 3, 100, 3),
(3, 3, 1000, 3),

(4, 1, 10, 3),
(5, 1, 100, 3),
(6, 1, 1000, 3),
(4, 2, 10, 2),
(5, 2, 100, 2),
(6, 2 ,1000, 2),
(4, 3, 10, 1),
(5, 3, 100, 1),
(6, 3, 1000, 1)
GO



--------Tabela TestViews 
INSERT INTO TestViews VALUES 
(7,1),
(7,2),
(7,3)
GO



----Inserare in tabela COACHES
CREATE OR ALTER PROCEDURE InsertCoaches(@rows int)
AS
BEGIN
	DECLARE @id int
	DECLARE @nume VARCHAR(50)
	DECLARE @prenume VARCHAR(50)
	DECLARE @i int
	DECLARE @lastId int
	SET @nume = 'NumeCoach'
	SET @prenume = 'PrenumeCoach'
	SET @id=2000
	SET @i=1

	WHILE @i<=@rows
	BEGIN
		SET @id = 2000+@i
		SELECT TOP 1 @lastId = COACHES.CID FROM dbo.COACHES ORDER BY COACHES.CID DESC
		IF @lastId > 2000
			SET @id = @lastId + 1
		INSERT INTO COACHES VALUES (@id, @prenume, @nume)
		SET @i = @i + 1
	END
END
GO


----Stergere din tabela COACHES
CREATE OR ALTER PROCEDURE DeleteCoaches(@rows int)
AS
BEGIN
	DECLARE @id int
	DECLARE @i int
	DECLARE @lastId int

	SET @id = 2000
	SET @i = @rows

	WHILE @i>0
	BEGIN
		SET @id = 2000 + @i
		SELECT TOP 1 @lastId = COACHES.CID FROM dbo.COACHES ORDER BY COACHES.CID DESC
		IF @lastId >@id
			SET @id = @lastId
		DELETE FROM COACHES WHERE COACHES.CID = @id
		SET @i = @i - 1
	END
END
GO



----Inserare in tabela TEAMS
CREATE OR ALTER PROCEDURE InsertTeams (@rows int)
AS
BEGIN /*
	DECLARE @id int
	DECLARE @nume VARCHAR(50)
	DECLARE @i int
	DECLARE @lastId int

	SET @nume = 'NumeEchipa'
	SET @id = 2000
	SET @i = 1

	WHILE @i<=@rows
	BEGIN
		SET @id = 2000 + @i
		SELECT TOP 1 @lastId = TEAMS.TID FROM DBO.TEAMS ORDER BY TEAMS.TID DESC
		IF @lastId >2000
			SET @id = @lastId + 1
		INSERT INTO TEAMS VALUES(@id, 101, @nume)
		SET @i=@i+1
	END
END*/
	DECLARE @i int
	SET @i = @rows
	exec InsertCoaches @rows
	--cursor
	DECLARE @idC int ,@Prenume VARCHAR(50), @Nume VARCHAR(50);
	DECLARE cursorCoaches CURSOR SCROLL FOR
	SELECT CID, cfname, clname FROM COACHES;
	OPEN cursorCoaches;
	FETCH LAST FROM cursorCoaches INTO @idC, @Prenume, @Nume;
	PRINT('AIIICI')
	WHILE @i>0 and @@FETCH_STATUS=0
		BEGIN
		INSERT INTO TEAMS VALUES(1,@idC, 'echipa')
		FETCH PRIOR FROM cursorCoaches INTO @idC, @Prenume, @Nume;
		SET @i=@i-1
	END

	CLOSE cursorpersoane;
	DEALLOCATE cursorpersoane;
END
GO


---Stergere din tabela TEAMS
CREATE OR ALTER PROCEDURE DeleteTeams(@rows int)
AS
BEGIN /*
	DECLARE @id int
	DECLARE @i int
	DECLARE @lastId int

	SET @id = 2000
	SET @i=@rows

	WHILE @i>0
	BEGIN
		SET @id=2000+@i
		SELECT TOP 1 @lastId = TEAMS.TID FROM dbo.TEAMS ORDER BY TEAMS.TID DESC
		IF @lastId >@id
			SET @id=@lastId		
		DELETE FROM TEAMS WHERE TEAMS.TID = @id --ON CASCADE
		SET @i=@i-1
	END*/
	DECLARE @idC int
	DECLARE @i int

	SET @i = @rows
	
	WHILE @i>0
	BEGIN
		SELECT TOP 1 @idC = COACHES.CID from dbo.COACHES order by COACHES.CID desc
		if @idC > 2000
		BEGIN
			DELETE FROM TEAMS WHERE TEAMS.FKCID =@idC
			EXEC DeleteCoaches 1
			END
		SET @i=@i-1
	END
END

GO


	   	 
---Inserare in tabela sponsor
CREATE OR ALTER PROCEDURE InsertSponsors (@rows int)
AS
BEGIN
	DECLARE @i int
	SET @i = @rows

	exec InsertTeams @rows
	---cursor
	DECLARE @idT int, @idC int,  @Nume VARCHAR(50);
	DECLARE cursorEchipe CURSOR SCROLL FOR
	SELECT TID, FKCID, tname FROM TEAMS;
	OPEN cursorEchipe;
	FETCH LAST FROM cursorEchipe INTO @idT, @idC, @Nume;

	WHILE @i>0 AND @@FETCH_STATUS=0
		BEGIN
		INSERT INTO sponsor VALUES(1,@idT, 0)
		FETCH PRIOR FROM cursorEchipe INTO @idT, @idC, @Nume;
		SET @i = @i-1
	END

	CLOSE cursorEchipe;
	DEALLOCATE cursorEchipe;
END
GO



---Stergere din tabela sponsor
CREATE OR ALTER PROCEDURE DeleteSponsors (@rows int)
AS
BEGIN
	DECLARE @idS int
	DECLARE @i int
	DECLARE @idT int

	SET @i=@rows
	SET @idS=1
	WHILE @i>0
	BEGIN 
		SELECT TOP 1 @idT = TEAMS.TID from dbo.TEAMS ORDER BY TEAMS.TID DESC
		IF @idT > 2000
		BEGIN
			DELETE FROM sponsor WHERE sponsor.FKSPID = 1 AND sponsor.FKTID = @idT
			exec DeleteTeams 1
		END
		SET @i=@i-1
	END
END
GO



---Testele
CREATE OR ALTER PROCEDURE Inserare10 (@Tabela VARCHAR(20))
AS
BEGIN
	IF @Tabela='COACHES'
	exec InsertCoaches 10
	IF @Tabela='TEAMS'
	exec InsertTeams 10
	IF @Tabela='sponsor'
	exec InsertSponsors 10
	else PRINT 'Nume invalid'
END
GO


CREATE OR ALTER PROCEDURE Inserare100 (@Tabela VARCHAR(20))
AS
BEGIN
	IF @Tabela='COACHES'
	exec InsertCoaches 100
	IF @Tabela='TEAMS'
	exec InsertTeams 100
	IF @Tabela='sponsor'
	exec InsertSponsors 100
	else PRINT 'Nume invalid'
END
GO


CREATE OR ALTER PROCEDURE Inserare1000 (@Tabela VARCHAR(20))
AS
BEGIN
	IF @Tabela='COACHES'
	exec InsertCoaches 1000
	IF @Tabela='TEAMS'
	exec InsertTeams 1000
	IF @Tabela='sponsor'
	exec InsertSponsors 1000
	else PRINT 'Nume invalid'
END
GO



CREATE OR ALTER PROCEDURE Sterge10 (@Tabela VARCHAR(50))
AS
BEGIN
	IF @Tabela='COACHES'
	exec DeleteCoaches 10
	IF @Tabela='TEAMS'
	exec DeleteTeams 10
	IF @Tabela='sponsor'
	exec DeleteSponsors 10
	else PRINT 'Nume invalid'
END
GO


CREATE OR ALTER PROCEDURE Sterge100 (@Tabela VARCHAR(50))
AS
BEGIN
	IF @Tabela='COACHES'
	exec DeleteCoaches 100
	IF @Tabela='TEAMS'
	exec DeleteTeams 100
	IF @Tabela='sponsor'
	exec DeleteSponsors 100
	else PRINT 'Nume invalid'
END
GO


CREATE OR ALTER PROCEDURE Sterge1000 (@Tabela VARCHAR(50))
AS
BEGIN
	IF @Tabela='COACHES'
	exec DeleteCoaches 1000
	IF @Tabela='TEAMS'
	exec DeleteTeams 1000
	IF @Tabela='sponsor'
	exec DeleteSponsors 1000
	else PRINT 'Nume invalid'
END
GO


CREATE OR ALTER PROCEDURE Evaluare (@View VARCHAR(20))
AS
BEGIN
	IF @View = 'COACHES'
	SELECT * FROM VCOACHES
	IF @View = 'TEAMS'
	SELECT * FROM VTEAMS
	IF @View = 'sponsor'
	select * FROM VSPONSOR
	ELSE PRINT 'Nume invalid'
END
GO



--- Procedura principala ----------------------------------------------
CREATE OR ALTER PROCEDURE Main (@Tabela VARCHAR(20))
AS
BEGIN
	DECLARE @t1 datetime, @t2 datetime, @t3 datetime
	DECLARE @desc NVARCHAR(2000)

	DECLARE @testInserare VARCHAR(20)
	DECLARE @testSterge VARCHAR(20)
	DECLARE @nrRows int
	DECLARE @idTest int

	SET @nrRows=1000
	SET @testInserare='Inserare' + CONVERT(VARCHAR (5),@nrRows)
	SET @testSterge='Sterge'++ CONVERT(VARCHAR (5),@nrRows)


	if @Tabela='COACHES'
		BEGIN
			SET @t1 =GETDATE()
			exec @testInserare COACHES
			exec @testSterge COACHES
			SET @t2 =GETDATE()
			exec Evaluare COACHES
			SET @t3 =GETDATE()
			SET @desc=N'Testul s-a facut '+@testInserare+', '+@testSterge+', EvaluareView pe tabela '+@Tabela
			INSERT INTO TestRuns VALUES (@desc,@t1,@t3)
			SELECT TOP 1 @idTest=T.TestRunID FROM dbo.TestRuns T ORDER BY T.TestRunID DESC
			INSERT INTO TestRunTables VALUES (@idTest,1,@t1,@t2)
			INSERT INTO TestRunViews VALUES (@idTest,1,@t2,@t3)
		END
	if @Tabela='TEAMS'
		BEGIN
			SET @t1 =GETDATE()
			exec @testInserare TEAMS
			exec @testSterge TEAMS
			SET @t2 =GETDATE()
			exec Evaluare TEAMS
			SET @t3 =GETDATE()
			SET @desc=N'Testul s-a facut '+@testInserare+', '+@testSterge+', EvaluareView pe tabela '+@Tabela
			INSERT INTO TestRuns VALUES (@desc,@t1,@t3)
			SELECT TOP 1 @idTest=T.TestRunID FROM dbo.TestRuns T ORDER BY T.TestRunID DESC
			INSERT INTO TestRunTables VALUES (@idTest,3,@t1,@t2)
			INSERT INTO TestRunViews VALUES (@idTest,3,@t2,@t3)
		END
	if @Tabela='sponsor'
		BEGIN
			SET @t1 =GETDATE()
			exec @testInserare sponsor
			exec @testSterge sponsor
			SET @t2 =GETDATE()
			exec Evaluare sponsor
			SET @t3 =GETDATE()
			SET @desc=N'Testul s-a facut '+@testInserare+', '+@testSterge+', EvaluareView pe tabela '+@Tabela
			INSERT INTO TestRuns VALUES (@desc,@t1,@t3)
			SELECT TOP 1 @idTest=T.TestRunID FROM dbo.TestRuns T ORDER BY T.TestRunID DESC
			INSERT INTO TestRunTables VALUES (@idTest,2,@t1,@t2)
			INSERT INTO TestRunViews VALUES (@idTest,2,@t2,@t3)
		END
	ELSE PRINT 'Tabela invalida'
END

exec Main COACHES
exec Main TEAMS
exec Main sponsor

select * from TestRuns
select * from TestRunTables
select * from TestRunViews


--- Pentru cand mai fac chestii naspa. Sa le sterg rapid :D
DROP TABLE TestRunViews
DROP TABLE TestRunTables
DROP TABLE TestRuns
DROP TABLE TestTables
DROP TABLE TestViews
DROP TABLE Tests
DROP TABLE Tables
DROP TABLE Views