
CREATE database MANGA;
SHOW DATABASES;
USE MANGA;

drop table volumes;

CREATE TABLE IF NOT EXISTS `mangas` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `editora` VARCHAR(45) NOT NULL,
  `autor` VARCHAR(45) NULL,
  `edicao` VARCHAR(100) NOT NULL,
  `qtd_pags` INT NULL,
  `total_volumes` INT NOT NULL,
  PRIMARY KEY (`ID`));


CREATE TABLE IF NOT EXISTS `volumes` (
  `id_manga` INT NOT NULL,
  `numero` INT NOT NULL,
  `tenho` BOOL NOT NULL,
  PRIMARY KEY (`id_manga`, `numero`),
  CONSTRAINT `fk_volumes_id` FOREIGN KEY (`id_manga`) REFERENCES `mangas` (`ID`));
  
  
alter table volumes
alter column tenho boolean;

delete from volumes where id_manga = 1;
  
--  Inserts
  
  
  
INSERT INTO `mangas` (`ID`, `titulo`, `editora`, `autor`, `edicao`, `qtd_pags`, `total_volumes`)
	VALUES (1, 'Afro Samurai', 'Panini', 'Takashi Okazaki', '2009 panini brasil', 200, 2);
INSERT INTO `volumes` (`id_manga`, `numero`, `tenho`) 
	VALUES (1, 1, TRUE),
			(1, 2, TRUE);
            
            



-- Selects

SELECT * FROM mangas as m
inner JOIN volumes as v
where m.ID = v.id_manga;

SELECT m.ID, m.titulo, v.numero, v.tenho FROM mangas as m
JOIN volumes as v
where m.ID = v.id_manga;
