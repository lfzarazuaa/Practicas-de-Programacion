CREATE TABLE `authors` (
  `author_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  UNIQUE KEY `uniq_author` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

CREATE TABLE `books` (
  `book_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `year` int(11) NOT NULL DEFAULT '1900',
  `language` varchar(2) NOT NULL COMMENT 'ISO 639-1 Language code (2 chars)',
  `cover_url` varchar(500) DEFAULT NULL,
  `price` double(6,2) DEFAULT NULL,
  `sellable` tinyint(1) NOT NULL DEFAULT '0',
  `copies` int(11) NOT NULL DEFAULT '1',
  `description` text,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `book_language` (`title`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8;

CREATE TABLE `clients` (
  `client_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

CREATE TABLE `transactions` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `type` enum('lend','sell','return') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `finished` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--1.¿Qué nacionalidades hay?
--Muestra la columna de nacionalidades.
SELECT `nationality` FROM `authors`; 
--Agrupa por nacionalidades ascendientemente excluyendo a null.
SELECT `nationality`, COUNT(`author_id`) AS `Authors`, author_id AS `first Author id` 
FROM `authors`
WHERE `nationality` IS NOT NULL
GROUP BY `nationality`
ORDER BY `Authors` DESC, `nationality` ASC;
--Ordenar usando DISTINCT.
SELECT DISTINCT (`nationality`)
FROM `authors`
ORDER BY `nationality` DESC;
--2.¿Cuántos escritores hay de cada nacionalidad?
SELECT `nationality`, COUNT(`author_id`) AS `Authors`
FROM `authors`
GROUP BY `nationality`
ORDER BY `Authors` DESC, `nationality` ASC;
--Excluye las nacionalidades dichas.
SELECT `nationality`, COUNT(`author_id`) AS `Authors`, author_id AS `first Author id` 
FROM `authors`
WHERE `nationality` IS NOT NULL
	AND `nationality` NOT IN ('RUS','SWE')
GROUP BY `nationality`
ORDER BY `Authors` DESC, `nationality` ASC;
--Uso de la condicional distinto de <>
SELECT `nationality`, COUNT(`author_id`) AS `Authors`, author_id AS `first Author id` 
FROM `authors`
WHERE `nationality` IS NOT NULL
	AND `nationality` <> 'RUS'
GROUP BY `nationality`
ORDER BY `Authors` DESC, `nationality` ASC;
--3.¿Cuántos libros hay de cada nacionalidad?
--Excluye las nacionalidades dichas.
SELECT `nationality`,COUNT(DISTINCT(a.author_id)) AS Authors, COUNT(`title`) AS `Books`
FROM `authors` AS a
LEFT JOIN `books` AS b
	ON a.author_id = b.author_id
GROUP BY `nationality`
ORDER BY `nationality` ASC;
--4.¿Cuál es el promedio y la desviación estándar de libros?
--Calcula el promedio y la desviación estándar para todos los libros.
SELECT AVG(`price`),STDDEV(`price`) FROM `books`;
--Ordena por lenguaje campo de la misma tabla.
SELECT `language`,COUNT(book_id) AS Books,COUNT(book_id)*AVG(copies) AS Samples, MAX(`price`), AVG(`price`), MIN(`price`), STDDEV(`price`)
FROM `books`
GROUP BY `language`;
--Ordena por número de copias campo de la misma tabla.
SELECT `copies`,COUNT(book_id) AS Books,COUNT(book_id)*copies AS Samples, MAX(`price`), AVG(`price`), MIN(`price`), STDDEV(`price`)
FROM `books`
GROUP BY `copies`
ORDER BY `copies`;
--5.¿Cuál es el promedio y la desviación estándar de libros por nacionalidad?
--Ordena por nacionalidad del autor dato de otra tabla.
SELECT `nationality`,COUNT(`title`) AS Books,COUNT(`title`)*AVG(copies) AS Samples, MAX(`price`), AVG(`price`), MIN(`price`), STDDEV(`price`)
FROM `books` AS b
LEFT JOIN `authors` AS a
	ON a.author_id = b.author_id
GROUP BY `nationality`	
ORDER BY `Books` DESC, `nationality` ASC;
--6.¿Cuál es el máximo y el mínimo en precio?
SELECT `title`, `price` FROM `books`
ORDER BY `price` ASC;
SELECT `title`, `price` FROM `books`
ORDER BY `price` DESC;
SELECT `title`, MAX(`price`),a.name FROM `books` AS b
LEFT JOIN `authors` AS a
	ON a.author_id = b.author_id;
SELECT `title`, MIN(`price`),a.name FROM `books` AS b
LEFT JOIN `authors` AS a
	ON a.author_id = b.author_id;
--7.¿Cómo queda el reporte final de prestamos?
--Quien opero,que libro,cuando fue.
--TO_DAYS(dias desde el año cero)
SELECT TO_DAYS(NOW());
SELECT name, TO_DAYS(birthdate) FROM clients;
SELECT c.name AS `Client`,t.type AS `Transaction`, b.title AS `Book`,CONCAT(a.name," (",a.nationality,")") AS `Author`, t.modified_at `Date`,
	TO_DAYS(NOW()) - TO_DAYS(t.created_at) AS AGO
FROM `transactions` AS t
LEFT JOIN `clients` AS c
	ON c.client_id = t.client_id
LEFT JOIN `books` AS b
	ON b.book_id = t.book_id
LEFT JOIN `authors` AS a
	ON a.author_id = b.author_id;








