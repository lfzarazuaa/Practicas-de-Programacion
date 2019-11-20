--Función rand para números aleatorios (no optima pero funcional).
SELECT *,RAND() AS ALEATORIO FROM authors ORDER BY ALEATORIO LIMIT 10;
--DELETE aconsejable usar un limit 1 para no llevarse más datos.
DELETE FROM authors WHERE author_id = 161 LIMIT 1;
--Ver usuarios inactivos
SELECT * FROM clients WHERE active <> 1;
--UPDATE
UPDATE clients
SET
	active=0
WHERE client_id IN (80,65,76,1,61,7,19)
LIMIT 10;
--
UPDATE clients
SET
	active=1
WHERE client_id IN (80,65,76,1,61,7,19)
LIMIT 10;
--Sempre usar el where.
UPDATE clients
SET
	active=0,email='javier@gmail.com'
WHERE client_id IN (7)
LIMIT 10;
--
UPDATE clients
SET
	active=0
WHERE client_id IN (80,65,76,1,61,7,19)
	OR name LIKE '%LOP%'
LIMIT 10;
--Truncate para vaciar la tabla.
TRUNCATE transactions;