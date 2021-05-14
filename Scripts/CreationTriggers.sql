create or replace TRIGGER CONTROLPATROCINADORES
INSTEAD OF INSERT OR UPDATE
ON NESTED TABLE RELPATRESC OF temporadas
FOR EACH ROW
declare
c number(3);
x number(3);
BEGIN

    select(select count(rr.rpatr.nombre) from TABLE(RELPATRESC) rr where rr.rpatr = (SELECT REF(P)FROM Patrocinador_tabla P WHERE REF(P) = :new.rpatr))  into c from temporadas;
    select(select count(rr.resc.nombre) from TABLE(RELPATRESC) rr where rr.resc = (SELECT REF(P)FROM Escuderia_tabla P WHERE REF(P) = :new.resc))  into x from temporadas;
    
    if c = 0 and x = 0 then
    insert into table(select RELPATRESC FROM Temporada_tabla where año=:parent.año) VALUES((SELECT REF(P)FROM Patrocinador_tabla P WHERE REF(P) = :new.rpatr),(SELECT REF(D)FROM Escuderia_tabla D WHERE REF(D) = :new.resc));
    end if;
    
    if c>0  then
    raise_application_error(-20000,'Ya existe este patrocinador registrado en el año '||:parent.año);
    end if;
    if x>0  then
    raise_application_error(-20000,'Ya existe esta escuderia registrada en el año '||:parent.año);
    end if;
    
END;
/
CREATE OR REPLACE TRIGGER CONTROLRESULTADOS
INSTEAD OF INSERT OR UPDATE
ON NESTED TABLE ER OF grandespremios
FOR EACH ROW
DECLARE
C NUMBER (2);
BEGIN
 select(select count(rr.RRES.ID) from TABLE(ER) rr where rr.RRES = (SELECT REF(P)FROM RESULTADO_tabla P WHERE REF(P) = :new.RRES))  into c from GrandesPremios;
 
 
        IF C = 0 THEN
            insert into table(select ER FROM GRANPREMIO_tabla where NOMBRE=:parent.NOMBRE) VALUES((SELECT REF(P)FROM TEMPORADA_tabla P WHERE REF(P) = :new.rTEMP),(SELECT REF(D)FROM RESULTADO_tabla D WHERE REF(D) = :new.rRES));
        END IF;
        
        IF C>0 THEN
            raise_application_error(-20000,'LA REFERENCIA A ESE RESULTADO Y AHA SIDO INTRODUCIDA EN LA TABLA ');
        END IF;
 
END;
 /
create or replace TRIGGER Generarcodigoresultado
instead of insert or update on Resultados
declare
cd number;
begin
    
    select count(id) into cd from Resultado_tabla;
cd:= cd +1;


insert into resultado_tabla values(cd,:new.piloto_resul,:new.escuderia_resul,:new.tiempo);

end;
/
create or replace TRIGGER Generarcodigopatrocinador
instead of insert or update on Patrocinadores
for each row
declare
cd number;
begin
    
    select count(nombre) into cd from Patrocinador_tabla;
cd:= cd +1;


insert into patrocinador_tabla values(cd,:new.nombre,:new.inversion);

end;
/
create or replace TRIGGER Generarcdpiloto
instead of insert or update on Pilotos
for each row
declare
cd number;
begin
select count(nombre) into cd from Piloto_tabla;
cd:= cd + 1;

insert into piloto_tabla values(:new.dni,:new.nombre,:new.edad,cd,:new.añosexperiencia,:new.nacionalidad,:new.altura,:new.peso,:new.escuderia_asociada);

end;
/
create or replace TRIGGER Generarcodigoing
instead of insert or update on Ingenieros
for each row
declare
cd number;
begin
select count(nombre) into cd from Ingeniero_tabla;
cd:= cd + 1;

insert into ingeniero_tabla values(:new.dni,:new.nombre,:new.edad,cd,:new.codigoingjefe,:new.escuderia_asociada);

end;
/
create or replace TRIGGER Generarcdcoche
instead of insert or update on Coches
for each row
declare
cd number;
begin
select count(nombre) into cd from Coche_tabla;
cd:= cd + 1;

insert into coche_tabla values(cd,:new.cilindrada,:new.peso,:new.motor,:new.nombre,:new.piloto_conductor,:new.escuderia_asociada);

end;
/
create or replace TRIGGER Generarcodigoadministrador
instead of insert or update on Administradores
for each row
declare
cd number;
begin
select count(nombre) into cd from Administrador_tabla;
cd:= cd +1;


insert into administrador_tabla values(:new.dni,:new.nombre,:new.edad,cd,:new.codigoadminjefe,:new.escuderia_asociada);

end;
/
create or replace TRIGGER Generarid
instead of insert or update on Circuitos
for each row
declare
id number;
begin
select count(nombre) into id from Circuito_tabla;
id:= id + 1;

insert into circuito_tabla values(id,:new.nombre,:new.localizacion,:new.numerocurvas,:new.kilometros,:new.numvueltas);

end;
/
create or replace TRIGGER Generarcodigomec
instead of insert or update on Mecanicos
for each row
declare
cd number;
begin
select count(nombre) into cd from Mecanico_tabla;
cd:= cd + 1;

insert into mecanico_tabla values(:new.dni,:new.nombre,:new.edad,cd,:new.codigomecjefe,:new.añosexperiencia,:new.cargo,:new.escuderia_asociada);

end;