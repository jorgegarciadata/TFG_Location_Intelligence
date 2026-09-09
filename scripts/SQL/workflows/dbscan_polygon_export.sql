CREATE OR REPLACE PROCEDURE
  `carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.wfproc_3cd3b513dc04af3c`(
)
BEGIN
  /*
   {"versionId":"a76dc1c799d87eb0","paramsId":"97d170e1550eee4a","isImmutable":false,"diagramJson":"{\"title\":\"DBSCAN\",\"description\":\"\",\"nodes\":[{\"id\":\"15182b2f-acea-48be-9e43-a16ede856d66\",\"data\":{\"id\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentes\",\"name\":\"ReadTable\",\"type\":\"table\",\"label\":\"accidentes\",\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentes\",\"description\":\"Read Table\"}]},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":224,\"y\":240},\"selected\":false},{\"id\":\"e8c2ef61-5a5e-4e32-a54d-4fb5657e98a9\",\"data\":{\"name\":\"native.clusterdbscan\",\"type\":\"generic\",\"label\":\"ST Cluster DBSCAN\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"geo\",\"type\":\"Column\",\"title\":\"Geo column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Geo column\",\"value\":\"geom\"},{\"name\":\"radius\",\"type\":\"Number\",\"title\":\"Search radius (m)\",\"min\":0,\"description\":\"Search radius (m)\",\"value\":15},{\"name\":\"min_geog\",\"type\":\"Number\",\"title\":\"Minimum number of geographies\",\"min\":0,\"description\":\"Minimum number of geographies\",\"value\":25}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":592,\"y\":272},\"selected\":false},{\"id\":\"bc1029fc-a6a6-474e-bfc6-6b52c5f57c16\",\"data\":{\"name\":\"native.saveastable\",\"type\":\"generic\",\"label\":\"Save as Table\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"destination\",\"type\":\"OutputTable\",\"title\":\"Table details\",\"placeholder\":\"Rename and select destination\",\"description\":\"Table details\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.dbscan_intersecciones_criticas\"},{\"name\":\"append\",\"type\":\"Boolean\",\"title\":\"Append to existing table\",\"default\":false,\"description\":\"Append to existing table\",\"value\":false},{\"name\":\"optimizationcol\",\"type\":\"Column\",\"title\":\"Cluster by\",\"parent\":\"source\",\"dataType\":[\"geography\",\"boolean\",\"number\",\"string\",\"date\",\"datetime\",\"time\",\"timestamp\"],\"providers\":[\"bigquery\"],\"optional\":true,\"advanced\":true,\"description\":\"Cluster by\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1312,\"y\":272},\"selected\":false},{\"id\":\"fc1a70d3-5f90-486b-9dde-c4ce8dd4d288\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"-- Este workflow convierte los puntos de cada clúster DBSCAN en un único polígono\\n-- y lo enriquece con métricas descriptivas del clúster.\\n\\nWITH\\n  -- Paso 1: Filtrar para quedarnos únicamente con los puntos que pertenecen a un clúster.\\n  clustered_points AS (\\n    SELECT\\n      *\\n    FROM\\n      `$b` -- Esto hace referencia a la tabla que conectaste al nodo\\n    WHERE\\n      cluster IS NOT NULL\\n      AND ST_GEOMETRYTYPE(geom) = 'ST_Point'\\n  ),\\n\\n  -- Paso 2: Agrupar por ID de clúster y realizar la agregación espacial y de atributos\\n  cluster_polygons AS (\\n    SELECT\\n      cluster,\\n      -- Métrica 1: Número total de accidentes en el clúster\\n      COUNT(*) AS num_accidentes,\\n      \\n      -- Métrica 2: Conteo de los tipos de accidente más comunes\\n      COUNTIF(tipo_accidente_clasificado = 'Colisión doble') AS count_colision_doble,\\n      COUNTIF(tipo_accidente_clasificado = 'Alcance') AS count_alcance,\\n      COUNTIF(tipo_accidente_clasificado = 'Atropello a persona') AS count_atropello,\\n      COUNTIF(tipo_accidente_clasificado = 'Choque contra obstáculo') AS count_obstaculo,\\n      \\n      -- Métrica 3: Conteo de los estados meteorológicos más relevantes\\n      COUNTIF(estado_meteorologico = 'Lluvia intensa') AS count_lluvia,\\n      COUNTIF(estado_meteorologico = 'Nublado') AS count_nublado,\\n      \\n      -- Geometría del clúster\\n      ST_CONVEXHULL(ST_UNION_AGG(geom)) AS geom\\n    FROM\\n      clustered_points\\n    GROUP BY\\n      cluster\\n    HAVING\\n      COUNT(*) > 2 -- Mantenemos el filtro para asegurar polígonos válidos\\n  )\\n\\n-- Paso final: Seleccionar el resultado para la salida\\nSELECT\\n  *\\nFROM\\n  cluster_polygons;\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":960,\"y\":256},\"selected\":false},{\"id\":\"2304a3ed-21aa-470c-8917-4c221db194fe\",\"data\":{\"name\":\"Note\",\"color\":\"#FE88B1\",\"genAi\":false,\"label\":\"\",\"width\":607.9979999999999,\"height\":191.992,\"inputs\":[],\"markdown\":\"---\\nlabel: Spatial Analysis - DBSCAN Critical Intersections\\n---\\n## ANÁLISIS DE PUNTOS NEGROS CON DBSCAN\\n\\nEste workflow identifica los puntos de mayor concentración de accidentes (puntos negros) utilizando el algoritmo DBSCAN con parámetros de alta exigencia. Posteriormente, convierte cada clúster de puntos en un polígono y lo enriquece con métricas de su perfil de siniestralidad.\",\"position\":{\"x\":175.987,\"y\":-224}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":176,\"y\":-224}},{\"id\":\"ebd413af-f961-4035-a742-442303a5231e\",\"data\":{\"name\":\"Note\",\"color\":\"#F6CF71\",\"genAi\":false,\"label\":\"\",\"width\":271.99600000000004,\"height\":383.99800000000005,\"inputs\":[],\"markdown\":\"---\\nlabel: Data Source\\n---\\n\\n### FUENTE DE DATOS\\n\\n*   **`accidentes`:** Tabla con los registros de accidentes únicos, que contiene la geometría puntual (`geom`) y las variables descriptivas (`tipo_accidente_clasificado`, `estado_meteorologico`).\\n\",\"position\":{\"x\":176,\"y\":-16}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":176,\"y\":-16}},{\"id\":\"dcdb670b-7797-444a-9712-cff3ccaf8f04\",\"data\":{\"name\":\"Note\",\"color\":\"#8BE0A4\",\"genAi\":false,\"label\":\"\",\"width\":319.992,\"height\":383.999,\"inputs\":[],\"markdown\":\"### 1. DETECCIÓN DE CLÚSTERES DE ALTA DENSIDAD\\n*   **Parámetros:**\\n    *   **Radio de Búsqueda (`Search radius (m)`):** 15 metros. Un radio pequeño para asegurar que solo se agrupen accidentes muy próximos.\\n    *   **Mínimo de Accidentes (`Minimum number of geographies`):** 25.s.\\n\",\"position\":{\"x\":464,\"y\":-16}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":464,\"y\":-16}},{\"id\":\"a2fcb781-5ce8-4b91-8857-2c345175bd2f\",\"data\":{\"name\":\"Note\",\"color\":\"#9EB9F3\",\"genAi\":false,\"label\":\"\",\"width\":255.995,\"height\":255.996,\"inputs\":[],\"markdown\":\"---\\nlabel: Data Sink\\n---\\n### SALIDA GUARDADA\\n\\n*   **`dbscan_cluster_polygons`:** Tabla final que contiene los polígonos de los clusters. \",\"position\":{\"x\":1200,\"y\":39.396}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":1200,\"y\":112}},{\"id\":\"04283a0e-8a4d-417d-bb97-2edb7f25181c\",\"data\":{\"name\":\"Note\",\"color\":\"#8BE0A4\",\"genAi\":false,\"label\":\"\",\"width\":383.992,\"height\":591.992,\"inputs\":[],\"markdown\":\"---\\n### 2. GENERACIÓN Y ENRIQUECIMIENTO DE POLÍGONOS DE CLÚSTER\\n\\nConvierte los grupos de puntos en polígonos y calcula sus métricas.\\n*   **Lógica:**\\n    1.  **Filtra** para quedarse solo con los puntos que pertenecen a un clúster (`cluster IS NOT NULL`).\\n    2.  **Agrupa** los puntos por su `cluster`.\\n    3.  Para cada grupo, **calcula métricas agregadas** (conteo total, conteo por tipo de accidente, conteo por clima).\\n    4.  Utiliza `ST_CONVEXHULL(ST_UNION_AGG(geom))` para **crear el polígono** de la envolvente convexa.\",\"position\":{\"x\":800,\"y\":-224.005}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":800,\"y\":-240}}],\"edges\":[{\"id\":\"2bbdf7be-f09c-4581-b213-48baa1cb3601\",\"type\":\"default\",\"source\":\"15182b2f-acea-48be-9e43-a16ede856d66\",\"target\":\"e8c2ef61-5a5e-4e32-a54d-4fb5657e98a9\",\"sourceHandle\":\"out\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"e8c2ef61-5a5e-4e32-a54d-4fb5657e98a9result-fc1a70d3-5f90-486b-9dde-c4ce8dd4d288sourceb\",\"source\":\"e8c2ef61-5a5e-4e32-a54d-4fb5657e98a9\",\"target\":\"fc1a70d3-5f90-486b-9dde-c4ce8dd4d288\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourceb\",\"animated\":false},{\"id\":\"f47c2601-dc83-4a2e-a0fd-3e01f2a59bd0\",\"type\":\"default\",\"source\":\"fc1a70d3-5f90-486b-9dde-c4ce8dd4d288\",\"target\":\"bc1029fc-a6a6-474e-bfc6-6b52c5f57c16\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false}],\"variables\":null,\"procedure\":{},\"schedule\":{},\"viewport\":{\"x\":-98.10630390142796,\"y\":247.2214703110066,\"zoom\":0.7386363636363639},\"schemaVersion\":\"1.0.0\",\"connectionProvider\":\"bigquery\",\"useCache\":false}"}
  */
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_3cd3b513dc04af3c_55c1b3f7d4d377f6_result`
  AS
    SELECT *,
      ST_CLUSTERDBSCAN(
        geom,
        15,
        25
      )
      OVER () AS cluster
    FROM `carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentes`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_3cd3b513dc04af3c_b3ace2a95a398f1d_result`
  AS
    WITH
      clustered_points AS (
        SELECT
          *
        FROM
          `WORKFLOW_3cd3b513dc04af3c_55c1b3f7d4d377f6_result` 
        WHERE
          cluster IS NOT NULL
          AND ST_GEOMETRYTYPE(geom) = 'ST_Point'
      ),
      cluster_polygons AS (
        SELECT
          cluster,
          COUNT(*) AS num_accidentes,
          COUNTIF(tipo_accidente_clasificado = 'Colisión doble') AS count_colision_doble,
          COUNTIF(tipo_accidente_clasificado = 'Alcance') AS count_alcance,
          COUNTIF(tipo_accidente_clasificado = 'Atropello a persona') AS count_atropello,
          COUNTIF(tipo_accidente_clasificado = 'Choque contra obstáculo') AS count_obstaculo,
          COUNTIF(estado_meteorologico = 'Lluvia intensa') AS count_lluvia,
          COUNTIF(estado_meteorologico = 'Nublado') AS count_nublado,
          ST_CONVEXHULL(ST_UNION_AGG(geom)) AS geom
        FROM
          clustered_points
        GROUP BY
          cluster
        HAVING
          COUNT(*) > 2 
      )
    SELECT
      *
    FROM
      cluster_polygons;
  END;
  BEGIN
  DECLARE __destination STRING DEFAULT 'carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.dbscan_intersecciones_criticas';
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
    CLONE `WORKFLOW_3cd3b513dc04af3c_b3ace2a95a398f1d_result`''',
    '####',
    __destination
  );
  END;
  END;
END;