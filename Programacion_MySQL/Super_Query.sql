--SUPER QUERY
--Matriz que dependa de los años y nacionalidad.
SELECT DISTINCT nationality FROM authors;
UPDATE authors
SET
	nationality='GBR'
WHERE
	nationality='ENG';
--COUNT suma 1 cada vez que pasa por un renglón.
SELECT COUNT(*) FROM books;
--
SELECT COUNT(book_id), SUM(1) FROM books;
--Inventario total
SELECT sum(price*copies) FROM books WHERE sellable = 1;
--if(condicion,retorno_verdadero,retorno_falso)
SELECT sellable, SUM(price*copies) FROM books GROUP BY sellable;
--if(condicion,retorno_verdadero,retorno_falso)
--Libros menores a 1950.
SELECT COUNT(book_id), SUM(if(`year`<1950,1,0)) AS `<1950` FROM books;
--Usando WHERE
SELECT COUNT(book_id) FROM books WHERE `year` < 1950;
--Matriz de antes y despues de 1950.
SELECT nationality,COUNT(book_id) AS `BOOKS`,
		SUM(if(`year`<1950,1,0)) AS `<1950`,
		SUM(if(`year`>=1950 AND `year`<1990,1,0)) AS `>=1950 AND <1990`,
		SUM(if(`year`>=1990 ,1,0)) AS `>=1990`
FROM books as b
JOIN authors as a
	ON a.author_id=b.author_id
GROUP BY nationality
ORDER BY nationality ASC, `BOOKS` DESC;