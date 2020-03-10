CREATE DATABASE miBase
USE miBase

IF not exists (SELECT * FROM sysobjects WHERE name='cars' and xtype='U')
    CREATE TABLE cars (
        Name varchar(64) not null
    )

IF exists (SELECT * FROM sysobjects WHERE name='miTabla' and xtype='U')
BEGIN
	DROP TABLE miTabla
END
CREATE TABLE miTabla(
	id_usuario int identity primary key,
	nombre_usuario varchar(20),
	password varchar(15),
)

