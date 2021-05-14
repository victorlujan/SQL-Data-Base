DROP TABLE administrador_tabla force ;
/
DROP TABLE Circuito_tabla force;
/
DROP TABLE Escuderia_tabla force;
/
DROP TABLE Patrocinador_tabla force;
/
DROP TABLE Mecanico_tabla force;
/
DROP TABLE Piloto_tabla force;
/
DROP TABLE Ingeniero_tabla force;
/
DROP TABLE Coche_tabla force;
/
DROP TABLE Temporada_tabla force;
/
DROP TABLE GranPremio_tabla force;
/
DROP TABLE Resultado_tabla force;
/
drop type administrador force;
/
drop type circuito force;
/
drop type coche force;
/
drop type escuderia force;
/
drop type granpremio force;
/
drop type ingeniero force;
/
drop type mecanico force;
/
drop type patrocinador force;
/
drop type patrocinador_escuderia force;
/
drop type patrocinador_escuderia_tabla force;
/
drop type persona force;
/
drop type piloto force;
/
drop type resultado force;
/
drop type resultado_temporada force;
/
drop type temporada force;
/
drop type resultado_temporada_tabla;
/
drop view Administradores ;
/
drop view Temporadas ;
/
drop view Patrocinadores ;
/
drop view GrandesPremios;
/
drop view Resultados;
/
drop view Circuitos ;
/
drop view Coches ;
/
drop view Ingenieros ;
/
drop view Pilotos ;
/
drop view Mecanicos ;
/
drop view niveles;
/ 
drop view informacioncoche;
/
drop view informacionescuderia;
/
drop view informaciongrandespremios;
/
drop procedure REGISTRARRESULTADOS;
/
drop procedure ESCUDERIAS;
/
DROP PROCEDURE MOSTRARPUNTOS;
/
DROP PROCEDURE RESULTADOSGRANPREMIO;
/
DROP FUNCTION PUNTOS;