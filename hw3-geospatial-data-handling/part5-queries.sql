CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;

CREATE TABLE PLACES
(
    name varchar,
    geom geometry
);

INSERT INTO PLACES VALUES
	('Home: 2700 Ellendale','POINT(-118.288115 34.030373)'),
	('Entry 1: Downey Way Entrance', 'POINT(-118.2913187256734 34.02204241502157)'),
	('Entry 2: McCarthy Way Entrance', 'POINT(-118.281118067135 34.02059937323951)'),
	('Entry 3: McClintock Avenue Entrance', 'POINT(-118.2871799602144 34.02507329808584)'),
	('Library 1: Leavey Library', 'POINT(-118.28306 34.021646)'),
	('Library 2: Doheny Library', 'POINT(-118.284014 34.020278)'),
	('Library 3: Science and Engineering Library', 'POINT(-118.2887118324064 34.01983287503752)'),
	('Fountain 1: Generations Fountains', 'POINT(-118.283284 34.022241)'),
	('Fountain 2: Prentiss Memorial Fountain', 'POINT(-118.284625 34.020655)'),
	('Fountain 3: Patsy and Forrest Shumway Fountain', 'POINT(-118.285244 34.020258)'),
	('Eateries 1: Pot Of Cha', 'POINT(-118.278702 34.024997)'),
	('Eateries 2: Ebaes', 'POINT(-118.28366 34.034441)'),
	('Eateries 3: Chipotle', 'POINT(-118.284433 34.03202)');

SELECT name, ST_AsText(geom) FROM PLACES;

--Convex Hull
SELECT ST_AsText(ST_ConvexHull(ST_Collect(geom))) FROM PLACES;


--Nearest Neighbor
SELECT PLACES.name, ST_AsText(PLACES.geom), PLACES.geom <-> 'POINT(-118.288115 34.030373)'::geometry AS dist
FROM PLACES WHERE name != 'Home: 2700 Ellendale' ORDER BY dist LIMIT 4;