-- WARNING: This procedure requires the Analytics Toolbox and assumes it will be located
-- at the following path: carto-un-eu.carto. If you want to deploy and
-- run it in a different location, you will need to update the code accordingly.
CREATE OR REPLACE PROCEDURE
  `carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.wfproc_6013105ac19a5b7f`(
)
BEGIN
  /*
   {"versionId":"3b1d3f0cff97501c","paramsId":"97d170e1550eee4a","isImmutable":true,"diagramJson":"{\"title\":\"PERFIL RIESGO HOSPITALES MADRID POR HEXAGONO_CORREGIDO\",\"description\":\"\",\"nodes\":[{\"id\":\"5e6e5301-3703-4329-9766-3cfb62c59e38\",\"data\":{\"id\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentes\",\"name\":\"ReadTable\",\"type\":\"table\",\"label\":\"accidentes\",\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentes\",\"description\":\"Read Table\"}]},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":112,\"y\":368},\"selected\":false},{\"id\":\"76e9df6b-efd1-4611-aedf-279b1d9b5fd0\",\"data\":{\"id\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentalidad\",\"name\":\"ReadTable\",\"type\":\"table\",\"label\":\"accidentalidad\",\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentalidad\",\"description\":\"Read Table\"}]},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":112,\"y\":544},\"selected\":false},{\"id\":\"283a6eff-ced8-49a3-b76f-bf784087c73a\",\"data\":{\"id\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.distritos_union\",\"name\":\"ReadTable\",\"type\":\"table\",\"label\":\"distritos_union\",\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.distritos_union\",\"description\":\"Read Table\"}]},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":1248,\"y\":720},\"selected\":false},{\"id\":\"1c1f3082-47cd-4131-9f16-1f32740077ff\",\"data\":{\"id\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.hospitales\",\"name\":\"ReadTable\",\"type\":\"table\",\"label\":\"hospitales\",\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.hospitales\",\"description\":\"Read Table\"}]},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":80,\"y\":176},\"selected\":false},{\"id\":\"32885080-3ff4-4aaa-8897-b042c3f300f0\",\"data\":{\"name\":\"native.isolines\",\"type\":\"generic\",\"label\":\"Create Isolines\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"geo\",\"type\":\"Column\",\"title\":\"Geo column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Geo column\",\"value\":\"geom\"},{\"name\":\"mode\",\"type\":\"Selection\",\"title\":\"Mode\",\"options\":[\"Walk\",\"Car\",\"Bike\",\"Public transport\",\"Coach\",\"Bus\",\"Train\",\"Ferry\"],\"description\":\"Mode\",\"value\":\"Car\"},{\"name\":\"type\",\"type\":\"Selection\",\"title\":\"Type of range\",\"options\":[\"time\",\"distance\"],\"description\":\"Type of range\",\"value\":\"time\"},{\"name\":\"range\",\"type\":\"Number\",\"title\":\"Range value (seconds/meters)\",\"min\":0,\"description\":\"Range value (seconds/meters)\",\"value\":300},{\"name\":\"customoptions\",\"type\":\"String\",\"title\":\"Isolines options\",\"default\":\"\",\"optional\":true,\"mode\":\"multiline\",\"allowExpressions\":false,\"advanced\":true,\"description\":\"Isolines options\",\"value\":\"\"},{\"name\":\"traveltime_departure_time\",\"type\":\"String\",\"title\":\"Departure time\",\"optional\":true,\"placeholder\":\"YYYY-MM-DDThh:mm:ss\"},{\"name\":\"traveltime_single_shape\",\"type\":\"Boolean\",\"title\":\"Single Shape\",\"default\":true,\"value\":true}],\"version\":\"2\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":416,\"y\":-80},\"selected\":false},{\"id\":\"ed10fa53-a7af-48eb-a3fd-f198fbeac3ab\",\"data\":{\"name\":\"native.isolines\",\"type\":\"generic\",\"label\":\"Create Isolines\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"geo\",\"type\":\"Column\",\"title\":\"Geo column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Geo column\",\"value\":\"geom\"},{\"name\":\"mode\",\"type\":\"Selection\",\"title\":\"Mode\",\"options\":[\"Walk\",\"Car\",\"Bike\",\"Public transport\",\"Coach\",\"Bus\",\"Train\",\"Ferry\"],\"description\":\"Mode\",\"value\":\"Car\"},{\"name\":\"type\",\"type\":\"Selection\",\"title\":\"Type of range\",\"options\":[\"time\",\"distance\"],\"description\":\"Type of range\",\"value\":\"time\"},{\"name\":\"range\",\"type\":\"Number\",\"title\":\"Range value (seconds/meters)\",\"min\":0,\"description\":\"Range value (seconds/meters)\",\"value\":600},{\"name\":\"customoptions\",\"type\":\"String\",\"title\":\"Isolines options\",\"default\":\"\",\"optional\":true,\"mode\":\"multiline\",\"allowExpressions\":false,\"advanced\":true,\"description\":\"Isolines options\",\"value\":\"\"},{\"name\":\"traveltime_departure_time\",\"type\":\"String\",\"title\":\"Departure time\",\"optional\":true,\"placeholder\":\"YYYY-MM-DDThh:mm:ss\"},{\"name\":\"traveltime_single_shape\",\"type\":\"Boolean\",\"title\":\"Single Shape\",\"default\":true,\"value\":true}],\"version\":\"2\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":416,\"y\":0},\"selected\":false},{\"id\":\"ce935e0b-178d-4399-82f7-05e561ad5ab7\",\"data\":{\"name\":\"native.isolines\",\"type\":\"generic\",\"label\":\"Create Isolines\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"geo\",\"type\":\"Column\",\"title\":\"Geo column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Geo column\",\"value\":\"geom\"},{\"name\":\"mode\",\"type\":\"Selection\",\"title\":\"Mode\",\"options\":[\"Walk\",\"Car\",\"Bike\",\"Public transport\",\"Coach\",\"Bus\",\"Train\",\"Ferry\"],\"description\":\"Mode\",\"value\":\"Car\"},{\"name\":\"type\",\"type\":\"Selection\",\"title\":\"Type of range\",\"options\":[\"time\",\"distance\"],\"description\":\"Type of range\",\"value\":\"time\"},{\"name\":\"range\",\"type\":\"Number\",\"title\":\"Range value (seconds/meters)\",\"min\":0,\"description\":\"Range value (seconds/meters)\",\"value\":900},{\"name\":\"customoptions\",\"type\":\"String\",\"title\":\"Isolines options\",\"default\":\"\",\"optional\":true,\"mode\":\"multiline\",\"allowExpressions\":false,\"advanced\":true,\"description\":\"Isolines options\",\"value\":\"\"},{\"name\":\"traveltime_departure_time\",\"type\":\"String\",\"title\":\"Departure time\",\"optional\":true,\"placeholder\":\"YYYY-MM-DDThh:mm:ss\"},{\"name\":\"traveltime_single_shape\",\"type\":\"Boolean\",\"title\":\"Single Shape\",\"default\":true,\"value\":true}],\"version\":\"2\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":416,\"y\":80},\"selected\":false},{\"id\":\"ccd37cd6-df63-4260-adcc-a946446f1c2c\",\"data\":{\"name\":\"native.h3polyfill\",\"type\":\"generic\",\"label\":\"H3 Polyfill\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"geo\",\"type\":\"Column\",\"title\":\"Geo column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Geo column\",\"value\":\"geom\"},{\"name\":\"resolution\",\"type\":\"Number\",\"title\":\"Resolution\",\"helper\":\"Hexagon edge length: 2=182km | 6=4km | 10=76m | 14=1.5m\",\"min\":0,\"max\":15,\"default\":8,\"mode\":\"slider\",\"description\":\"Resolution\",\"value\":9},{\"name\":\"aggregate\",\"type\":\"Boolean\",\"title\":\"Aggregate H3 cells\",\"default\":false,\"helper\":\"If false, the result will include the original columns from the input source\",\"description\":\"Aggregate H3 cells\",\"value\":false},{\"name\":\"includegeocolumns\",\"type\":\"Boolean\",\"title\":\"Include geo columns\",\"default\":false,\"helper\":\"If true, the result will include the original geo column(s)\",\"showIf\":[{\"value\":false,\"parameter\":\"aggregate\"}],\"description\":\"Include geo columns\",\"value\":false},{\"name\":\"mode\",\"type\":\"Selection\",\"title\":\"Mode\",\"options\":[\"center\",\"intersects\",\"contains\"],\"default\":\"center\",\"mode\":\"toggle\",\"providers\":[\"postgres\",\"bigquery\"],\"description\":\"Mode\",\"value\":\"center\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":576,\"y\":-80},\"selected\":false},{\"id\":\"205c15d7-9444-40f2-a7dd-78ffaa853c29\",\"data\":{\"name\":\"native.h3polyfill\",\"type\":\"generic\",\"label\":\"H3 Polyfill\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"geo\",\"type\":\"Column\",\"title\":\"Geo column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Geo column\",\"value\":\"geom\"},{\"name\":\"resolution\",\"type\":\"Number\",\"title\":\"Resolution\",\"helper\":\"Hexagon edge length: 2=182km | 6=4km | 10=76m | 14=1.5m\",\"min\":0,\"max\":15,\"default\":8,\"mode\":\"slider\",\"description\":\"Resolution\",\"value\":9},{\"name\":\"aggregate\",\"type\":\"Boolean\",\"title\":\"Aggregate H3 cells\",\"default\":false,\"helper\":\"If false, the result will include the original columns from the input source\",\"description\":\"Aggregate H3 cells\",\"value\":false},{\"name\":\"includegeocolumns\",\"type\":\"Boolean\",\"title\":\"Include geo columns\",\"default\":false,\"helper\":\"If true, the result will include the original geo column(s)\",\"showIf\":[{\"value\":false,\"parameter\":\"aggregate\"}],\"description\":\"Include geo columns\",\"value\":false},{\"name\":\"mode\",\"type\":\"Selection\",\"title\":\"Mode\",\"options\":[\"center\",\"intersects\",\"contains\"],\"default\":\"center\",\"mode\":\"toggle\",\"providers\":[\"postgres\",\"bigquery\"],\"description\":\"Mode\",\"value\":\"center\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":576,\"y\":0},\"selected\":false},{\"id\":\"4e789487-574a-4bb7-bea7-aace941b1364\",\"data\":{\"name\":\"native.h3polyfill\",\"type\":\"generic\",\"label\":\"H3 Polyfill\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"geo\",\"type\":\"Column\",\"title\":\"Geo column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Geo column\",\"value\":\"geom\"},{\"name\":\"resolution\",\"type\":\"Number\",\"title\":\"Resolution\",\"helper\":\"Hexagon edge length: 2=182km | 6=4km | 10=76m | 14=1.5m\",\"min\":0,\"max\":15,\"default\":8,\"mode\":\"slider\",\"description\":\"Resolution\",\"value\":9},{\"name\":\"aggregate\",\"type\":\"Boolean\",\"title\":\"Aggregate H3 cells\",\"default\":false,\"helper\":\"If false, the result will include the original columns from the input source\",\"description\":\"Aggregate H3 cells\",\"value\":false},{\"name\":\"includegeocolumns\",\"type\":\"Boolean\",\"title\":\"Include geo columns\",\"default\":false,\"helper\":\"If true, the result will include the original geo column(s)\",\"showIf\":[{\"value\":false,\"parameter\":\"aggregate\"}],\"description\":\"Include geo columns\",\"value\":false},{\"name\":\"mode\",\"type\":\"Selection\",\"title\":\"Mode\",\"options\":[\"center\",\"intersects\",\"contains\"],\"default\":\"center\",\"mode\":\"toggle\",\"providers\":[\"postgres\",\"bigquery\"],\"description\":\"Mode\",\"value\":\"center\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":576,\"y\":80},\"selected\":false},{\"id\":\"878ac897-6a31-498e-9e5b-ac8bcdaa02c0\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"-- Este código es más robusto y fácil de ampliar.\\n-- Primero, creamos una tabla temporal con todos los H3 y su tiempo mínimo.\\nWITH all_h3_times AS (\\n    SELECT h3, 300 as time FROM $a -- Conecta aquí la salida H3 de 300s\\n    UNION ALL\\n    SELECT h3, 600 as time FROM $b -- Conecta aquí la salida H3 de 600s\\n    UNION ALL\\n    SELECT h3, 900 as time FROM $c -- Conecta aquí la salida H3 de 900s\\n    -- Por ahora dejamos las otras dos fuera para no superar el límite de 3 entradas.\\n),\\n-- Ahora, para cada H3, encontramos el tiempo MÍNIMO al que pertenece.\\nmin_time_per_h3 AS (\\n    SELECT h3, MIN(time) as min_time\\n    FROM all_h3_times\\n    GROUP BY h3\\n)\\n-- Finalmente, asignamos la etiqueta 'catchment_zone' correcta basándonos en ese tiempo mínimo.\\nSELECT\\n    h3,\\n    CASE\\n        WHEN min_time = 300 THEN '00-05 min'\\n        WHEN min_time = 600 THEN '05-10 min'\\n        WHEN min_time = 900 THEN '10-15 min'\\n        -- Aquí añadiremos las nuevas condiciones\\n    END as catchment_zone\\nFROM min_time_per_h3\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":736,\"y\":0},\"selected\":false},{\"id\":\"3bafd4d7-4b3f-4352-a3eb-b31e02b9dc96\",\"data\":{\"name\":\"native.h3frompoint\",\"type\":\"generic\",\"label\":\"H3 from GeoPoint\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"pointscol\",\"type\":\"Column\",\"title\":\"Points column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Points column\",\"value\":\"geom\"},{\"name\":\"resolution\",\"type\":\"Number\",\"title\":\"Resolution\",\"min\":0,\"max\":15,\"default\":8,\"mode\":\"slider\",\"description\":\"Resolution\",\"value\":9}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":848,\"y\":480},\"selected\":false},{\"id\":\"d6d75860-f169-43c9-9d09-27048dad5821\",\"data\":{\"name\":\"native.h3frompoint\",\"type\":\"generic\",\"label\":\"H3 from GeoPoint\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"pointscol\",\"type\":\"Column\",\"title\":\"Points column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Points column\",\"value\":\"geom\"},{\"name\":\"resolution\",\"type\":\"Number\",\"title\":\"Resolution\",\"min\":0,\"max\":15,\"default\":8,\"mode\":\"slider\",\"description\":\"Resolution\",\"value\":9}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":848,\"y\":640},\"selected\":false},{\"id\":\"24c20f78-8a0f-4adf-bc34-847268a696d0\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"-- Seleccionamos todas las columnas de la tabla 'accidentes' ($a)\\n-- si su num_expediente está en la lista de expedientes graves de la tabla 'accidentalidad' ($b).\\nSELECT\\n  *\\nFROM `$a`\\nWHERE num_expediente IN (\\n    SELECT DISTINCT num_expediente\\n    FROM `$b`\\n    WHERE lesividad_clasificada IN ('HERIDOS GRAVES', 'FALLECIDOS')\\n)\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":432,\"y\":432},\"selected\":false},{\"id\":\"10da8552-180f-48b4-8263-946a39026f5d\",\"data\":{\"name\":\"Note\",\"color\":\"#8BE0A4\",\"genAi\":false,\"label\":\"\",\"width\":191.999,\"height\":159.989,\"inputs\":[],\"markdown\":\"accidentes_h3\",\"position\":{\"x\":736,\"y\":143.999}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":784,\"y\":400},\"selected\":false},{\"id\":\"b6ab88f9-1e64-4844-b2f0-22ad7c3b5a66\",\"data\":{\"name\":\"Note\",\"color\":\"#8BE0A4\",\"genAi\":false,\"label\":\"\",\"width\":191.989,\"height\":159.999,\"inputs\":[],\"markdown\":\"accidentes_graves_h3\",\"position\":{\"x\":527.999,\"y\":592}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":784,\"y\":576},\"selected\":false},{\"id\":\"36933593-686d-49f9-8f6b-95200bdd2500\",\"data\":{\"name\":\"Note\",\"color\":\"#8BE0A4\",\"genAi\":false,\"label\":\"\",\"width\":287.98900000000003,\"height\":367.999,\"inputs\":[],\"markdown\":\"zonas_influencia_h3\",\"position\":{\"x\":1040,\"y\":-656}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":704,\"y\":-80},\"selected\":false},{\"id\":\"88854892-6b3f-4e26-bdd9-3539f7f267d2\",\"data\":{\"name\":\"native.saveastable\",\"type\":\"generic\",\"label\":\"Save as Table\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"destination\",\"type\":\"OutputTable\",\"title\":\"Table details\",\"placeholder\":\"Rename and select destination\",\"description\":\"Table details\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentes_graves\"},{\"name\":\"append\",\"type\":\"Boolean\",\"title\":\"Append to existing table\",\"default\":false,\"description\":\"Append to existing table\",\"value\":false},{\"name\":\"optimizationcol\",\"type\":\"Column\",\"title\":\"Cluster by\",\"parent\":\"source\",\"dataType\":[\"geography\",\"boolean\",\"number\",\"string\",\"date\",\"datetime\",\"time\",\"timestamp\"],\"providers\":[\"bigquery\"],\"optional\":true,\"advanced\":true,\"description\":\"Cluster by\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":592,\"y\":544},\"selected\":false},{\"id\":\"db7d52bb-1647-4c31-ab47-7d90d77c5667\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"-- Usamos tablas temporales para simplificar los datos de accidentes y mejorar el rendimiento.\\nWITH accidentes_simplificados AS (\\n    SELECT h3, num_expediente, tipo_accidente_clasificado FROM `$b`\\n),\\ngraves_simplificados AS (\\n    SELECT h3, num_expediente FROM `$c`\\n)\\n-- El cambio clave: ahora agrupamos por CADA HEXÁGONO (a.h3).\\nSELECT\\n    a.h3, -- Mantenemos el identificador del hexágono\\n    a.catchment_zone,\\n    -- Usamos COALESCE para convertir los resultados nulos (hexágonos sin accidentes) a 0.\\n    COALESCE(COUNT(DISTINCT s.num_expediente), 0) as volumen_total_accidentes,\\n    COALESCE(COUNT(DISTINCT g.num_expediente), 0) as severidad_alta,\\n    COALESCE(COUNT(DISTINCT CASE WHEN s.tipo_accidente_clasificado = 'Atropello a persona' THEN s.num_expediente END), 0) as riesgo_peatonal\\n\\nFROM `$a` a  -- Nuestra tabla de referencia de todas las zonas H3\\nLEFT JOIN accidentes_simplificados s ON a.h3 = s.h3\\nLEFT JOIN graves_simplificados g ON a.h3 = g.h3\\nGROUP BY\\n    a.h3, a.catchment_zone\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1104,\"y\":544},\"selected\":false},{\"id\":\"2ed0caa1-0b01-426c-a624-a1bb62ea004f\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"WITH madrid_boundary AS (\\n    SELECT distritos_union AS boundary_geom FROM `$b` LIMIT 1\\n)\\nSELECT\\n    a.* EXCEPT(h3_geo),\\n    ST_INTERSECTION(a.h3_geo, b.boundary_geom) as geometry\\nFROM `$a` a, madrid_boundary b\\nWHERE ST_INTERSECTS(a.h3_geo, b.boundary_geom)\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1520,\"y\":592},\"selected\":false},{\"id\":\"a911c403-f049-40a9-a734-8dc8827ea6af\",\"data\":{\"name\":\"native.h3boundary\",\"type\":\"generic\",\"label\":\"H3 Boundary\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"h3col\",\"type\":\"Column\",\"title\":\"H3 column\",\"parent\":\"source\",\"placeholder\":\"h3\",\"dataType\":[\"string\"],\"description\":\"H3 column\",\"value\":\"h3\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1408,\"y\":544},\"selected\":false},{\"id\":\"1ab1f4e0-5c56-4a2e-a6a7-a1d7ca17bb69\",\"data\":{\"name\":\"native.saveastable\",\"type\":\"generic\",\"label\":\"Save as Table\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"destination\",\"type\":\"OutputTable\",\"title\":\"Table details\",\"placeholder\":\"Rename and select destination\",\"description\":\"Table details\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.perfil_riesgo_hospitales_madrid_por_hexagono\"},{\"name\":\"append\",\"type\":\"Boolean\",\"title\":\"Append to existing table\",\"default\":false,\"description\":\"Append to existing table\",\"value\":false},{\"name\":\"optimizationcol\",\"type\":\"Column\",\"title\":\"Cluster by\",\"parent\":\"source\",\"dataType\":[\"geography\",\"boolean\",\"number\",\"string\",\"date\",\"datetime\",\"time\",\"timestamp\"],\"providers\":[\"bigquery\"],\"optional\":true,\"advanced\":true,\"description\":\"Cluster by\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1664,\"y\":592},\"selected\":false},{\"id\":\"dd5c9003-dddf-426f-83e7-7d78d1047efb\",\"data\":{\"name\":\"Note\",\"color\":\"#FE88B1\",\"genAi\":false,\"label\":\"\",\"width\":735.997,\"height\":367.99800000000005,\"inputs\":[],\"markdown\":\"---\\nlabel: Spatial Analysis - Hospital Risk Micro-Clusters\\n---\\n## ANÁLISIS DE MICRO-CLÚSTERES DE RIESGO HOSPITALARIO\\n\\nEste workflow genera un mapa de calor de alta resolución para identificar **puntos calientes** de riesgo de accidentes dentro de las zonas de servicio hospitalario de Madrid.\\n\\nEn lugar de promediar el riesgo por zona, este análisis calcula tres métricas clave para **cada hexágono individual**, permitiendo detectar micro-clústeres con una precisión sin precedentes:\\n1.  **Volumen Total:** Número de accidentes únicos por hexágono.\\n2.  **Alta Severidad:** Número de accidentes graves por hexágono.\\n3.  **Riesgo Peatonal:** Número de atropellos por hexágono.\",\"position\":{\"x\":1024,\"y\":-288}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":1024,\"y\":-288},\"selected\":false},{\"id\":\"51649826-4a7e-4ca3-81be-48ef11637514\",\"data\":{\"name\":\"Note\",\"color\":\"#F6CF71\",\"genAi\":false,\"label\":\"\",\"width\":351.994,\"height\":1280,\"inputs\":[],\"markdown\":\"---\\nlabel: Data Sources\\n---\\n### FUENTES DE DATOS\\n\\n*   **`hospitales`**: Ubicaciones (puntos) de los hospitales. Actúan como los \\\"semilleros\\\" para el análisis de isócronas.\\n*   **`accidentes`**: Datos únicos por accidente (1 fila = 1 accidente). Aporta la localización (`geometry`) y características del evento.\\n*   **`accidentalidad`**: Tabla de implicados. Se usa para obtener los datos de gravedad (`lesividad_clasificada`).\",\"position\":{\"x\":0,\"y\":-288}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":0,\"y\":-288},\"selected\":false},{\"id\":\"4e0e3648-9378-4e3e-a28b-1d113caaa64b\",\"data\":{\"name\":\"Note\",\"color\":\"#8BE0A4\",\"genAi\":false,\"label\":\"\",\"width\":639.9989999999999,\"height\":655.9929999999999,\"inputs\":[],\"markdown\":\"### 1. GENERAR ZONAS DE SERVICIO (ISÓCRONAS H3)\\n\\n**Objetivo:** Definir las áreas de servicio de 5, 10 y 15 minutos en coche desde cada hospital y estandarizarlas en una parrilla H3.\\n\\n*   **Create Isolines:** Genera los polígonos de tiempo de viaje (isócronas).\\n*   **H3 Polyfill:** Convierte cada polígono en un conjunto de celdas hexagonales H3 (res. 9). **La salida de este bloque actúa como el \\\"mapa de referencia\\\" de todas las celdas a analizar.**\",\"position\":{\"x\":368,\"y\":-288.006}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":368,\"y\":-288},\"selected\":false},{\"id\":\"2c69eec7-1d5e-4ee8-884f-2ef7be1f41d0\",\"data\":{\"name\":\"Note\",\"color\":\"#8BE0A4\",\"genAi\":false,\"label\":\"\",\"width\":639.9889999999999,\"height\":607.9939999999999,\"inputs\":[],\"markdown\":\"&nbsp;\\n\\n&nbsp;\\n\\n&nbsp;\\n\\n&nbsp;\\n\\n&nbsp;\\n\\n&nbsp;\\n\\n&nbsp;\\n\\n&nbsp;\\n\\n&nbsp;\\n\\n&nbsp;\\n\\n&nbsp;\\n\\n\\n### 2. PREPARAR DATOS DE ACCIDENTES\\n\\n**Objetivo:** Generar dos conjuntos de datos indexados con H3: (A) Todos los accidentes y (B) Solo los accidentes graves.\\n\\n*   **Todos los Accidentes:** La tabla `accidentes` se procesa con `H3 from GeoPoint` para asignarle a cada evento su celda H3 correspondiente.\\n*   **Accidentes Graves:**\\n    *   Un `Custom SQL` filtra la tabla `accidentes` para seleccionar solo los eventos con `HERIDOS GRAVES` o `FALLECIDOS`.\\n    *   **El resultado se guarda en la tabla `accidentes_graves` para su reutilización.**\\n    *   Posteriormente, este resultado filtrado también se indexa con H3.\",\"position\":{\"x\":368,\"y\":160}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":368,\"y\":384},\"selected\":false},{\"id\":\"88c69e5d-f4e6-4d68-bd29-64e16a9915e4\",\"data\":{\"name\":\"Note\",\"color\":\"#8BE0A4\",\"genAi\":false,\"label\":\"\",\"width\":335.999,\"height\":591.9889999999999,\"inputs\":[],\"markdown\":\"### 3. CALCULAR MÉTRICAS POR HEXÁGONO\\n\\n**Objetivo:** Cuantificar el riesgo para cada hexágono individual. Este es el corazón del análisis de alta resolución.\\n\\n*   **Custom SQL (Agregación por H3):** Este único nodo une la tabla de referencia de zonas H3 con las dos tablas de accidentes.\\n*   La clave de este paso es que la agregación (`GROUP BY`) se realiza por **cada celda H3 individual (`a.h3`)**, no por la zona general.\\n*   El resultado es una tabla donde cada fila es un hexágono con sus propias métricas de riesgo calculadas (`volumen_total`, `severidad_alta` y `riesgo_peatonal`).\",\"position\":{\"x\":1024,\"y\":95.998}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":1024,\"y\":96},\"selected\":false},{\"id\":\"3938c373-8ce7-4dc7-9f2d-14c164716eb9\",\"data\":{\"name\":\"Note\",\"color\":\"#9EB9F3\",\"genAi\":false,\"label\":\"\",\"width\":383.988,\"height\":591.992,\"inputs\":[],\"markdown\":\"### 4. ENSAMBLAJE FINAL, GEOMETRÍA Y RECORTE\\n\\n**Objetivo:** Convertir los hexágonos enriquecidos a un formato geográfico visible y ajustar el resultado final al contorno de Madrid.\\n\\n*   **H3 Boundary:** Transforma cada celda H3 (que ahora contiene sus métricas de riesgo personalizadas) en un polígono hexagonal visible.\\n*   **Custom SQL (Recorte):** Usa `ST_INTERSECTION` para recortar los hexágonos con el polígono de `distritos_union`, asegurando una visualización limpia y precisa.\\n*   **Save as Table:** Almacena la tabla final, lista para crear un mapa de calor de alta resolución.\",\"position\":{\"x\":1456,\"y\":95.992}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":1376,\"y\":96},\"selected\":false},{\"id\":\"75a63fb7-0274-4cf5-a7a5-3d19aaeba2e0\",\"data\":{\"name\":\"Note\",\"color\":\"#F6CF71\",\"genAi\":false,\"label\":\"\",\"width\":463.994,\"height\":160,\"inputs\":[],\"markdown\":\"---\\nlabel: Data Sources\\n---\\n### FUENTES DE DATOS\\n\\n*   **`distritos_union`**: Tabla con un único polígono que contiene el contorno geográfico de Madrid. Se usa para el recorte final.\",\"position\":{\"x\":1071.99,\"y\":416}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":1024,\"y\":704},\"selected\":false},{\"id\":\"82f679d9-0c53-4a38-9173-449474842921\",\"data\":{\"name\":\"Note\",\"color\":\"#9EB9F3\",\"genAi\":false,\"label\":\"\",\"width\":320,\"height\":192,\"inputs\":[],\"markdown\":\"---\\nlabel: Data Sinks\\n---\\n### SALIDA GUARDADA\\n\\n*   **`accidentes_graves`**: Tabla intermedia que contiene solo los accidentes graves.\",\"position\":{\"x\":368,\"y\":528}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":368,\"y\":560},\"selected\":false},{\"id\":\"b68f7cf1-ae99-4782-8f41-be2aee72b337\",\"data\":{\"name\":\"native.isolines\",\"type\":\"generic\",\"label\":\"Create Isolines\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"geo\",\"type\":\"Column\",\"title\":\"Geo column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Geo column\",\"value\":\"geom\"},{\"name\":\"mode\",\"type\":\"Selection\",\"title\":\"Mode\",\"options\":[\"Walk\",\"Car\",\"Bike\",\"Public transport\",\"Coach\",\"Bus\",\"Train\",\"Ferry\"],\"description\":\"Mode\",\"value\":\"Car\"},{\"name\":\"type\",\"type\":\"Selection\",\"title\":\"Type of range\",\"options\":[\"time\",\"distance\"],\"description\":\"Type of range\",\"value\":\"time\"},{\"name\":\"range\",\"type\":\"Number\",\"title\":\"Range value (seconds/meters)\",\"min\":0,\"description\":\"Range value (seconds/meters)\",\"value\":1800},{\"name\":\"customoptions\",\"type\":\"String\",\"title\":\"Isolines options\",\"default\":\"\",\"optional\":true,\"mode\":\"multiline\",\"allowExpressions\":false,\"advanced\":true,\"description\":\"Isolines options\",\"value\":\"\"},{\"name\":\"traveltime_departure_time\",\"type\":\"String\",\"title\":\"Departure time\",\"optional\":true,\"placeholder\":\"YYYY-MM-DDThh:mm:ss\"},{\"name\":\"traveltime_single_shape\",\"type\":\"Boolean\",\"title\":\"Single Shape\",\"default\":true,\"value\":true}],\"version\":\"2\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":416,\"y\":160},\"selected\":false},{\"id\":\"cfa2a0b8-e5a4-46c5-8a6c-c31e637894db\",\"data\":{\"name\":\"native.isolines\",\"type\":\"generic\",\"label\":\"Create Isolines\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"geo\",\"type\":\"Column\",\"title\":\"Geo column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Geo column\",\"value\":\"geom\"},{\"name\":\"mode\",\"type\":\"Selection\",\"title\":\"Mode\",\"options\":[\"Walk\",\"Car\",\"Bike\",\"Public transport\",\"Coach\",\"Bus\",\"Train\",\"Ferry\"],\"description\":\"Mode\",\"value\":\"Car\"},{\"name\":\"type\",\"type\":\"Selection\",\"title\":\"Type of range\",\"options\":[\"time\",\"distance\"],\"description\":\"Type of range\",\"value\":\"time\"},{\"name\":\"range\",\"type\":\"Number\",\"title\":\"Range value (seconds/meters)\",\"min\":0,\"description\":\"Range value (seconds/meters)\",\"value\":2700},{\"name\":\"customoptions\",\"type\":\"String\",\"title\":\"Isolines options\",\"default\":\"\",\"optional\":true,\"mode\":\"multiline\",\"allowExpressions\":false,\"advanced\":true,\"description\":\"Isolines options\",\"value\":\"\"},{\"name\":\"traveltime_departure_time\",\"type\":\"String\",\"title\":\"Departure time\",\"optional\":true,\"placeholder\":\"YYYY-MM-DDThh:mm:ss\"},{\"name\":\"traveltime_single_shape\",\"type\":\"Boolean\",\"title\":\"Single Shape\",\"default\":true,\"value\":true}],\"version\":\"2\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":416,\"y\":256},\"selected\":false},{\"id\":\"cffbea23-f119-4ec0-be9d-588fc34f2298\",\"data\":{\"name\":\"native.h3polyfill\",\"type\":\"generic\",\"label\":\"H3 Polyfill\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"geo\",\"type\":\"Column\",\"title\":\"Geo column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Geo column\",\"value\":\"geom\"},{\"name\":\"resolution\",\"type\":\"Number\",\"title\":\"Resolution\",\"helper\":\"Hexagon edge length: 2=182km | 6=4km | 10=76m | 14=1.5m\",\"min\":0,\"max\":15,\"default\":8,\"mode\":\"slider\",\"description\":\"Resolution\",\"value\":9},{\"name\":\"aggregate\",\"type\":\"Boolean\",\"title\":\"Aggregate H3 cells\",\"default\":false,\"helper\":\"If false, the result will include the original columns from the input source\",\"description\":\"Aggregate H3 cells\",\"value\":false},{\"name\":\"includegeocolumns\",\"type\":\"Boolean\",\"title\":\"Include geo columns\",\"default\":false,\"helper\":\"If true, the result will include the original geo column(s)\",\"showIf\":[{\"value\":false,\"parameter\":\"aggregate\"}],\"description\":\"Include geo columns\",\"value\":false},{\"name\":\"mode\",\"type\":\"Selection\",\"title\":\"Mode\",\"options\":[\"center\",\"intersects\",\"contains\"],\"default\":\"center\",\"mode\":\"toggle\",\"providers\":[\"postgres\",\"bigquery\"],\"description\":\"Mode\",\"value\":\"center\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":576,\"y\":160},\"selected\":false},{\"id\":\"004e4be6-fbe3-4450-9f64-4a2d89c0d8bc\",\"data\":{\"name\":\"native.h3polyfill\",\"type\":\"generic\",\"label\":\"H3 Polyfill\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"geo\",\"type\":\"Column\",\"title\":\"Geo column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Geo column\",\"value\":\"geom\"},{\"name\":\"resolution\",\"type\":\"Number\",\"title\":\"Resolution\",\"helper\":\"Hexagon edge length: 2=182km | 6=4km | 10=76m | 14=1.5m\",\"min\":0,\"max\":15,\"default\":8,\"mode\":\"slider\",\"description\":\"Resolution\",\"value\":9},{\"name\":\"aggregate\",\"type\":\"Boolean\",\"title\":\"Aggregate H3 cells\",\"default\":false,\"helper\":\"If false, the result will include the original columns from the input source\",\"description\":\"Aggregate H3 cells\",\"value\":false},{\"name\":\"includegeocolumns\",\"type\":\"Boolean\",\"title\":\"Include geo columns\",\"default\":false,\"helper\":\"If true, the result will include the original geo column(s)\",\"showIf\":[{\"value\":false,\"parameter\":\"aggregate\"}],\"description\":\"Include geo columns\",\"value\":false},{\"name\":\"mode\",\"type\":\"Selection\",\"title\":\"Mode\",\"options\":[\"center\",\"intersects\",\"contains\"],\"default\":\"center\",\"mode\":\"toggle\",\"providers\":[\"postgres\",\"bigquery\"],\"description\":\"Mode\",\"value\":\"center\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":560,\"y\":256},\"selected\":false},{\"id\":\"a2180ac3-b800-4452-9900-ecc5ded1656b\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"-- Tomamos todas las filas de los primeros anillos...\\nSELECT h3, catchment_zone FROM `$a`\\nUNION ALL\\n-- ...y añadimos el anillo de 15-30 minutos...\\n-- (NOTA: Para hacer la exclusión, tenemos que asumir que $b contiene todo lo anterior)\\nSELECT h3, '15-30 min' as catchment_zone\\nFROM `$b`\\nWHERE h3 NOT IN (SELECT h3 FROM `$a`)\\nUNION ALL\\n-- ...y finalmente añadimos el anillo de 30-45 minutos.\\nSELECT h3, '30-45 min' as catchment_zone\\nFROM `$c`\\nWHERE h3 NOT IN (SELECT h3 FROM `$b`)\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":848,\"y\":160},\"selected\":false}],\"edges\":[{\"id\":\"d4388214-dc48-4a99-aeac-05931b7dc3c3\",\"type\":\"default\",\"source\":\"1c1f3082-47cd-4131-9f16-1f32740077ff\",\"target\":\"32885080-3ff4-4aaa-8897-b042c3f300f0\",\"sourceHandle\":\"out\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"64dead31-3cf4-4183-9926-7967567c6103\",\"type\":\"default\",\"source\":\"1c1f3082-47cd-4131-9f16-1f32740077ff\",\"target\":\"ed10fa53-a7af-48eb-a3fd-f198fbeac3ab\",\"sourceHandle\":\"out\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"dcb41119-6716-4ef6-b885-2410636c24c5\",\"type\":\"default\",\"source\":\"1c1f3082-47cd-4131-9f16-1f32740077ff\",\"target\":\"ce935e0b-178d-4399-82f7-05e561ad5ab7\",\"sourceHandle\":\"out\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"32885080-3ff4-4aaa-8897-b042c3f300f0result-ccd37cd6-df63-4260-adcc-a946446f1c2csource\",\"source\":\"32885080-3ff4-4aaa-8897-b042c3f300f0\",\"target\":\"ccd37cd6-df63-4260-adcc-a946446f1c2c\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"ed10fa53-a7af-48eb-a3fd-f198fbeac3abresult-205c15d7-9444-40f2-a7dd-78ffaa853c29source\",\"source\":\"ed10fa53-a7af-48eb-a3fd-f198fbeac3ab\",\"target\":\"205c15d7-9444-40f2-a7dd-78ffaa853c29\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"ce935e0b-178d-4399-82f7-05e561ad5ab7result-4e789487-574a-4bb7-bea7-aace941b1364source\",\"source\":\"ce935e0b-178d-4399-82f7-05e561ad5ab7\",\"target\":\"4e789487-574a-4bb7-bea7-aace941b1364\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"4ed1e0bd-f3b5-441f-8c65-9cbedb7c67c4\",\"type\":\"default\",\"source\":\"ccd37cd6-df63-4260-adcc-a946446f1c2c\",\"target\":\"878ac897-6a31-498e-9e5b-ac8bcdaa02c0\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourcea\",\"animated\":false},{\"id\":\"a21d9c4e-460c-4c7c-a591-9a359588e8da\",\"type\":\"default\",\"source\":\"205c15d7-9444-40f2-a7dd-78ffaa853c29\",\"target\":\"878ac897-6a31-498e-9e5b-ac8bcdaa02c0\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourceb\",\"animated\":false},{\"id\":\"07df1293-2f60-40a4-b344-eb34b8c9a04a\",\"type\":\"default\",\"source\":\"4e789487-574a-4bb7-bea7-aace941b1364\",\"target\":\"878ac897-6a31-498e-9e5b-ac8bcdaa02c0\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourcec\",\"animated\":false},{\"id\":\"d6b10b29-e227-46c6-b927-250aeea72411\",\"type\":\"default\",\"source\":\"5e6e5301-3703-4329-9766-3cfb62c59e38\",\"target\":\"3bafd4d7-4b3f-4352-a3eb-b31e02b9dc96\",\"sourceHandle\":\"out\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"7628bd05-7a38-4c53-94f8-3d6a27454161\",\"type\":\"default\",\"source\":\"5e6e5301-3703-4329-9766-3cfb62c59e38\",\"target\":\"24c20f78-8a0f-4adf-bc34-847268a696d0\",\"sourceHandle\":\"out\",\"targetHandle\":\"sourcea\",\"animated\":false},{\"id\":\"71cfdfe1-1f18-48dd-b423-f6e18574cb98\",\"type\":\"default\",\"source\":\"76e9df6b-efd1-4611-aedf-279b1d9b5fd0\",\"target\":\"24c20f78-8a0f-4adf-bc34-847268a696d0\",\"sourceHandle\":\"out\",\"targetHandle\":\"sourceb\",\"animated\":false},{\"id\":\"cdbd00cc-e345-44e1-b906-dd838928125d\",\"type\":\"default\",\"source\":\"24c20f78-8a0f-4adf-bc34-847268a696d0\",\"target\":\"d6d75860-f169-43c9-9d09-27048dad5821\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"a23a01e8-67ed-4461-b413-fce2196726c8\",\"type\":\"default\",\"source\":\"24c20f78-8a0f-4adf-bc34-847268a696d0\",\"target\":\"88854892-6b3f-4e26-bdd9-3539f7f267d2\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"40b76877-1245-44e4-a861-9e4d4bc21c89\",\"type\":\"default\",\"source\":\"3bafd4d7-4b3f-4352-a3eb-b31e02b9dc96\",\"target\":\"db7d52bb-1647-4c31-ab47-7d90d77c5667\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourceb\",\"animated\":false},{\"id\":\"4a4871d5-7d7d-4d1a-b443-5543642cefeb\",\"type\":\"default\",\"source\":\"d6d75860-f169-43c9-9d09-27048dad5821\",\"target\":\"db7d52bb-1647-4c31-ab47-7d90d77c5667\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourcec\",\"animated\":false},{\"id\":\"db7d52bb-1647-4c31-ab47-7d90d77c5667result-a911c403-f049-40a9-a734-8dc8827ea6afsource\",\"source\":\"db7d52bb-1647-4c31-ab47-7d90d77c5667\",\"target\":\"a911c403-f049-40a9-a734-8dc8827ea6af\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"7502029a-9a0f-4d21-ab40-6999652aeb49\",\"type\":\"default\",\"source\":\"a911c403-f049-40a9-a734-8dc8827ea6af\",\"target\":\"2ed0caa1-0b01-426c-a624-a1bb62ea004f\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourcea\",\"animated\":false},{\"id\":\"745535f0-0a85-46cb-8b07-ceb9d8617ff6\",\"type\":\"default\",\"source\":\"283a6eff-ced8-49a3-b76f-bf784087c73a\",\"target\":\"2ed0caa1-0b01-426c-a624-a1bb62ea004f\",\"sourceHandle\":\"out\",\"targetHandle\":\"sourceb\",\"animated\":false},{\"id\":\"0ce57f5d-3cc1-4263-bafc-573dff3dcb7c\",\"type\":\"default\",\"source\":\"2ed0caa1-0b01-426c-a624-a1bb62ea004f\",\"target\":\"1ab1f4e0-5c56-4a2e-a6a7-a1d7ca17bb69\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"51c89c6a-ad86-4c5d-8eff-88000000c197\",\"type\":\"default\",\"source\":\"b68f7cf1-ae99-4782-8f41-be2aee72b337\",\"target\":\"cffbea23-f119-4ec0-be9d-588fc34f2298\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"b7bec3b2-a8d9-4413-a6cb-cee29fe6361e\",\"type\":\"default\",\"source\":\"1c1f3082-47cd-4131-9f16-1f32740077ff\",\"target\":\"b68f7cf1-ae99-4782-8f41-be2aee72b337\",\"sourceHandle\":\"out\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"53b689b7-65b0-4da7-a6f6-848d13a2096f\",\"type\":\"default\",\"source\":\"1c1f3082-47cd-4131-9f16-1f32740077ff\",\"target\":\"cfa2a0b8-e5a4-46c5-8a6c-c31e637894db\",\"sourceHandle\":\"out\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"5a907561-66b4-4b13-9866-777c208e81c8\",\"type\":\"default\",\"source\":\"cfa2a0b8-e5a4-46c5-8a6c-c31e637894db\",\"target\":\"004e4be6-fbe3-4450-9f64-4a2d89c0d8bc\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"e784be12-4c57-4ff6-aa4a-22299c687a3a\",\"type\":\"default\",\"source\":\"cffbea23-f119-4ec0-be9d-588fc34f2298\",\"target\":\"a2180ac3-b800-4452-9900-ecc5ded1656b\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourceb\",\"animated\":false},{\"id\":\"68c3f0d4-69ff-4c96-8c5a-dff08483e46c\",\"type\":\"default\",\"source\":\"878ac897-6a31-498e-9e5b-ac8bcdaa02c0\",\"target\":\"a2180ac3-b800-4452-9900-ecc5ded1656b\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourcea\",\"animated\":false},{\"id\":\"6ac825fc-01fd-4394-82a1-f88dd81849e7\",\"type\":\"default\",\"source\":\"004e4be6-fbe3-4450-9f64-4a2d89c0d8bc\",\"target\":\"a2180ac3-b800-4452-9900-ecc5ded1656b\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourcec\",\"animated\":false},{\"id\":\"723ffe91-3559-4626-ac8e-69604bb08333\",\"type\":\"default\",\"source\":\"a2180ac3-b800-4452-9900-ecc5ded1656b\",\"target\":\"db7d52bb-1647-4c31-ab47-7d90d77c5667\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourcea\",\"animated\":false}],\"variables\":null,\"procedure\":{},\"schedule\":null,\"viewport\":{\"x\":57.75720881029524,\"y\":71.91026533729924,\"zoom\":0.4629523493762858},\"schemaVersion\":\"1.0.0\",\"connectionProvider\":\"bigquery\",\"useCache\":true}"}
  */
  DECLARE __outputtable STRING;
  DECLARE __outputtablefqn STRING;
  SET __outputtable = 'wfproc_6013105ac19a5b7f_out_' || SUBSTRING(TO_HEX(MD5('')), 1, 16);
  SET __outputtablefqn = 'carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.wfproc_6013105ac19a5b7f_out_' || SUBSTRING(TO_HEX(MD5('')), 1, 16);
  BEGIN
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_6013105ac19a5b7f_f107384622ee8b2c_result`
    AS
      SELECT
      `carto-un-eu.carto`.H3_FROMGEOGPOINT(
          geom, 9
        ) h3, *
      FROM `carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentes`;
    END;
    BEGIN
    DECLARE tempOutputTable STRING DEFAULT '`carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3`.' || REPLACE(GENERATE_UUID(), '-', '_');
    BEGIN
    CALL `carto-un-eu.carto`.CREATE_ISOLINES(
      'https://gcp-europe-west1.api.carto.com',
      'eyJhbGciOiJIUzI1NiJ9.eyJhIjoiYWNfdDg3Mm81M2YiLCJqdGkiOiI0YWI1NjU2MyJ9.4FGgabe5KvSsDwNc2FbUQv13eGFrFN3w828VXH1BT0s',
      'SELECT * FROM `carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.hospitales`',
      tempOutputTable,
      'geom',
      'car',
      600,
      'time',
      '{"polygons_filter":{"limit":1},"carto_keep_orig_geom":true}');
    EXECUTE IMMEDIATE '''
      CREATE TEMPORARY TABLE `WORKFLOW_6013105ac19a5b7f_6ef992b50024d076_result` AS
        SELECT *
        FROM ''' || tempOutputTable;
    END;
    END;
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_6013105ac19a5b7f_b33b8dfaa4405160_result`
    AS
      WITH __h3 AS
      (
        SELECT
          s.carto_isoline_metadata, s.nombre,
          `carto-un-eu.carto`.H3_POLYFILL_MODE(
              geom,
              9,
              'center'
            ) h3s
        FROM
          (
            SELECT *
            FROM `WORKFLOW_6013105ac19a5b7f_6ef992b50024d076_result`
            WHERE geom IS NOT NULL
          ) s
      )
      SELECT * EXCEPT(h3s)
      FROM __h3, __h3.h3s AS h3;
    END;
    BEGIN
    DECLARE tempOutputTable STRING DEFAULT '`carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3`.' || REPLACE(GENERATE_UUID(), '-', '_');
    BEGIN
    CALL `carto-un-eu.carto`.CREATE_ISOLINES(
      'https://gcp-europe-west1.api.carto.com',
      'eyJhbGciOiJIUzI1NiJ9.eyJhIjoiYWNfdDg3Mm81M2YiLCJqdGkiOiI0YWI1NjU2MyJ9.4FGgabe5KvSsDwNc2FbUQv13eGFrFN3w828VXH1BT0s',
      'SELECT * FROM `carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.hospitales`',
      tempOutputTable,
      'geom',
      'car',
      900,
      'time',
      '{"polygons_filter":{"limit":1},"carto_keep_orig_geom":true}');
    EXECUTE IMMEDIATE '''
      CREATE TEMPORARY TABLE `WORKFLOW_6013105ac19a5b7f_d8a8ce1bc8ebe972_result` AS
        SELECT *
        FROM ''' || tempOutputTable;
    END;
    END;
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_6013105ac19a5b7f_4a2f5a51713dc086_result`
    AS
      WITH __h3 AS
      (
        SELECT
          s.carto_isoline_metadata, s.nombre,
          `carto-un-eu.carto`.H3_POLYFILL_MODE(
              geom,
              9,
              'center'
            ) h3s
        FROM
          (
            SELECT *
            FROM `WORKFLOW_6013105ac19a5b7f_d8a8ce1bc8ebe972_result`
            WHERE geom IS NOT NULL
          ) s
      )
      SELECT * EXCEPT(h3s)
      FROM __h3, __h3.h3s AS h3;
    END;
    BEGIN
    DECLARE tempOutputTable STRING DEFAULT '`carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3`.' || REPLACE(GENERATE_UUID(), '-', '_');
    BEGIN
    CALL `carto-un-eu.carto`.CREATE_ISOLINES(
      'https://gcp-europe-west1.api.carto.com',
      'eyJhbGciOiJIUzI1NiJ9.eyJhIjoiYWNfdDg3Mm81M2YiLCJqdGkiOiI0YWI1NjU2MyJ9.4FGgabe5KvSsDwNc2FbUQv13eGFrFN3w828VXH1BT0s',
      'SELECT * FROM `carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.hospitales`',
      tempOutputTable,
      'geom',
      'car',
      1800,
      'time',
      '{"polygons_filter":{"limit":1},"carto_keep_orig_geom":true}');
    EXECUTE IMMEDIATE '''
      CREATE TEMPORARY TABLE `WORKFLOW_6013105ac19a5b7f_933ce9f10a6c1043_result` AS
        SELECT *
        FROM ''' || tempOutputTable;
    END;
    END;
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_6013105ac19a5b7f_5c038c3d2df174c9_result`
    AS
      WITH __h3 AS
      (
        SELECT
          s.carto_isoline_metadata, s.nombre,
          `carto-un-eu.carto`.H3_POLYFILL_MODE(
              geom,
              9,
              'center'
            ) h3s
        FROM
          (
            SELECT *
            FROM `WORKFLOW_6013105ac19a5b7f_933ce9f10a6c1043_result`
            WHERE geom IS NOT NULL
          ) s
      )
      SELECT * EXCEPT(h3s)
      FROM __h3, __h3.h3s AS h3;
    END;
    BEGIN
    DECLARE tempOutputTable STRING DEFAULT '`carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3`.' || REPLACE(GENERATE_UUID(), '-', '_');
    BEGIN
    CALL `carto-un-eu.carto`.CREATE_ISOLINES(
      'https://gcp-europe-west1.api.carto.com',
      'eyJhbGciOiJIUzI1NiJ9.eyJhIjoiYWNfdDg3Mm81M2YiLCJqdGkiOiI0YWI1NjU2MyJ9.4FGgabe5KvSsDwNc2FbUQv13eGFrFN3w828VXH1BT0s',
      'SELECT * FROM `carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.hospitales`',
      tempOutputTable,
      'geom',
      'car',
      2700,
      'time',
      '{"polygons_filter":{"limit":1},"carto_keep_orig_geom":true}');
    EXECUTE IMMEDIATE '''
      CREATE TEMPORARY TABLE `WORKFLOW_6013105ac19a5b7f_e778c2b05f829258_result` AS
        SELECT *
        FROM ''' || tempOutputTable;
    END;
    END;
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_6013105ac19a5b7f_e877e1c7e5f7f0dd_result`
    AS
      WITH __h3 AS
      (
        SELECT
          s.carto_isoline_metadata, s.nombre,
          `carto-un-eu.carto`.H3_POLYFILL_MODE(
              geom,
              9,
              'center'
            ) h3s
        FROM
          (
            SELECT *
            FROM `WORKFLOW_6013105ac19a5b7f_e778c2b05f829258_result`
            WHERE geom IS NOT NULL
          ) s
      )
      SELECT * EXCEPT(h3s)
      FROM __h3, __h3.h3s AS h3;
    END;
    BEGIN
    DECLARE tempOutputTable STRING DEFAULT '`carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3`.' || REPLACE(GENERATE_UUID(), '-', '_');
    BEGIN
    CALL `carto-un-eu.carto`.CREATE_ISOLINES(
      'https://gcp-europe-west1.api.carto.com',
      'eyJhbGciOiJIUzI1NiJ9.eyJhIjoiYWNfdDg3Mm81M2YiLCJqdGkiOiI0YWI1NjU2MyJ9.4FGgabe5KvSsDwNc2FbUQv13eGFrFN3w828VXH1BT0s',
      'SELECT * FROM `carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.hospitales`',
      tempOutputTable,
      'geom',
      'car',
      300,
      'time',
      '{"polygons_filter":{"limit":1},"carto_keep_orig_geom":true}');
    EXECUTE IMMEDIATE '''
      CREATE TEMPORARY TABLE `WORKFLOW_6013105ac19a5b7f_fceaa5976fa1c6bc_result` AS
        SELECT *
        FROM ''' || tempOutputTable;
    END;
    END;
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_6013105ac19a5b7f_78cbfba00c14a127_result`
    AS
      SELECT
        *
      FROM `carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentes`
      WHERE num_expediente IN (
          SELECT DISTINCT num_expediente
          FROM `carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentalidad`
          WHERE lesividad_clasificada IN ('HERIDOS GRAVES', 'FALLECIDOS')
      );
    END;
    BEGIN
    DECLARE __destination STRING DEFAULT 'carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentes_graves';
    BEGIN
    EXECUTE IMMEDIATE
    REPLACE(
      '''DROP TABLE IF EXISTS `####`''',
      '####',
      __destination
    );
    EXECUTE IMMEDIATE
    REPLACE(
      '''CREATE TABLE IF NOT EXISTS `####`
      CLONE `WORKFLOW_6013105ac19a5b7f_78cbfba00c14a127_result`''',
      '####',
      __destination
    );
    END;
    END;
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_6013105ac19a5b7f_34cea44d00b66ec4_result`
    AS
      WITH __h3 AS
      (
        SELECT
          s.carto_isoline_metadata, s.nombre,
          `carto-un-eu.carto`.H3_POLYFILL_MODE(
              geom,
              9,
              'center'
            ) h3s
        FROM
          (
            SELECT *
            FROM `WORKFLOW_6013105ac19a5b7f_fceaa5976fa1c6bc_result`
            WHERE geom IS NOT NULL
          ) s
      )
      SELECT * EXCEPT(h3s)
      FROM __h3, __h3.h3s AS h3;
    END;
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_6013105ac19a5b7f_2f8e7b53114562a2_result`
    AS
      SELECT
      `carto-un-eu.carto`.H3_FROMGEOGPOINT(
          geom, 9
        ) h3, *
      FROM `WORKFLOW_6013105ac19a5b7f_78cbfba00c14a127_result`;
    END;
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_6013105ac19a5b7f_92b9704ada94d19d_result`
    AS
      WITH all_h3_times AS (
          SELECT h3, 300 as time FROM WORKFLOW_6013105ac19a5b7f_34cea44d00b66ec4_result 
          UNION ALL
          SELECT h3, 600 as time FROM WORKFLOW_6013105ac19a5b7f_b33b8dfaa4405160_result 
          UNION ALL
          SELECT h3, 900 as time FROM WORKFLOW_6013105ac19a5b7f_4a2f5a51713dc086_result 
      ),
      min_time_per_h3 AS (
          SELECT h3, MIN(time) as min_time
          FROM all_h3_times
          GROUP BY h3
      )
      SELECT
          h3,
          CASE
              WHEN min_time = 300 THEN '00-05 min'
              WHEN min_time = 600 THEN '05-10 min'
              WHEN min_time = 900 THEN '10-15 min'
          END as catchment_zone
      FROM min_time_per_h3;
    END;
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_6013105ac19a5b7f_3b39f4caf489bdca_result`
    AS
      SELECT h3, catchment_zone FROM `WORKFLOW_6013105ac19a5b7f_92b9704ada94d19d_result`
      UNION ALL
      SELECT h3, '15-30 min' as catchment_zone
      FROM `WORKFLOW_6013105ac19a5b7f_5c038c3d2df174c9_result`
      WHERE h3 NOT IN (SELECT h3 FROM `WORKFLOW_6013105ac19a5b7f_92b9704ada94d19d_result`)
      UNION ALL
      SELECT h3, '30-45 min' as catchment_zone
      FROM `WORKFLOW_6013105ac19a5b7f_e877e1c7e5f7f0dd_result`
      WHERE h3 NOT IN (SELECT h3 FROM `WORKFLOW_6013105ac19a5b7f_5c038c3d2df174c9_result`);
    END;
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_6013105ac19a5b7f_e598b255e21db7d7_result`
    AS
      WITH accidentes_simplificados AS (
          SELECT h3, num_expediente, tipo_accidente_clasificado FROM `WORKFLOW_6013105ac19a5b7f_f107384622ee8b2c_result`
      ),
      graves_simplificados AS (
          SELECT h3, num_expediente FROM `WORKFLOW_6013105ac19a5b7f_2f8e7b53114562a2_result`
      )
      SELECT
          a.h3, 
          a.catchment_zone,
          COALESCE(COUNT(DISTINCT s.num_expediente), 0) as volumen_total_accidentes,
          COALESCE(COUNT(DISTINCT g.num_expediente), 0) as severidad_alta,
          COALESCE(COUNT(DISTINCT CASE WHEN s.tipo_accidente_clasificado = 'Atropello a persona' THEN s.num_expediente END), 0) as riesgo_peatonal
      FROM `WORKFLOW_6013105ac19a5b7f_3b39f4caf489bdca_result` a  
      LEFT JOIN accidentes_simplificados s ON a.h3 = s.h3
      LEFT JOIN graves_simplificados g ON a.h3 = g.h3
      GROUP BY
          a.h3, a.catchment_zone;
    END;
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_6013105ac19a5b7f_82efa22fbfd9d5d3_result`
    AS
      SELECT
        `carto-un-eu.carto`.H3_BOUNDARY(
            h3
        ) h3_geo, *
      FROM `WORKFLOW_6013105ac19a5b7f_e598b255e21db7d7_result`;
    END;
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_6013105ac19a5b7f_44df15c22f3fbc08_result`
    AS
      WITH madrid_boundary AS (
          SELECT distritos_union AS boundary_geom FROM `carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.distritos_union` LIMIT 1
      )
      SELECT
          a.* EXCEPT(h3_geo),
          ST_INTERSECTION(a.h3_geo, b.boundary_geom) as geometry
      FROM `WORKFLOW_6013105ac19a5b7f_82efa22fbfd9d5d3_result` a, madrid_boundary b
      WHERE ST_INTERSECTS(a.h3_geo, b.boundary_geom);
    END;
    BEGIN
    DECLARE __destination STRING DEFAULT 'carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.perfil_riesgo_hospitales_madrid_por_hexagono';
    BEGIN
    EXECUTE IMMEDIATE
    REPLACE(
      '''DROP TABLE IF EXISTS `####`''',
      '####',
      __destination
    );
    EXECUTE IMMEDIATE
    REPLACE(
      '''CREATE TABLE IF NOT EXISTS `####`
      CLONE `WORKFLOW_6013105ac19a5b7f_44df15c22f3fbc08_result`''',
      '####',
      __destination
    );
    END;
    END;
    EXECUTE IMMEDIATE
    REPLACE(
      '''DROP TABLE IF EXISTS `##TABLENAME##`''',
      '##TABLENAME##',
      __outputtablefqn
    );
    EXECUTE IMMEDIATE
    REPLACE(
      '''CREATE OR REPLACE TABLE `##TABLENAME##`
      OPTIONS (
        expiration_timestamp = TIMESTAMP_ADD(
          CURRENT_TIMESTAMP(), INTERVAL 30 DAY
        )
      )
      AS
        SELECT 1 as dummy''',
      '##TABLENAME##',
      __outputtablefqn
    );
  END;
END;