INSERT INTO Circuitos VALUES(null,'Maranello','Italia',15,13,50);
INSERT INTO Circuitos VALUES(null,'Barcelona','España',13,13,65);
INSERT INTO Circuitos VALUES(null,'Silverstone','Reino Unido',8,11,52);
INSERT INTO Circuitos VALUES(null,'Sochi','Rusia',9,19,53);
INSERT INTO Circuitos VALUES(null,'Algarve','Portugal',10,10,64);
INSERT INTO Circuitos VALUES(null,'Baréin','Qatar',7,17,58);
INSERT INTO Circuitos VALUES(null,'Monaco Street Race','Monaco',7,17,58);
INSERT INTO Circuitos VALUES(null,'Interlagos','Brasil',7,17,58);
INSERT INTO Circuitos VALUES(null,'Monza','Italia',7,17,58);
INSERT INTO Circuitos VALUES(null,'Yas Marina','Emiratos Arabes Unidos',8,15,60);
INSERT INTO Circuitos VALUES(null,'Imola','Italia',8,12,60);
INSERT INTO Circuitos VALUES(null,'SUZUKA','Japon',6,13,52);

INSERT INTO Escuderia_tabla VALUES('Mercedes-Benz',325997000,'Alemania');
INSERT INTO Escuderia_tabla VALUES('Ferrari',393426000,'Italia');
INSERT INTO Escuderia_tabla VALUES('Alpine',168591000,'Francia');
INSERT INTO Escuderia_tabla VALUES('Red Bull Racing',241681000,'Reino Unido');
INSERT INTO Escuderia_tabla VALUES('McLaren',196705000,'Reino Unido');
INSERT INTO Escuderia_tabla VALUES('Williams',296705000,'Reino Unido');
INSERT INTO Escuderia_tabla VALUES('Racing Point',125705000,'Reino Unido');
INSERT INTO Escuderia_tabla VALUES('Aston Martin',125705000,'Reino Unido');

INSERT INTO Patrocinadores VALUES(null,'Pirelli',5000000);
INSERT INTO Patrocinadores VALUES(null,'SAP',4000000);
INSERT INTO Patrocinadores VALUES(null,'Hubort',30000000);
INSERT INTO Patrocinadores VALUES(null,'Microsoft',40000000);
INSERT INTO Patrocinadores VALUES(null,'Michelin',50000000);
INSERT INTO Patrocinadores VALUES(null,'UPS',12000000);
INSERT INTO Patrocinadores VALUES(null,'Mapfre',50000000);
INSERT INTO Patrocinadores VALUES(null,'UBS',25000000);

INSERT INTO Mecanicos VALUES(111111,'Paco',35,null,1,5,'Reparaciones',(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Ferrari'));
INSERT INTO Mecanicos VALUES(222222,'Luis',38,null,2,8,'Reparaciones',(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Ferrari'));
INSERT INTO Mecanicos VALUES(333333,'Antonio',25,null,1,2,'Reparaciones',(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Ferrari'));
INSERT INTO Mecanicos VALUES(444444,'Jesus',24,null,2,1,'Reparaciones',(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Ferrari'));
INSERT INTO Mecanicos VALUES(444445,'Fernando',24,null,1,1,'PitStop-Ruedas',(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Ferrari'));
INSERT INTO Mecanicos VALUES(444446,'Lucas',24,null,1,1,'PitStop-Gasolina',(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Ferrari'));
INSERT INTO Mecanicos VALUES(555555,'Alejandro',35,null,5,5,'Reparaciones',(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Alpine'));
INSERT INTO Mecanicos VALUES(666666,'Luis',38,null,6,8,'Reparaciones',(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Alpine'));
INSERT INTO Mecanicos VALUES(777777,'Antonio',25,null,1,2,'Reparaciones',(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Alpine'));
INSERT INTO Mecanicos VALUES(888888,'Jesus',24,null,6,1,'Reparaciones',(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Alpine'));

INSERT INTO Administradores VALUES(999999,'Ana',40,null,0,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Ferrari'));
INSERT INTO Administradores VALUES(111112,'Alberto',52,null,0,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Ferrari'));
INSERT INTO Administradores VALUES(111113,'Pascual',30,null,1,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Ferrari'));
INSERT INTO Administradores VALUES(714113,'Jesus',30,null,3,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Ferrari'));
INSERT INTO Administradores VALUES(031153,'Carlos',30,null,3,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Ferrari'));
INSERT INTO Administradores VALUES(121113,'Marta',25,null,4,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Alpine'));
INSERT INTO Administradores VALUES(121413,'Oscar',20,null,4,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Alpine'));
INSERT INTO Administradores VALUES(121133,'Carlos',25,null,4,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Alpine'));
INSERT INTO Administradores VALUES(521113,'Andrea',24,null,8,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Mercedes-Benz'));
INSERT INTO Administradores VALUES(521513,'Alejandro',30,null,8,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Mercedes-Benz'));
INSERT INTO Administradores VALUES(521393,'Roberto',31,null,8,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Mercedes-Benz'));
INSERT INTO Administradores VALUES(521973,'Fernando',35,null,9,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Aston Martin'));
INSERT INTO Administradores VALUES(521913,'Fernando',34,null,9,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Aston Martin'));
INSERT INTO Administradores VALUES(521713,'Armando',30,null,9,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Aston Martin'));


INSERT INTO Pilotos VALUES(111114,'Lewis Hamilton',35,null,10,'Britanico',176,75,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Mercedes-Benz'));
INSERT INTO Pilotos VALUES(113114,'Valtteri Bottas',35,null,10,'Finlandes',176,75,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Mercedes-Benz'));
INSERT INTO Pilotos VALUES(111115,'Fernando Alonso',39,null,13,'Español',176,79,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Alpine'));
INSERT INTO Pilotos VALUES(111116,'Max Verstapen',37,null,7,'Holandes',170,75,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Red Bull Racing'));
INSERT INTO Pilotos VALUES(111125,'Sebastian Vettel',34,null,10,'Aleman',168,76,(SELECT REF(P) FROM Escuderia_tabla P WHERE nombre='Aston Martin'));
INSERT INTO Pilotos VALUES(011125,'Carlos Sainz',24,null,4,'Español',173,72,(SELECT REF(P) FROM Escuderia_tabla P WHERE nombre='Ferrari'));
INSERT INTO Pilotos VALUES(102545,'Lando Norris',23,null,3,'Britanico',174,68,(SELECT REF(P) FROM Escuderia_tabla P WHERE nombre='McLaren'));
INSERT INTO Pilotos VALUES(172545,'Esteban Ocon',27,null,3,'Frances',174,68,(SELECT REF(P) FROM Escuderia_tabla P WHERE nombre='Alpine'));
INSERT INTO Pilotos VALUES(198545,'George Russell',28,null,3,'Britanico',174,68,(SELECT REF(P) FROM Escuderia_tabla P WHERE nombre='Williams'));
INSERT INTO Pilotos VALUES(198745,'Esteban Ocon',28,null,3,'Britanico',174,68,(SELECT REF(P) FROM Escuderia_tabla P WHERE nombre='Alpine'));
INSERT INTO Pilotos VALUES(012125,'Charles Leclerc',24,null,4,'Monaco',173,72,(SELECT REF(P) FROM Escuderia_tabla P WHERE nombre='Ferrari'));

INSERT INTO Ingenieros VALUES(111117,'Ana',40,null,0,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Ferrari'));
INSERT INTO Ingenieros VALUES(111118,'Fernando',52,null,0,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Ferrari'));
INSERT INTO Ingenieros VALUES(111119,'Oscar',30,null,1,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Ferrari'));
INSERT INTO Ingenieros VALUES(111100,'Carlos',30,null,4,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Alpine'));
INSERT INTO Ingenieros VALUES(111100,'Jesus',30,null,0,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Alpine'));
INSERT INTO Ingenieros VALUES(111100,'Maria',30,null,5,(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Alpine'));

INSERT INTO Coches VALUES(null,1000,2000,'Mercedes','MP-20',(SELECT REF(D)FROM Piloto_tabla D WHERE nombre='Lewis Hamilton'),(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Mercedes-Benz'));
INSERT INTO Coches VALUES(null,1000,2000,'Renault','R-21',(SELECT REF(D)FROM Piloto_tabla D WHERE nombre='Fernando Alonso'),(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Alpine'));
INSERT INTO Coches VALUES(null,1000,2000,'Mercedes','GTD-45',(SELECT REF(D)FROM Piloto_tabla D WHERE nombre='Max Verstapen'),(SELECT REF(P)FROM Escuderia_tabla P WHERE nombre='Red Bull Racing'));
INSERT INTO Coches VALUES(null,1000,2000,'Ferrari','CD-45',(SELECT REF(D)FROM Piloto_tabla D WHERE nombre='Carlos Sainz'),(SELECT REF(P) FROM Escuderia_tabla P WHERE nombre='Ferrari'));

INSERT INTO Temporada_tabla VALUES(2020, Patrocinador_Escuderia_tabla());
INSERT INTO Temporada_tabla VALUES(2019, Patrocinador_Escuderia_tabla());
insert into table(select RELPATRESC FROM Temporada_tabla where año=2020) VALUES((SELECT REF(P)FROM Patrocinador_tabla P WHERE nombre='SAP'),(SELECT REF(D)FROM Escuderia_tabla D WHERE nombre='Ferrari'));
insert into table(select RELPATRESC FROM Temporada_tabla where año=2020) VALUES((SELECT REF(P)FROM Patrocinador_tabla P WHERE nombre='Pirelli'),(SELECT REF(D)FROM Escuderia_tabla D WHERE nombre='Alpine'));
insert into table(select RELPATRESC FROM Temporada_tabla where año=2020) VALUES((SELECT REF(P)FROM Patrocinador_tabla P WHERE nombre='UPS'),(SELECT REF(D)FROM Escuderia_tabla D WHERE nombre='Mercedes-Benz'));
insert into table(select RELPATRESC FROM Temporada_tabla where año=2020) VALUES((SELECT REF(P)FROM Patrocinador_tabla P WHERE nombre='Michelin'),(SELECT REF(D)FROM Escuderia_tabla D WHERE nombre='Aston Martin'));
insert into table(select RELPATRESC FROM Temporada_tabla where año=2020) VALUES((SELECT REF(P)FROM Patrocinador_tabla P WHERE nombre='UBS'),(SELECT REF(D)FROM Escuderia_tabla D WHERE nombre='Williams'));
insert into table(select RELPATRESC FROM Temporada_tabla where año=2020) VALUES((SELECT REF(P)FROM Patrocinador_tabla P WHERE nombre='Microsoft'),(SELECT REF(D)FROM Escuderia_tabla D WHERE nombre='Racing Point'));

insert into granpremio_tabla values('Gran Premio de España','12/02/2021','España',(SELECT REF(P)FROM Circuito_tabla P WHERE nombre='Barcelona'),Resultado_Temporada_tabla());
insert into granpremio_tabla values('Monza','12/02/2021','Italia',(SELECT REF(P)FROM Circuito_tabla P WHERE nombre='Monza'),Resultado_Temporada_tabla());
insert into granpremio_tabla values('Silverstone','12/02/2021','Reino Unido',(SELECT REF(P)FROM Circuito_tabla P WHERE nombre='Silverstone'),Resultado_Temporada_tabla());
insert into granpremio_tabla values('Gran Prmio de Japon','12/02/2021','Japon',(SELECT REF(P)FROM Circuito_tabla P WHERE nombre='SUZUKA'),Resultado_Temporada_tabla());
insert into granpremio_tabla values('Gran Premio de Portugal','12/02/2021','Portugal',(SELECT REF(P)FROM Circuito_tabla P WHERE nombre='Algarve'),Resultado_Temporada_tabla());
/
begin
REGISTRARRESULTADOS(2019,'Gran Premio de España', 'Lewis Hamilton','Mercedes-Benz',120);
REGISTRARRESULTADOS(2019,'Monza', 'Lewis Hamilton','Mercedes-Benz',60);
REGISTRARRESULTADOS(2019,'Gran Prmio de Japon', 'Lewis Hamilton','Mercedes-Benz',60);
REGISTRARRESULTADOS(2019,'Gran Premio de Portugal', 'Lewis Hamilton','Mercedes-Benz',80);
REGISTRARRESULTADOS(2019,'Gran Premio de España', 'Valtteri Bottas','Mercedes-Benz',80);
REGISTRARRESULTADOS(2019,'Monza', 'Valtteri Bottas','Mercedes-Benz',90);
REGISTRARRESULTADOS(2019,'Gran Prmio de Japon', 'Valtteri Bottas','Mercedes-Benz',50);
REGISTRARRESULTADOS(2019,'Gran Premio de Portugal', 'Valtteri Bottas','Mercedes-Benz',120);

REGISTRARRESULTADOS(2020,'Gran Premio de España', 'Lewis Hamilton','Mercedes-Benz',120);
REGISTRARRESULTADOS(2020,'Monza', 'Lewis Hamilton','Mercedes-Benz',60);
REGISTRARRESULTADOS(2020,'Gran Prmio de Japon', 'Lewis Hamilton','Mercedes-Benz',60);
REGISTRARRESULTADOS(2020,'Gran Premio de Portugal', 'Lewis Hamilton','Mercedes-Benz',80);
REGISTRARRESULTADOS(2020,'Gran Premio de España', 'Valtteri Bottas','Mercedes-Benz',80);
REGISTRARRESULTADOS(2020,'Monza', 'Valtteri Bottas','Mercedes-Benz',90);
REGISTRARRESULTADOS(2020,'Gran Prmio de Japon', 'Valtteri Bottas','Mercedes-Benz',50);
REGISTRARRESULTADOS(2020,'Gran Premio de Portugal', 'Valtteri Bottas','Mercedes-Benz',120);
end;
