create view Administradores of administrador as (select * from administrador_tabla);

create view Temporadas of temporada as (select * from temporada_tabla);

create view Patrocinadores of patrocinador as (select * from patrocinador_tabla);

create view GrandesPremios of granpremio as (select * from granpremio_tabla);

create view Resultados of resultado as(select * from resultado_tabla);

create view Circuitos of circuito as(select * from circuito_tabla);

create view Coches of coche as(select * from coche_tabla);

create view Ingenieros of ingeniero as(select * from ingeniero_tabla);

create view Pilotos of piloto as(select * from piloto_tabla);

create view Mecanicos of mecanico as(select * from mecanico_tabla);

create or replace view niveles  AS(
select  c.nombre as nombre, level as nivel,
SYS_CONNECT_BY_PATH(nombre,'>') "RECORRIDO" from administrador_tabla c
start with c.codigoadmin = 1
connect by prior  c.codigoadmin = c.codigoadminjefe);

create or replace view informacioncoche as (select nombre,motor, peso, cilindrada,(select nombre from escuderia_tabla c where ref(c) = m.escuderia_asociada)as escuderia, 
(select nombre from piloto_tabla x where ref(x) = m.piloto_conductor) as piloto ,
(select listagg(nombre, ';') within group (order by nombre) "mecanicos"  from mecanico_tabla where escuderia_asociada =  m.escuderia_asociada   group by escuderia_asociada) as mecanicos
from coche_tabla m );

create or replace view informacionescuderia as(SELECT NOMBRE as nombreescuderia, (select count(nombre) from piloto_tabla where escuderia_asociada = ref(rr)) as pilotos,
presupuesto, (select listagg(nombre, ';') within group (order by nombre) "Pilotos"  from ingeniero_tabla where escuderia_asociada =  ref(rr)  group by escuderia_asociada) as Ingenieros,
(select nombre from coche_tabla where escuderia_asociada = ref(rr))  as modelocoche,
(select sum((select count(resc) from table(relpatresc) where deref(resc).nombre = rr.nombre)) as nombre from temporada_tabla) as numerotemporadasparticipadas
FROM escuderia_TABLA rr);

create or replace view informaciongrandespremios as(SELECT NOMBRE as nombre , DEREF(CIRCUITO_CARRERA).NOMBRE AS CIRCUITO, 
(SELECT round(AVG(DEREF(RRES).TIEMPO),2)  FROM TABLE(ER)) as mediatiempo ,
(SELECT MIN(DEREF(RRES).TIEMPO)  FROM TABLE (ER)) as menortiempo
 FROM GRANDESPREMIOS gr);

 create or replace view historialpatrocinadores as ( select año, deref(t.rpatr).nombre as nombre,  
 deref(t.rpatr).inversion as inversion, deref(t.resc).nombre as escuderia from temporada_tabla c , table(c.relpatresc) t );


CREATE OR REPLACE  VIEW PUNTOSPILOTO AS(SELECT NOMBRE "NOMBRE" , (T.RTEMP).año as "año", DEREF(DEREF(T.RRES).PILOTO_RESUL).NOMBRE AS PILOTO,
PUNTOS(DEREF(DEREF(T.RRES).PILOTO_RESUL).NOMBRE,NOMBRE,(T.RTEMP).AÑO) as "puntos"
FROM GRANPREMIO_TABLA X , TABLE(X.ER)T );