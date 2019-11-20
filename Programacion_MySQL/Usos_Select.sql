SELECT name, email, birthdate, gender, active FROM clients;

SELECT name, email, birthdate, gender, active FROM clients WHERE gender='M';--Listar a los hombres.

SELECT * FROM clients WHERE gender='F';--Listar a las mujeres.
--Listar todo la fecha de nacimiento.
SELECT birthdate FROM clients;
--Listar solo el año de la fecha de nacimiento.
SELECT year(birthdate), name FROM clients;
-- Obtener la fecha de hoy.
SELECT NOW();
--Obtener el año actual.
SELECT year(NOW());
--Obtener años transcurridos desde el año de nacimiento.
SELECT name, year(NOW()) - year(birthdate) as edad aproximada FROM clients;
--Encuentra las cadenas aproximadas a lo pedido % (toma sin importar lo anterior).
SELECT * FROM clients WHERE name LIKE '%rr%';
--Encuentra los nombres con 'rr' y que sean hombres.
SELECT * FROM clients WHERE name LIKE '%rr%' AND gender='M';
--Encuentra los nombres que contengan L y Z.
SELECT * FROM clients WHERE name LIKE '%L%Z%';
--Encuentra los nombres que contengan L, F ,Z y A.
SELECT * FROM clients WHERE name LIKE '%L%F%Z%A';
--Ve cuantas tuplas hay en clientes.
SELECT COUNT(*) FROM clients;