DESC authors;
--Alter para agregar columna.
ALTER TABLE authors ADD COLUMN birthyear INTEGER FIRST;
ALTER TABLE authors ADD COLUMN birthyear INTEGER DEFAULT 1930 AFTER `name`;
--Alter para modificar columnas
ALTER TABLE authors MODIFY COLUMN birthyear YEAR DEFAULT 1920;
--Alter para eliminar columnas
ALTER TABLE authors DROP COLUMN birthyear;
--
SHOW TABLES LIKE '%i%';

