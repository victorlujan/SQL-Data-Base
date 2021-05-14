CREATE OR REPLACE TYPE Circuito AS OBJECT(
id NUMBER(5),
nombre VARCHAR2(25),
localizacion VARCHAR2(25),
numerocurvas NUMBER(2),
kilometros NUMBER(5),
numvueltas NUMBER(2)
);
/
CREATE OR REPLACE TYPE Persona AS OBJECT(
DNI  CHAR(8),
nombre VARCHAR2(20),
edad NUMBER(2))
NOT FINAL;
/
CREATE OR REPLACE TYPE Escuderia AS OBJECT(
nombre VARCHAR2(20),
presupuesto NUMBER(12),
pais VARCHAR2(20)
);
/
CREATE OR REPLACE TYPE Patrocinador AS OBJECT(
cdpatrocinador NUMBER(5),
nombre VARCHAR2(20),
inversion NUMBER(12)
);
/
CREATE OR REPLACE TYPE Mecanico UNDER Persona(
codigomec NUMBER(5),
codigomecjefe NUMBER(5),
añosexperiencia NUMBER(5),
cargo VARCHAR2(20),
escuderia_asociada REF Escuderia
);
/
CREATE OR REPLACE TYPE Ingeniero UNDER Persona(
codigoing NUMBER(5),
codigoingjefe NUMBER(5),
escuderia_asociada REF Escuderia
);
/
CREATE OR REPLACE TYPE Administrador UNDER Persona(
codigoadmin NUMBER(5),
codigoadminjefe NUMBER(5),
escuderia_asociada REF Escuderia
);
/
CREATE OR REPLACE TYPE Piloto UNDER Persona(
cdpiloto NUMBER(5),
añosexperiencia NUMBER(5),
nacionalidad VARCHAR2(20),
altura NUMBER(5),
peso NUMBER(5),
escuderia_asociada REF Escuderia
);
/
CREATE OR REPLACE TYPE Coche AS OBJECT(
cdcoche NUMBER(5),
cilindrada NUMBER(5),
peso NUMBER(5),
motor VARCHAR2(20),
nombre VARCHAR2(20),
piloto_conductor REF Piloto,
escuderia_asociada REF Escuderia
);
/
CREATE OR REPLACE TYPE Patrocinador_Escuderia AS OBJECT(
RPATR REF Patrocinador,
RESC REF Escuderia
);
/
CREATE OR REPLACE TYPE Patrocinador_Escuderia_tabla AS TABLE OF Patrocinador_Escuderia;
/
CREATE OR REPLACE TYPE Temporada AS OBJECT(
año NUMBER(5),
RELPATRESC Patrocinador_Escuderia_tabla,
ORDER MEMBER FUNCTION OrdTemporada(temp IN Temporada) RETURN NUMBER
);
/
CREATE TYPE BODY Temporada AS ORDER MEMBER FUNCTION OrdTemporada(temp IN Temporada)
    RETURN NUMBER IS
    BEGIN
        IF temp.año < SELF.año THEN
            RETURN 1;
        ELSIF temp.año > SELF.año THEN
            RETURN -1;
        ELSE
            RETURN 0;
        END IF;
    END OrdTemporada;
END;
/
CREATE OR REPLACE TYPE Resultado AS OBJECT(
id NUMBER(5),
piloto_resul REF Piloto,
escuderia_resul REF Escuderia,
tiempo NUMBER(5)
);
/
CREATE OR REPLACE TYPE Resultado_Temporada AS OBJECT(
RTEMP REF Temporada,
RRES REF Resultado
);
/
CREATE OR REPLACE TYPE Resultado_Temporada_tabla AS TABLE OF Resultado_Temporada;
/
CREATE OR REPLACE TYPE GranPremio AS OBJECT(
nombre VARCHAR2(20),
fecha DATE,
pais VARCHAR2(20),
circuito_carrera REF Circuito,
ER Resultado_Temporada_tabla
);