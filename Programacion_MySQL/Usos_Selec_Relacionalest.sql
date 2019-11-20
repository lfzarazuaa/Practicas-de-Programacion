SELECT * FROM authors WHERE author_id > 0 AND author_id <=5;
--Presenta la información con id.
SELECT * FROM books WHERE author_id > 0 AND author_id <=5;
--Presenta la información con id de las columnas book_id, author_id,title.
SELECT book_id, author_id,title FROM books WHERE author_id > 0 AND author_id <=5;
--Relaciona el id del autor para obtener el nombre del autor.
SELECT b.book_id, a.name , b.title
FROM books AS b
JOIN authors AS a
	ON a.author_id = b.author_id
WHERE b.author_id > 0 AND b.author_id <=5;
--Uso del BETWEEN como condicional.
SELECT b.book_id, a.name , b.title
FROM books AS b
JOIN authors AS a
	ON a.author_id = b.author_id
WHERE b.author_id BETWEEN 0 AND 5;
--Mostrar al autor 4 de quien no se poseen libros registrados.
SELECT * FROM authors WHERE author_id=4;
--Mostrar datos con id's en transacciones.
SELECT * FROM transactions;
--Mostrar datos usando bases relacionales con inner join usando un pivote externo al original (b.author_id).
SELECT t.transaction_id,c.name as 'Client',b.title as 'Title',a.name as 'Author',t.type as 'Operation',t.finished as 'State'
FROM transactions AS t
JOIN books AS b
	ON t.book_id = b.book_id
JOIN clients AS c
	ON t.client_id = c.client_id
JOIN authors AS a
	ON b.author_id = a.author_id;
--Base de datos relacional con condicional usando IN para selecionar las cadenas deseadas.
SELECT t.transaction_id,c.name as 'Client',b.title as 'Title',a.name as 'Author',t.type as 'Operation',t.finished as 'State'
FROM transactions AS t
JOIN books AS b
	ON t.book_id = b.book_id
JOIN clients AS c
	ON t.client_id = c.client_id
JOIN authors AS a
	ON b.author_id = a.author_id
WHERE c.gender = 'M'
	AND t.type IN('sell','lend');
--INNER Join con condicional
SELECT a.author_id, b.title, a.nationality, a.name
FROM authors AS a, books AS b
WHERE a.author_id = b.author_id
LIMIT 10;
--INNER Join Verifica que los elementos se encuentren en ambas tablas orden descendiente.
SELECT a.author_id, b.title, a.nationality, a.name
FROM authors AS a
INNER JOIN books AS b
	ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5
ORDER BY a.author_id ASC;
--INNER Join Verifica que los elementos se encuentren en ambas tablas orden ascendiente.
SELECT a.author_id, b.title, a.nationality, a.name
FROM authors AS a
INNER JOIN books AS b
	ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5
ORDER BY a.author_id DESC;
--LEFT Join Muestra todos los elementos se encuentren en la tabla pivote junto con las que se encuentran en ambas tablas.
SELECT a.author_id, b.title, a.nationality, a.name
FROM authors AS a
LEFT JOIN books AS b
	ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5
ORDER BY a.author_id ASC;
--RIGHT Join Muestra todos los elementos se encuentren en la tabla no pivote junto con las que se encuentran en ambas tablas.
SELECT a.author_id, b.title, a.nationality, a.name
FROM authors AS a
RIGHT JOIN books AS b
	ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5
ORDER BY a.author_id ASC;
--OUTER Join Muestra todos los elementos que se encuentran en ambas tablas.
SELECT a.author_id, b.title, a.nationality, a.name
FROM authors AS a
OUTER JOIN books AS b
	ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5
ORDER BY a.author_id ASC;
--LEFT excluding Join Muestra todos los elementos que no se encuentran en la tabla no pivote.
SELECT a.author_id, b.title, a.nationality, a.name
FROM authors AS a
LEFT JOIN books AS b
	ON a.author_id = b.author_id
WHERE b.author_id IS NULL AND a.author_id BETWEEN 1 AND 5
ORDER BY a.author_id ASC;
--RIGHT excluding Join Muestra todos los elementos que no se encuentran en la tabla pivote.
SELECT a.author_id, b.title, a.nationality, a.name
FROM authors AS a
RIGHT JOIN books AS b
	ON a.author_id = b.author_id
WHERE a.author_id IS NULL AND a.author_id BETWEEN 1 AND 5
ORDER BY a.author_id ASC;
--Usar COUNT para saber cuantos libros tiene cada autor y GROUP BY para pivotear sobre los elementos de a.author_id.
SELECT a.author_id, b.author_id, a.name, a.nationality, b.author_id, COUNT(b.author_id)
FROM authors AS a
LEFT JOIN books AS b
	ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5
GROUP BY a.author_id
ORDER BY a.author_id ASC;
--Usar COUNT para saber cuantos libros tiene cada autor sin contar los que tienen 0.
SELECT a.author_id, b.author_id, a.name, a.nationality, b.author_id, COUNT(b.author_id)
FROM authors AS a
INNER JOIN books AS b
	ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5
GROUP BY a.author_id
ORDER BY a.author_id ASC;
--Usar COUNT y GROUP BY de forma incorrecta.
SELECT a.author_id, b.author_id, a.name, a.nationality, a.author_id, COUNT(a.author_id)
FROM authors AS a
LEFT JOIN books AS b
	ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5
GROUP BY b.author_id
ORDER BY b.author_id ASC;