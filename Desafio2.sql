Create Database desafio2_Cristopher_Vargas_315;

CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente
VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );


select * from inscritos;

--¿Cuántos registros hay?
select count(*) as registros from inscritos;

--¿Cuántos inscritos hay en total?
select sum(cantidad) as Cantidad_inscritos from inscritos;

--¿Cuál o cuáles son los registros de mayor antigüedad?
select * from inscritos 
where fecha = (select fecha from inscritos order by fecha asc limit 1);

--¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)
select fecha, sum(cantidad) from inscritos group by fecha order by fecha;

--¿Cuántos inscritos hay por fuente?
select fuente, sum(cantidad) as cantidad_inscritos from inscritos group by fuente;

--¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?
select fecha, cantidad from inscritos order by cantidad desc limit 1;

--¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron?
select fecha, cantidad from inscritos where fuente = 'Blog' order by fecha desc limit 1;

--¿Cuántas personas en promedio se inscriben en un día?
select fecha, round(avg(cantidad),2) as inscritos from inscritos group by fecha order by fecha asc;

--¿Qué días se inscribieron más de 50 personas?
select fecha, cantidad from inscritos where cantidad > 50

--¿Cuántas personas se registraron en promedio cada día a partir del tercer día?
select fecha, round(avg(cantidad),2) as inscritos
from inscritos where fecha > '2021-03-01' 
group by fecha order by fecha asc;