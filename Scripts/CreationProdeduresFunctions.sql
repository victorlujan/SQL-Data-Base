create or replace procedure REGISTRARRESULTADOS(añotemporada in number,
granpremio in varchar2, pilotonombre in  varchar2, nombreescuderia in  varchar2, tiempo in number)
is
piloto number;
añonum number;
escuderia number;
gran_premio number;
idcuenta number;
begin
	
    select count(nombre) into piloto from piloto_tabla where nombre=pilotonombre;
    select count(año) into añonum from temporada_tabla where año=añotemporada;
    select count(nombre) into escuderia from escuderia_tabla where nombre=nombreescuderia;
    select count(nombre) into gran_premio from granpremio_tabla where nombre=granpremio;

	
    IF piloto=0 THEN
            raise_application_error(-20000,'Error al introducir piloto compruebe que  ' || pilotonombre || ' existe');
    END IF;

    IF añonum=0 THEN
            raise_application_error(-20000,'Error al introducir año compruebe que  ' || añotemporada || ' existe');
    END IF;

    IF escuderia=0 THEN
            raise_application_error(-20000,'Error al introducir escuderia compruebe que  ' || nombreescuderia || ' existe');
    END IF;

    IF gran_premio=0 THEN
            raise_application_error(-20000,'Error al introducir Gran Premio compruebe que  ' || granpremio || ' existe');
    END IF;

    
        
        
   insert into resultados values(null,(SELECT REF(D)FROM Piloto_tabla D WHERE nombre=pilotonombre),(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre=nombreescuderia),tiempo);
   select count(id) into idcuenta from resultados;
   INSERT INTO TABLE (SELECT ER FROM GRANPREMIO_TABLA WHERE NOMBRE = granpremio) VALUES((SELECT REF(D)FROM TEMPORADA_tabla D WHERE AÑO=añotemporada),(SELECT REF(P)FROM resultado_tabla P WHERE id=idcuenta));
   DBMS_OUTPUT.PUT_LINE('Se han introducidos los datos correctamente');
    



end;
/
CREATE OR REPLACE PROCEDURE ESCUDERIAS (ND IN ESCUDERIA_TABLA.NOMBRE%TYPE)
IS
       TYPE PILOTO_TAB IS TABLE OF REF PILOTO;
       TPILOTO PILOTO_TAB;
       VDNI  PILOTO_TABLA.DNI%TYPE;
       VNOMBRE PILOTO_TABLA.NOMBRE%TYPE;
       NOMBREGRANPREMIO VARCHAR(60);
       IDNUM NUMBER(10);
       TEMPORADA NUMBER(10);
BEGIN
         IF ND IS NULL THEN
              DBMS_OUTPUT.PUT_LINE('NOMBRE DE ESCUDERIA  NULO');
         END IF;


         SELECT REF(P) BULK COLLECT INTO TPILOTO FROM PILOTO_TABLA P WHERE ESCUDERIA_ASOCIADA = (SELECT REF(D) FROM ESCUDERIA_TABLA D WHERE NOMBRE = ND);


         FOR I IN 1..TPILOTO.COUNT LOOP
                SELECT DEREF(TPILOTO(I)).DNI, DEREF(TPILOTO(I)).NOMBRE INTO VDNI,VNOMBRE FROM DUAL;
                DBMS_OUTPUT.PUT_LINE('========================================================');
                DBMS_OUTPUT.PUT_LINE('PILOTO: ' || VDNI ||'  -  '|| VNOMBRE);
                DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------');
                
                FOR VRESUL IN (SELECT * FROM RESULTADO_TABLA WHERE PILOTO_RESUL = TPILOTO(I)) LOOP
               select t.nombre, deref(nt.rres).id, deref(nt.rtemp).año into NOMBREGRANPREMIO  ,idnum ,temporada from grandespremios t , table(t.er) nt where deref(nt.rres).id = vresul.id;
                     
                     DBMS_OUTPUT.PUT_LINE( 'Resultado ID ' || VRESUL.ID || ' - '|| NOMBREGRANPREMIO  ||'  // TIEMPO: '|| VRESUL.TIEMPO ||' MIN' || ' // TEMPORADA:' || temporada);
                END LOOP;

         END LOOP;
END;
/
CREATE OR REPLACE PROCEDURE RESULTADOSGRANPREMIO (ND IN GRANPREMIO_TABLA.NOMBRE%TYPE, AÑOTEMPORADA IN NUMBER)
IS
       TYPE RESULTADO_TAB IS TABLE OF REF RESULTADO;
       TRESULTADO RESULTADO_TAB;
       TYPE TEMPORADA_TAB IS TABLE OF REF TEMPORADA;
       TTEMPORADA TEMPORADA_TAB;
       TYPE GRANPREMIO_TAB IS TABLE OF REF GRANPREMIO;
       TGRANPREMIO GRANPREMIO_TAB;
       
       NOMBREGRANPREMIO VARCHAR(60);
       POSICIONUM NUMBER(10);
       TIEMPO NUMBER(3);
       IDRESUL NUMBER(3);
       NOMBREPILOTO VARCHAR(30);
       NOMBREESCUDERIA VARCHAR(30);
       AÑO NUMBER(4);
BEGIN
        POSICIONUM:= 1;
        
        
         IF ND IS NULL AND AÑOTEMPORADA IS NULL THEN
                  raise_application_error(-20000,'NO HAS INTRODUCIDO EL NOMBRE DE UN GRAN PREMIO ');
         END IF;
         
         
         
         IF AÑOTEMPORADA IS NOT NULL AND ND IS NOT NULL THEN
         
                SELECT REF(P) BULK COLLECT INTO TRESULTADO FROM RESULTADO_TABLA P, GRANPREMIO_TABLA G, TABLE(G.ER) ER WHERE DEREF(ER.RRES).ID  = P.ID and G.NOMBRE = ND AND DEREF(ER.RTEMP).AÑO = AÑOTEMPORADA ORDER BY DEREF(ER.RRES).TIEMPO;

                DBMS_OUTPUT.PUT_LINE('===================== RESULTADOS:   '||ND||'  TEMPORADA : '||AÑOTEMPORADA||'  ======================');
    
    
                FOR I IN 1..TRESULTADO.COUNT LOOP
                    SELECT DEREF(TRESULTADO(I)).TIEMPO, DEREF(TRESULTADO(I)).ID INTO TIEMPO ,IDRESUL FROM DUAL;
                    SELECT DEREF(PILOTO_RESUL).NOMBRE, DEREF(ESCUDERIA_RESUL).NOMBRE INTO NOMBREPILOTO, NOMBREESCUDERIA FROM RESULTADO_TABLA F WHERE F.ID = IDRESUL;
                    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');
                    DBMS_OUTPUT.PUT_LINE('POSICION: ' || POSICIONUM ||' // PILOTO: '|| NOMBREPILOTO || '// NOMBRE ESCUDERIA:  ' || NOMBREESCUDERIA|| '// TIEMPO: '|| TIEMPO );
                    POSICIONUM:= POSICIONUM +1;

                END LOOP;
            
         
         END IF;
         
         
         IF AÑOTEMPORADA IS NULL AND ND IS NOT NULL THEN
         
                DBMS_OUTPUT.PUT_LINE('                                                       ');
                DBMS_OUTPUT.PUT_LINE('===================== RESULTADOS :  '||ND||'  ======================');
                
            SELECT REF (P) BULK COLLECT INTO TTEMPORADA FROM TEMPORADA_TABLA P;
            
            FOR I IN 1..TTEMPORADA.COUNT LOOP
            
                SELECT DEREF(TTEMPORADA(I)).AÑO INTO AÑO FROM DUAL;
                DBMS_OUTPUT.PUT_LINE('===================== TEMPORADA: '||AÑO||' ======================');
                SELECT REF(P) BULK COLLECT INTO TRESULTADO FROM RESULTADO_TABLA P, GRANPREMIO_TABLA G, TABLE(G.ER) ER WHERE DEREF(ER.RRES).ID  = P.ID and G.NOMBRE = ND AND DEREF(ER.RTEMP).AÑO = AÑO ORDER BY DEREF(ER.RRES).TIEMPO;
                IF TRESULTADO.COUNT = 0 THEN
                    DBMS_OUTPUT.PUT_LINE('NO HAY REGESTROS EN : '||ND||''); 
                END IF;
                
                FOR I IN 1..TRESULTADO.COUNT LOOP

                    SELECT DEREF(TRESULTADO(I)).TIEMPO, DEREF(TRESULTADO(I)).ID INTO TIEMPO ,IDRESUL FROM DUAL;
                    SELECT DEREF(PILOTO_RESUL).NOMBRE, DEREF(ESCUDERIA_RESUL).NOMBRE INTO NOMBREPILOTO, NOMBREESCUDERIA FROM RESULTADO_TABLA F WHERE F.ID = IDRESUL;
                    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------');
                    DBMS_OUTPUT.PUT_LINE('POSICION: ' || POSICIONUM ||' // PILOTO: '|| NOMBREPILOTO || '// NOMBRE ESCUDERIA:  ' || NOMBREESCUDERIA|| '// TIEMPO: '|| TIEMPO );
                    POSICIONUM:= POSICIONUM +1;

                END LOOP;
                
            END LOOP;
                
         END IF;
         
         
         IF AÑOTEMPORADA IS NOT NULL AND ND IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('===================== TEMPORADA: '||AÑOTEMPORADA||' ======================');
            DBMS_OUTPUT.PUT_LINE('');
            SELECT REF (P) BULK COLLECT INTO TGRANPREMIO FROM GRANPREMIO_TABLA P;
            
            FOR I IN 1..TGRANPREMIO.COUNT LOOP
                SELECT DEREF(TGRANPREMIO(I)).NOMBRE INTO NOMBREGRANPREMIO FROM DUAL;
                DBMS_OUTPUT.PUT_LINE('===================== GRANPREMIO: '||NOMBREGRANPREMIO||' ======================');               
                SELECT REF(P) BULK COLLECT INTO TRESULTADO FROM RESULTADO_TABLA P, GRANPREMIO_TABLA G, TABLE(G.ER) ER WHERE DEREF(ER.RRES).ID  = P.ID and G.NOMBRE = NOMBREGRANPREMIO AND DEREF(ER.RTEMP).AÑO = AÑOTEMPORADA ORDER BY DEREF(ER.RRES).TIEMPO;
                IF TRESULTADO.COUNT = 0 THEN
                DBMS_OUTPUT.PUT_LINE('NO HAY REGESTROS EN : '||NOMBREGRANPREMIO||''); 
                END IF;
                FOR I IN 1..TRESULTADO.COUNT LOOP
                    SELECT DEREF(TRESULTADO(I)).TIEMPO, DEREF(TRESULTADO(I)).ID INTO TIEMPO ,IDRESUL FROM DUAL;
                    SELECT DEREF(PILOTO_RESUL).NOMBRE, DEREF(ESCUDERIA_RESUL).NOMBRE INTO NOMBREPILOTO, NOMBREESCUDERIA FROM RESULTADO_TABLA F WHERE F.ID = IDRESUL;
                    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------');
                    DBMS_OUTPUT.PUT_LINE('POSICION: ' || POSICIONUM ||' // PILOTO: '|| NOMBREPILOTO || '// NOMBRE ESCUDERIA:  ' || NOMBREESCUDERIA|| '// TIEMPO: '|| TIEMPO );
                    POSICIONUM:= POSICIONUM +1;

                END LOOP;            
                DBMS_OUTPUT.PUT_LINE('<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
                DBMS_OUTPUT.PUT_LINE('');
                DBMS_OUTPUT.PUT_LINE('');
            END LOOP;
            
         END IF;         
END;
/
create or replace FUNCTION PUNTOS (NOMBREPILOTO IN PILOTO_TABLA.NOMBRE%TYPE, GRANPREMIO IN GRANPREMIO_TABLA.NOMBRE%TYPE, TEMPORADA IN TEMPORADA_TABLA.AÑO%TYPE )
RETURN VARCHAR2
IS
       TYPE RESUL_TAB IS TABLE OF REF RESULTADO;
       TRESULTADO  RESUL_TAB;
	   PUNTOS NUMBER(4);
	   PILOTONOMBRE VARCHAR2(30);
	   POSICIONUM NUMBER(3);
       IDRESUL NUMBER(3);

BEGIN
		        SELECT REF(P) BULK COLLECT INTO TRESULTADO FROM RESULTADO_TABLA P, GRANPREMIO_TABLA G, TABLE(G.ER) ER WHERE DEREF(ER.RRES).ID  = P.ID and G.NOMBRE = GRANPREMIO AND DEREF(ER.RTEMP).AÑO = TEMPORADA ORDER BY DEREF(ER.RRES).TIEMPO;
                POSICIONUM:=1;
                PUNTOS :=0;
                FOR I IN 1..TRESULTADO.COUNT LOOP
                
                    SELECT  DEREF(TRESULTADO(I)).ID INTO IDRESUL FROM DUAL;
                    SELECT DEREF(PILOTO_RESUL).NOMBRE INTO PILOTONOMBRE FROM RESULTADO_TABLA F WHERE F.ID = IDRESUL;                    
                    
					IF PILOTONOMBRE = NOMBREPILOTO THEN
                    
						IF POSICIONUM = 1 THEN
							PUNTOS:= 25;
                            
						ELSIF POSICIONUM = 2 THEN
							PUNTOS:= 18;

						ELSIF POSICIONUM = 3 THEN
							PUNTOS:= 15;

						ELSIF POSICIONUM = 4 THEN
							PUNTOS:= 12;

						ELSIF POSICIONUM = 5 THEN
							PUNTOS:= 10;

						ELSIF POSICIONUM = 6 THEN
							PUNTOS:= 8;

						ELSIF POSICIONUM = 7 THEN
							PUNTOS:= 8;

						ELSIF POSICIONUM = 8 THEN
							PUNTOS:= 4;

						ELSIF POSICIONUM = 9 THEN
							PUNTOS:= 2;
						END IF;
                       

					END IF;
                    POSICIONUM:= POSICIONUM +1;

                END LOOP;
                
                RETURN PUNTOS;
END;
/
create or replace PROCEDURE MOSTRARPUNTOS (NOMBREPILOTO IN PILOTO_TABLA.NOMBRE%TYPE, GRANPREMIONOMBRE IN GRANPREMIO_TABLA.NOMBRE%TYPE, AÑOTEMPORADA IN TEMPORADA_TABLA.AÑO%TYPE)

IS
       TYPE TEMPORADA_TAB IS TABLE OF REF TEMPORADA;
       TTEMPORADA TEMPORADA_TAB;
       TYPE PILOTO_TAB IS TABLE OF REF PILOTO;
       TPILOTO  PILOTO_TAB;
        TYPE RESULTADO_TAB IS TABLE OF REF RESULTADO;
       TRESULTADO RESULTADO_TAB;
       TYPE GRANPREMIO_TAB IS TABLE OF REF GRANPREMIO;
       TGRANPREMIO GRANPREMIO_TAB;




	   PUNTOSS NUMBER(4);
       PUNTOSTOTALES NUMBER(4);
	   PILOTONOMBRE VARCHAR2(30);
	   POSICIONUM NUMBER(3);
       IDRESUL NUMBER(3);
       NOMBREGRANPREMIO VARCHAR(30);
       AÑO NUMBER(10);

BEGIN
    PUNTOSTOTALES:=0;
	PUNTOSS:=0;
    IF NOMBREPILOTO IS NULL AND GRANPREMIONOMBRE IS NULL AND AÑOTEMPORADA IS NULL THEN
        raise_application_error(-20000,'NO HAS INTRODUCIDO NINGUN DATO ');
    END IF;

    IF NOMBREPILOTO IS NOT NULL AND GRANPREMIONOMBRE IS  NULL AND AÑOTEMPORADA IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('---------------- TEMPORADA: '||AÑOTEMPORADA||'-----------------');
        DBMS_OUTPUT.PUT_LINE('---------------- PILOTO: '||NOMBREPILOTO||'-----------------');
        SELECT REF (P) BULK COLLECT INTO TGRANPREMIO FROM GRANPREMIO_TABLA P;
        FOR I IN 1..TGRANPREMIO.COUNT LOOP
            SELECT DEREF(TGRANPREMIO(I)).NOMBRE INTO NOMBREGRANPREMIO FROM DUAL;
            SELECT PUNTOS(NOMBREPILOTO,NOMBREGRANPREMIO,AÑOTEMPORADA) INTO PUNTOSS FROM DUAL;
            DBMS_OUTPUT.PUT_LINE('---------------- GRAN PREMIO: '||NOMBREGRANPREMIO||' PUNTOS: '||PUNTOSS);

        END LOOP;



    ELSIF NOMBREPILOTO IS NOT NULL AND GRANPREMIONOMBRE IS NOT NULL AND AÑOTEMPORADA IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('---------------- GRANPREMIO: '||GRANPREMIONOMBRE||'-----------------');
        DBMS_OUTPUT.PUT_LINE('---------------- NOMBRE PILOTO: '||NOMBREPILOTO||'-----------------');
        SELECT REF (P) BULK COLLECT INTO TTEMPORADA FROM TEMPORADA_TABLA P;
        FOR I IN 1..TTEMPORADA.COUNT LOOP
            SELECT DEREF(TTEMPORADA(I)).AÑO INTO AÑO FROM DUAL;
            SELECT PUNTOS(NOMBREPILOTO,GRANPREMIONOMBRE, AÑO) INTO PUNTOSS FROM DUAL;
            DBMS_OUTPUT.PUT_LINE('---------------- TEMPORADA: '||AÑO|| ' PUNTOS:  '||PUNTOSS);
        END LOOP;



    ELSIF NOMBREPILOTO IS NOT NULL AND GRANPREMIONOMBRE IS NOT NULL AND AÑOTEMPORADA IS NOT NULL THEN
        SELECT PUNTOS(NOMBREPILOTO,GRANPREMIONOMBRE,AÑOTEMPORADA) INTO PUNTOSS FROM DUAL;
        DBMS_OUTPUT.PUT_LINE('---------------- TEMPORADA: '||AÑOTEMPORADA);
        DBMS_OUTPUT.PUT_LINE('---------------- GRAN PRMIO: '||GRANPREMIONOMBRE);
        DBMS_OUTPUT.PUT_LINE('---------------- PILOTO: '||NOMBREPILOTO);
        DBMS_OUTPUT.PUT_LINE('---------------- PUNTOS: '||PUNTOSS);


	ELSE
		raise_application_error(-20000,'DATOS MAL INTRODUCIDOS');

    END IF; 



END;