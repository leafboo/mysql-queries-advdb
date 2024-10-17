USE seatworkdb;

-- artist
DELIMITER //
CREATE PROCEDURE spArtistInsert
(
	IN v_artistID INT,
    IN v_artistName VARCHAR(50)
)
BEGIN
	INSERT 	INTO artist(ArtistID,ArtistName)
    VALUES(v_artistID, v_artistName);
END
//

DELIMITER //
CREATE PROCEDURE spArtistUpdate
(
	IN v_artistID INT,
    IN v_artistName VARCHAR(50)
)
BEGIN
	UPDATE artist a
    SET a.artistName=v_artistName
    WHERE a.artistID=v_artistID;
END 
//

DELIMITER //
CREATE PROCEDURE spArtistDelete
(
	IN v_artistID INT
)
BEGIN
	DELETE 
    FROM artist a 
    WHERE a.artistID=v_artistID;
END 
//

DELIMITER //
CREATE PROCEDURE spArtistSelect
(
	IN v_artistID INT,
    IN v_artistName VARCHAR(5)
)
BEGIN
	SELECT * FROM artist a
    WHERE a.artistID=IFNULL(v_artistID, a.artistID) 
    AND a.artistName=IFNULL(v_artistName, a.artistName); 
END 
//


CALL spArtistInsert(10001, 'Juan Luna');
CALL spArtistUpdate(10001, 'Luna Juan');
CALL spArtistDelete(10001);
CALL spArtistSelect(10001, null);





-- Art Object
DELIMITER //
CREATE PROCEDURE spArtObjectInsert
(
	IN v_artID INT,
    IN v_title VARCHAR(50),
    IN v_desc VARCHAR(255),
	IN v_artistID INT
)
BEGIN
	INSERT 	INTO ArtObject(ArtID,title,description,ArtistID)
    VALUES(v_artID, v_title,v_desc,v_artistID);
END
//


DELIMITER //
CREATE PROCEDURE spArtObjectUpdate
(
	IN v_artID INT,
    IN v_title VARCHAR(50),
    IN v_desc VARCHAR(255)
)
BEGIN
	UPDATE artObject a
    SET a.title=v_title, a.desc=v_desc
    WHERE a.artID=v_artID;
END 
//


DELIMITER //
CREATE PROCEDURE spArtObjectDelete
(
	IN v_artID INT
)
BEGIN
	DELETE 
    FROM artObject a 
    WHERE a.artID=v_artID;
END 
//

DELIMITER //
CREATE PROCEDURE spArtObjectSelect
(
	IN v_artID INT,
    IN v_title VARCHAR(50)
)
BEGIN
	SELECT * FROM artObject a
    WHERE a.artID=IFNULL(v_artID, a.artID) 
    AND a.title=IFNULL(v_title, a.title); 
END 
//
CALL spArtObjectInsert(10001, 'Mona Lisa', 'perfection', 10001);
CALL spArtObjectUpdate(10001, 'Luna Juan');
CALL spArtObjectDelete(10001);
CALL spArtObjectSelect(10001, null);


-- Painting
DELIMITER //
CREATE PROCEDURE spPaintingInsert
(
	IN v_artID INT,
    IN v_drawnOn VARCHAR(25)
)
BEGIN
	INSERT 	INTO painting(artID,drawnOn)
    VALUES(v_artID, v_drawnOn);
END
//


DELIMITER //
CREATE PROCEDURE spPaintingUpdate
(
	IN v_artID INT,
    IN v_drawnOn VARCHAR(25)
)
BEGIN
	UPDATE painting p
    SET p.drawnOn=v_drawnOn
    WHERE p.artID=v_artID;
END 
//

DELIMITER //
CREATE PROCEDURE spPaintingDelete
(
	IN v_artID INT,
    IN v_drawnOn VARCHAR(25)
)
BEGIN
	DELETE 
    FROM painting p 
    WHERE p.artID=v_artID;
END 
//

DELIMITER //
CREATE PROCEDURE spPaintingSelect
(
	IN v_artID INT,
    IN v_drawnOn VARCHAR(25)
)
BEGIN
	SELECT * FROM painting p
    WHERE p.artID=IFNULL(v_artID, p.artID) 
    AND p.drawnOn=IFNULL(v_drawnOn, p.drawnOn); 
END 
//

CALL spPaintingInsert(10001, 'Canvas');
CALL spPaintingDelete(10001, null);



-- Sculpture
DELIMITER //
CREATE PROCEDURE spSculptureInsert
(
	IN v_artID INT,
    IN v_weight FLOAT,
	IN v_height FLOAT
)
BEGIN
	INSERT 	INTO sculpture(artID, weight, height)
    VALUES(v_artID, v_weight, v_height);
END
//


DELIMITER //
CREATE PROCEDURE spSculptureUpdate
(
	IN v_artID INT,
    IN v_weight FLOAT,
	IN v_height FLOAT
)
BEGIN
	UPDATE sculpture s
    SET s.weight=v_weight, s.height=v_height
    WHERE s.artID=v_artID;
END 
//

DELIMITER //
CREATE PROCEDURE spSculptureDelete
(
	IN v_artID INT
)
BEGIN
	DELETE 
    FROM sculpture s
    WHERE s.artID=v_artID;
END 
//

DELIMITER //
CREATE PROCEDURE spSculptureSelect
(
	IN v_artID INT,
    IN v_weight FLOAT,
	IN v_height FLOAT
)
BEGIN
	SELECT * FROM sculpture s
    WHERE s.artID=IFNULL(v_artID, s.artID);
END 
//

CALL spSculptureInsert(10001, 10, 20);




SELECT * FROM artist;
SELECT * FROM ArtObject;
SELECT * FROM painting;
SELECT * FROM sculpture;