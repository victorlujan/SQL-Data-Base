CREATE  TABLE Circuito_tabla OF Circuito (
id PRIMARY KEY,
nombre NOT NULL,
localizacion NOT NULL,
numerocurvas NOT NULL,
kilometros NOT NULL,
numvueltas NOT NULL
);
/
CREATE  TABLE Escuderia_tabla OF Escuderia(
nombre PRIMARY KEY,
presupuesto NOT NULL,
pais NOT NULL
);
/
CREATE  TABLE Patrocinador_tabla OF Patrocinador(
cdpatrocinador PRIMARY KEY,
nombre NOT NULL,
inversion NOT NULL
);
/
CREATE  TABLE Mecanico_tabla OF Mecanico(
codigomec PRIMARY KEY,
codigomecjefe NOT NULL,
añosexperiencia NOT NULL,
cargo CHECK(cargo in('Reparaciones','PitStop-Ruedas','PitStop-Gasolina')),
escuderia_asociada SCOPE IS Escuderia_tabla
);
/
CREATE  TABLE Administrador_tabla OF Administrador(
codigoadmin PRIMARY KEY,
codigoadminjefe NOT NULL,
escuderia_asociada SCOPE IS Escuderia_tabla
);
/
CREATE  TABLE Piloto_tabla OF Piloto(
cdpiloto PRIMARY KEY,
añosexperiencia NOT NULL,
nacionalidad NOT NULL,
altura NOT NULL,
peso NOT NULL,
escuderia_asociada SCOPE IS Escuderia_tabla
);
/
CREATE  TABLE Ingeniero_tabla OF Ingeniero(
codigoing PRIMARY KEY,
codigoingjefe NOT NULL,
escuderia_asociada SCOPE IS Escuderia_tabla
);
/
CREATE  TABLE Coche_tabla OF Coche(
cdcoche PRIMARY KEY,
cilindrada NOT NULL,
peso NOT NULL,
motor NOT NULL,
nombre NOT NULL,
piloto_conductor  SCOPE IS Piloto_tabla,
escuderia_asociada SCOPE IS Escuderia_tabla
);
/
CREATE  TABLE Temporada_tabla OF Temporada(
año PRIMARY KEY
) NESTED TABLE RELPATRESC STORE AS referencia_patrocinador;
/
ALTER TABLE referencia_patrocinador ADD(SCOPE FOR(RPATR) IS Patrocinador_tabla , SCOPE FOR(RESC) IS Escuderia_tabla);
/
CREATE  TABLE GranPremio_tabla OF GranPremio(
nombre PRIMARY KEY,
fecha NOT NULL,
pais NOT NULL,
circuito_carrera SCOPE IS Circuito_tabla
) NESTED TABLE ER STORE AS referencia_temporada_resultado;
/
CREATE TABLE Resultado_tabla OF Resultado(
id PRIMARY KEY,
piloto_resul  SCOPE IS Piloto_tabla,
escuderia_resul SCOPE IS Escuderia_tabla,
tiempo NOT NULL
);
/
ALTER TABLE referencia_temporada_resultado ADD(SCOPE FOR(RTEMP) IS Temporada_tabla , SCOPE FOR(RRES) IS Resultado_tabla);