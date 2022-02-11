create database proves;
use proves;





/*ejercicio1:
 * crea una tabla llamada Treball con los campos nombre, edat, carrec,
 * siento los campos nombre y carrec con una longitud m�xima de 20 y 50
 * respectivamente. La KP ser� el nombre.
 */

create table Treball (
	nom varchar(20) primary key, 
	edat tinyint,
	carrec varchar(50) not null
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;





/*ejercicio2:
 * crea una tabla llamada Ciutat con los campos nombre, comarca, provincia, habitantes.
 * los campos textuales tendr�n una longitud m�xima de 25 car�cteres.
 * Ninguno podr� ser nulo, excepto el nombre de habitantes y la KP ser� el nombre de la ciutat.
 */

drop table if exists Ciutat;
create table Ciutat (
	nom varchar(25) primary key,
	comarca varchar(25) not null,
	provincia varchar(25) not null,
	habitants mediumint
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;





/*ejercicio3:
 * crea una tabla llamada Client con los campos idclient, nom, cognoms, data 
 * de nacimiento y tipo. el campo idclient ser� auton�merico, los nombres-
 * apellidos ser�n �nicos, y el tipo pillar� el valor por defecto 'Habitual'.
 */

drop table if exists Client;
create table Client (
	idclient int unsigned auto_increment primary key,
	nom varchar(25) not null,
	cognoms varchar(25) not null,
	naixement date,
	tipus varchar(25) default 'Habitual',
	unique (nom, cognoms)
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;





/*ejercicio4:
 * crea una tabla Departament con los campos n�mero (num�rico de longitud2),
 * nombre(char de longitud 9) y localizaci�n (char de longitud 10)
 * como valor �nico el nombre y como KP el n�mero de departamento.
 */

drop table if exists Departament;
create table Departament(
	numero tinyint(2) unsigned primary key,
	nom varchar(9) unique not null,
	localitzacio varchar(10) not null
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;





/*ejercicio 5:
 *queremos crear una tabla con el nombre PRODUCTO donde guardaremos un c�digo
 *num�rico �nico, el nombre, la descripci�n, la categor�a y el precio
 *
 *tambi�n crearemos una tabla donde guardaremos las caracter�sticas del 
 *fabricante (tabla FABRICANT) y de cada uno pondremos un c�digo
 *de fabricante �nico, el nombre, la direcci�n web y un tel�fono de contacto
 *
 *ambas tablas est�n conectadas
 *
 *los campos en forma de texto tendr�n una longitud m�xima de 20 car�cteres
 *(excepto que veamos que se puede reducir la medida�
 **/

	/*observo que es relaci�n m productos - 1 fabricante*/
	/*por tanto la productos tendr� la KF de fabricante*/
	/*empiezo creando la tabla Fabricante que no tiene forana*/

drop table if exists Fabricant;
create table Fabricant(
	codi int unsigned auto_increment primary key,
	nom varchar(20) not null,
	web varchar(20) not null,
	telefon char(15) default ''
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;


drop table if exists Producte;
create table Producte (
	id int unsigned auto_increment primary key,
	nom varchar(20) not null,
	descripcio varchar(20) not null,
	categoria varchar(20) not null,
	preu decimal(5,2) unsigned not null,
	codi_fabricant int unsigned,
	constraint foreign key (codi_fabricant) references Fabricant(codi)
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;



	

/*ejercicio6:
 * un instituto quiere almacenar en una base de datos las asignaturas que
 * se cursan, los profesores que las imparten y los alumnos que realizan
 * cada asignatura.
 * 
 * de las asignaturas queremos guardar el c�digo de la asignatura (3letras), el nombre de la
 * asignatura, el ciclo al que pertenece y el curso al que pertenece.
 * 
 * de cada profesor queremos almacenar un c�digo num�rico de progesor, su 
 * nombre, los apellidos, la fecha de nacimiento, la direcci�n y el tel�fono.
 * 
 * de cada alumno guardaremos un c�digo num�rico �nico, el nombre, los
 * apellidos, la fecha de nacimiento, la direcci�n y su tel�fono. Tambi�n
 * queremos guardar cuando se hizo la primera matr�cula.
 * 
 * los campos en forma de texto tendr�n una longitud m�xima de 20 car�cteres.
 */

drop table if exists Alumnes;
create table Alumnes(
	codi int unsigned auto_increment primary key,
	nom varchar(20) not null,
	cognoms varchar(20) not null,
	naixement date,
	adreca varchar(20) not null,
	tel�fon char(15) default ''
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;

drop table if exists Assignatures;
create table Assignatures(
	codi char(3) primary key,
	nom varchar(20) not null,
	cicle varchar(20) not null,
	curs smallint,
	codi_alumne int unsigned,
	constraint foreign key (codi_alumne) references Alumnes(codi)
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;

drop table if exists Professors;
create table Professors(
	codi int unsigned auto_increment primary key,
	nom varchar(20) not null,
	cognoms varchar(20) not null,
	naixement date,
	adreca varchar(20) not null,
	tel�fon char(15)
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;

drop table if exists Assignatures_Professors;
create table Assignatures_Professors(
	codi_assignatures char(3) not null,
	codi_professors int unsigned,
	constraint primary key (codi_assignatures, codi_professors),
	constraint foreign key (codi_assignatures) references Assignatures(codi)
) ENGINE=InnoDB default CHARSET=utf8mb4 collate=utf8mb4_spanish_ci;