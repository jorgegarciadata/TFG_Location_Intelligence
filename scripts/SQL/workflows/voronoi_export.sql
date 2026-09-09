CREATE OR REPLACE PROCEDURE
  `carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.wfproc_b4e0f7e821e5c553`(
)
BEGIN
  /*
   {"versionId":"0de029df103a99bf","paramsId":"97d170e1550eee4a","isImmutable":true,"diagramJson":"{\"title\":\"VORONOI\",\"description\":\"\",\"nodes\":[{\"id\":\"2c2accaa-ca7a-4149-acce-56e8485ccb25\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"SELECT\\n    ST_Union(ARRAY_AGG(geom)) AS distritos_union\\nFROM `$b`\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":464,\"y\":240},\"selected\":false},{\"id\":\"bc587317-0b2a-47e8-8e59-0b11dbd2aee6\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"-- Este script calcula los polígonos de Voronoi extendidos al bounding box de Madrid\\n-- y asocia cada celda con el nombre del hospital que contiene.\\n-- Input $a: Tabla 'hospitales' (con 'nombre', geom)\\n-- Input $b: Tabla con 'distritos_union'\\n\\nWITH\\n    _hospital_data_for_join AS ( -- Datos de hospitales para el join final\\n        SELECT\\n            nombre,\\n            geom AS hospital_geom_for_join\\n        FROM `$a` -- $a es la tabla de hospitales\\n    ),\\n    _hospital_points_array AS ( -- Array de geometrías de hospitales para la función Voronoi\\n        SELECT ARRAY_AGG(geom) AS points_array\\n        FROM `$a`\\n    ),\\n    _madrid_boundary_polygon_cte AS ( -- Se obtiene el polígono del límite de Madrid desde la entrada $b\\n        SELECT distritos_union AS boundary_poly -- << CAMBIO REALIZADO AQUÍ\\n        FROM `$b`\\n        LIMIT 1\\n    ),\\n    _madrid_bbox_struct AS ( -- Se calcula el bounding box (caja delimitadora) del límite\\n        SELECT ST_BOUNDINGBOX(boundary_poly) AS bbox_struct\\n        FROM _madrid_boundary_polygon_cte\\n    ),\\n    _madrid_boundary_bbox_coords AS ( -- Se extraen las coordenadas del bounding box\\n        SELECT\\n            [\\n                bbox_struct.xmin,\\n                bbox_struct.ymin,\\n                bbox_struct.xmax,\\n                bbox_struct.ymax\\n            ] AS bbox_array\\n        FROM _madrid_bbox_struct\\n    ),\\n    _voronoi_tessellation_geoms AS ( -- Se generan los polígonos de Voronoi\\n        SELECT\\n            voronoi_cell AS voronoi_geom_raw\\n        FROM\\n            (SELECT\\n                `carto-un-eu.carto`.ST_VORONOIPOLYGONS(\\n                    (SELECT points_array FROM _hospital_points_array),\\n                    (SELECT bbox_array FROM _madrid_boundary_bbox_coords)\\n                ) AS voronoi_collection\\n            ),\\n            UNNEST(voronoi_collection) AS voronoi_cell\\n    )\\n-- Se une cada celda de Voronoi con el nombre del hospital que contiene\\nSELECT\\n    h_join.nombre, -- Nombre del hospital\\n    vg.voronoi_geom_raw AS voronoi_geom_extendido -- Celda de Voronoi extendida\\nFROM\\n    _voronoi_tessellation_geoms vg\\nJOIN\\n    _hospital_data_for_join h_join ON ST_CONTAINS(vg.voronoi_geom_raw, h_join.hospital_geom_for_join)\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":736,\"y\":144},\"selected\":false},{\"id\":\"6689b5b2-4c83-47d6-93c9-968dbfffc337\",\"data\":{\"name\":\"native.saveastable\",\"type\":\"generic\",\"label\":\"Save as Table\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"destination\",\"type\":\"OutputTable\",\"title\":\"Table details\",\"placeholder\":\"Rename and select destination\",\"description\":\"Table details\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.voronoi\"},{\"name\":\"append\",\"type\":\"Boolean\",\"title\":\"Append to existing table\",\"default\":false,\"description\":\"Append to existing table\",\"value\":false},{\"name\":\"optimizationcol\",\"type\":\"Column\",\"title\":\"Cluster by\",\"parent\":\"source\",\"dataType\":[\"geography\",\"boolean\",\"number\",\"string\",\"date\",\"datetime\",\"time\",\"timestamp\"],\"providers\":[\"bigquery\"],\"optional\":true,\"advanced\":true,\"description\":\"Cluster by\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1152,\"y\":464},\"selected\":false},{\"id\":\"595678c5-6ddb-41d4-a987-7ea19f6cdb6d\",\"data\":{\"name\":\"native.intersection\",\"type\":\"generic\",\"label\":\"ST Intersection\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"secondary\",\"type\":\"Table\",\"title\":\"Polygons table\",\"description\":\"Polygons table\"},{\"name\":\"geosource\",\"type\":\"Column\",\"title\":\"Geo column in source table\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Geo column in source table\",\"value\":\"voronoi_geom_extendido\"},{\"name\":\"geosecondary\",\"type\":\"Column\",\"title\":\"Geo column in polygons table\",\"parent\":\"secondary\",\"dataType\":[\"geography\"],\"description\":\"Geo column in polygons table\",\"value\":\"distritos_union\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":848,\"y\":208},\"selected\":false},{\"id\":\"788b8704-bf5c-48fa-87d4-7db50f28ffa0\",\"data\":{\"name\":\"native.saveastable\",\"type\":\"generic\",\"label\":\"Save as Table\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"destination\",\"type\":\"OutputTable\",\"title\":\"Table details\",\"placeholder\":\"Rename and select destination\",\"description\":\"Table details\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.distritos_union\"},{\"name\":\"append\",\"type\":\"Boolean\",\"title\":\"Append to existing table\",\"default\":false,\"description\":\"Append to existing table\",\"value\":false},{\"name\":\"optimizationcol\",\"type\":\"Column\",\"title\":\"Cluster by\",\"parent\":\"source\",\"dataType\":[\"geography\",\"boolean\",\"number\",\"string\",\"date\",\"datetime\",\"time\",\"timestamp\"],\"providers\":[\"bigquery\"],\"optional\":true,\"advanced\":true,\"description\":\"Cluster by\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":912,\"y\":464},\"selected\":false},{\"id\":\"e2c37fa1-fb48-4f55-84a2-fd7c25ef90d6\",\"data\":{\"name\":\"Note\",\"color\":\"#FE88B1\",\"genAi\":false,\"label\":\"\",\"width\":800,\"height\":207.996,\"inputs\":[],\"markdown\":\"---\\nlabel: Spatial Analysis - Voronoi\\n---\\n## ANÁLISIS DE ÁREAS DE SERVICIO CON VORONOI EN MADRID\\n\\nEste workflow genera polígonos de Voronoi a partir de las ubicaciones de hospitales para determinar sus áreas de influencia dentro de los límites de la ciudad de Madrid. Las celdas resultantes se ajustan al contorno geográfico exacto de Madrid.\",\"position\":{\"x\":-96,\"y\":-304}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":-96,\"y\":-304},\"selected\":false},{\"id\":\"6b7c4310-cb8e-4a87-9bda-8c783ba3b1d9\",\"data\":{\"name\":\"Note\",\"color\":\"#F6CF71\",\"genAi\":false,\"label\":\"\",\"width\":351.995,\"height\":415.992,\"inputs\":[],\"markdown\":\"---\\nlabel: Data Sources\\n---\\n## FUENTES DE DATOS\\n\\n*   **`hospitales`:** Tabla con las ubicaciones (puntos) de los hospitales. Actúan como los \\\"semilleros\\\" del diagrama.\\n*   **`distritos`:** Tabla con los polígonos de los distritos de Madrid. Se usarán para crear el límite de la ciudad.\",\"position\":{\"x\":-96.008,\"y\":-80}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":-96,\"y\":-80},\"selected\":false},{\"id\":\"03de8636-daf4-4e71-a7ff-1269d93bc575\",\"data\":{\"name\":\"Note\",\"color\":\"#8BE0A4\",\"genAi\":false,\"label\":\"\",\"width\":431.9939999999999,\"height\":415.994,\"inputs\":[],\"markdown\":\"\\n## 1. CREAR LÍMITE DE MADRID\\n\\nUnifica todos los polígonos de la tabla `distritos` para formar un único polígono. El propósito de este paso es obtener la **frontera** o límite geográfico exacto de Madrid, que se usará posteriormente para recortar los diagramas de Voronoi.\\n\\n*   **Función SQL:** `ST_Union(ARRAY_AGG(geom))`\\n*   **Salida:** Una columna llamada `distritos_union` con la geometría del límite.\",\"position\":{\"x\":272,\"y\":-128}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":272,\"y\":-80},\"selected\":false},{\"id\":\"3cb3fa83-a8e0-462b-bc82-d434f379f211\",\"data\":{\"name\":\"Note\",\"color\":\"#8BE0A4\",\"genAi\":false,\"label\":\"\",\"width\":527.997,\"height\":639.9989999999999,\"inputs\":[],\"markdown\":\"\\n## 2. GENERAR Y AJUSTAR VORONOI\\n\\nEste proceso se realiza en varios pasos encadenados:\\n\\n1.  **Custom SQL:** Se calculan las celdas de Voronoi para los `hospitales`. Para asegurar una cobertura completa, la teselación se genera dentro del *bounding box* (caja delimitadora) del polígono `distritos_union` usando `ST_VORONOIPOLYGONS`.\\n\\n2.  **ST Intersection:** Las celdas generadas se recortan con la forma exacta del polígono `distritos_union` usando la función `ST_Intersection`.\\n\\n3.  **Drop & Rename Columns:** Se eliminan las columnas geométricas intermedias (`voronoi_geom_extendido`, `distritos_union_secondary`) y se renombra la geometría final a `voronoi_distritos_cell` para mayor claridad.\\n\",\"position\":{\"x\":896,\"y\":-304}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":720,\"y\":-304},\"selected\":false},{\"id\":\"aa462119-ef6c-4306-8b08-3c26da060b5d\",\"data\":{\"name\":\"Note\",\"color\":\"#9EB9F3\",\"genAi\":false,\"label\":\"\",\"width\":1152,\"height\":271.993,\"inputs\":[],\"markdown\":\"---\\nlabel: Data Sinks\\n---\\n## SALIDAS GUARDADAS\\n\\nEl workflow almacena dos tablas finales para su uso y visualización:\\n\\n*   **`distritos_union`:** Tabla que contiene el polígono único con el límite geográfico de Madrid.\\n*   **`voronoi`:** Tabla final que contiene las celdas de Voronoi ajustadas (columna `voronoi_distritos_cell`), cada una asociada a su respectivo hospital.\",\"position\":{\"x\":96,\"y\":352}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":96,\"y\":352},\"selected\":false},{\"id\":\"d07d77d1-28e7-48d8-baf0-4837ff2e02a3\",\"data\":{\"name\":\"native.dropcolumn\",\"type\":\"generic\",\"label\":\"Drop Columns\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"column\",\"type\":\"Column\",\"title\":\"Columns to drop\",\"parent\":\"source\",\"mode\":\"multiple\",\"noDefault\":true,\"description\":\"Columns to drop\",\"value\":[\"voronoi_geom_extendido\",\"distritos_union_secondary\"]}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":944,\"y\":208},\"selected\":false},{\"id\":\"ba7c3b87-aec8-4857-bf17-ffe6b325fd37\",\"data\":{\"name\":\"native.renamecolumn\",\"type\":\"generic\",\"label\":\"Rename Column\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"column\",\"type\":\"Column\",\"title\":\"Column to rename\",\"parent\":\"source\",\"dataType\":[\"boolean\",\"geography\",\"number\",\"string\"],\"description\":\"Column to rename\",\"value\":\"intersection_voronoi_geom_extendido_distritos_union\"},{\"name\":\"newname\",\"type\":\"String\",\"title\":\"New column name\",\"validation\":\"^[a-zA-Z_][a-zA-Z0-9_]*$\",\"allowExpressions\":false,\"description\":\"New column name\",\"value\":\"voronoi_distritos_cell\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1040,\"y\":208},\"selected\":false},{\"id\":\"f9efdce2-d34a-42dc-9939-bd394505b715\",\"data\":{\"id\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.hospitales\",\"name\":\"ReadTable\",\"type\":\"table\",\"label\":\"hospitales\",\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.hospitales\",\"description\":\"Read Table\"}]},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":-16,\"y\":160},\"selected\":false},{\"id\":\"f0ba6d0b-0fc8-424d-a055-8cac86384a5a\",\"data\":{\"id\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.distritos\",\"name\":\"ReadTable\",\"type\":\"table\",\"label\":\"distritos\",\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.distritos\",\"description\":\"Read Table\"}]},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":-16,\"y\":240},\"selected\":false}],\"edges\":[{\"id\":\"b25541a9-e043-4c2d-b550-d43ec93793ca\",\"type\":\"default\",\"source\":\"2c2accaa-ca7a-4149-acce-56e8485ccb25\",\"target\":\"bc587317-0b2a-47e8-8e59-0b11dbd2aee6\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourceb\",\"animated\":false},{\"id\":\"20b813dc-673a-433a-97f7-871887ec2da8\",\"type\":\"default\",\"source\":\"bc587317-0b2a-47e8-8e59-0b11dbd2aee6\",\"target\":\"595678c5-6ddb-41d4-a987-7ea19f6cdb6d\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"59c0b86f-4edb-45c8-bd3d-46aed7796b1e\",\"type\":\"default\",\"source\":\"2c2accaa-ca7a-4149-acce-56e8485ccb25\",\"target\":\"595678c5-6ddb-41d4-a987-7ea19f6cdb6d\",\"sourceHandle\":\"result\",\"targetHandle\":\"secondary\",\"animated\":false},{\"id\":\"2c2accaa-ca7a-4149-acce-56e8485ccb25result-788b8704-bf5c-48fa-87d4-7db50f28ffa0source\",\"source\":\"2c2accaa-ca7a-4149-acce-56e8485ccb25\",\"target\":\"788b8704-bf5c-48fa-87d4-7db50f28ffa0\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"d07d77d1-28e7-48d8-baf0-4837ff2e02a3result-ba7c3b87-aec8-4857-bf17-ffe6b325fd37source\",\"source\":\"d07d77d1-28e7-48d8-baf0-4837ff2e02a3\",\"target\":\"ba7c3b87-aec8-4857-bf17-ffe6b325fd37\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"01a23f49-fa8f-496b-8397-1eff6b78bed7\",\"type\":\"default\",\"source\":\"ba7c3b87-aec8-4857-bf17-ffe6b325fd37\",\"target\":\"6689b5b2-4c83-47d6-93c9-968dbfffc337\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"0426bc3b-52af-4e72-b588-45a8ac468efd\",\"type\":\"default\",\"source\":\"595678c5-6ddb-41d4-a987-7ea19f6cdb6d\",\"target\":\"d07d77d1-28e7-48d8-baf0-4837ff2e02a3\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"c00bc238-420b-435d-85fd-9a6729dae478\",\"type\":\"default\",\"source\":\"f9efdce2-d34a-42dc-9939-bd394505b715\",\"target\":\"bc587317-0b2a-47e8-8e59-0b11dbd2aee6\",\"sourceHandle\":\"out\",\"targetHandle\":\"sourcea\",\"animated\":false},{\"id\":\"2a62a13a-e907-448d-b64e-b253d905cbcb\",\"type\":\"default\",\"source\":\"f0ba6d0b-0fc8-424d-a055-8cac86384a5a\",\"target\":\"2c2accaa-ca7a-4149-acce-56e8485ccb25\",\"sourceHandle\":\"out\",\"targetHandle\":\"sourceb\",\"animated\":false}],\"variables\":null,\"procedure\":{},\"schedule\":{},\"viewport\":{\"x\":505.15599380206527,\"y\":280.0276959940148,\"zoom\":0.42128916366407276},\"schemaVersion\":\"1.0.0\",\"connectionProvider\":\"bigquery\",\"useCache\":true}"}
  */
  DECLARE __outputtable STRING;
  DECLARE __outputtablefqn STRING;
  SET __outputtable = 'wfproc_b4e0f7e821e5c553_out_' || SUBSTRING(TO_HEX(MD5('')), 1, 16);
  SET __outputtablefqn = 'carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.wfproc_b4e0f7e821e5c553_out_' || SUBSTRING(TO_HEX(MD5('')), 1, 16);
  BEGIN
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_b4e0f7e821e5c553_e6e2dfef8ede4136_result`
    AS
      SELECT
          ST_Union(ARRAY_AGG(geom)) AS distritos_union
      FROM `carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.distritos`;
    END;
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_b4e0f7e821e5c553_baaafcd2fbb55f4f_result`
    AS
      WITH
          _hospital_data_for_join AS ( 
              SELECT
                  nombre,
                  geom AS hospital_geom_for_join
              FROM `carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.hospitales` 
          ),
          _hospital_points_array AS ( 
              SELECT ARRAY_AGG(geom) AS points_array
              FROM `carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.hospitales`
          ),
          _madrid_boundary_polygon_cte AS ( 
              SELECT distritos_union AS boundary_poly 
              FROM `WORKFLOW_b4e0f7e821e5c553_e6e2dfef8ede4136_result`
              LIMIT 1
          ),
          _madrid_bbox_struct AS ( 
              SELECT ST_BOUNDINGBOX(boundary_poly) AS bbox_struct
              FROM _madrid_boundary_polygon_cte
          ),
          _madrid_boundary_bbox_coords AS ( 
              SELECT
                  [
                      bbox_struct.xmin,
                      bbox_struct.ymin,
                      bbox_struct.xmax,
                      bbox_struct.ymax
                  ] AS bbox_array
              FROM _madrid_bbox_struct
          ),
          _voronoi_tessellation_geoms AS ( 
              SELECT
                  voronoi_cell AS voronoi_geom_raw
              FROM
                  (SELECT
                      `carto-un-eu.carto`.ST_VORONOIPOLYGONS(
                          (SELECT points_array FROM _hospital_points_array),
                          (SELECT bbox_array FROM _madrid_boundary_bbox_coords)
                      ) AS voronoi_collection
                  ),
                  UNNEST(voronoi_collection) AS voronoi_cell
          )
      SELECT
          h_join.nombre, 
          vg.voronoi_geom_raw AS voronoi_geom_extendido 
      FROM
          _voronoi_tessellation_geoms vg
      JOIN
          _hospital_data_for_join h_join ON ST_CONTAINS(vg.voronoi_geom_raw, h_join.hospital_geom_for_join);
    END;
    BEGIN
    DECLARE alias STRING;
    CREATE TABLE `carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.table_646cc02c_c011_4d3b_ad05_d7c5e7d00463` AS
    SELECT * FROM `WORKFLOW_b4e0f7e821e5c553_e6e2dfef8ede4136_result`
    WHERE 1=0;
    EXECUTE IMMEDIATE
    '''
      with __alias AS(
        SELECT CONCAT(
          'b.', column_name, ' AS ', column_name, '_secondary'
        ) col_alias
        FROM `carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3`.INFORMATION_SCHEMA.COLUMNS
      WHERE table_name = 'table_646cc02c_c011_4d3b_ad05_d7c5e7d00463'
      )
      SELECT STRING_AGG(col_alias, ', ')
      FROM __alias
    '''
    INTO alias;
    DROP TABLE `carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.table_646cc02c_c011_4d3b_ad05_d7c5e7d00463`;
    EXECUTE IMMEDIATE
    REPLACE(
      '''CREATE TEMPORARY TABLE `WORKFLOW_b4e0f7e821e5c553_9cf51dfd9a45c069_result`
      AS
        SELECT
          ST_INTERSECTION(
            b.distritos_union,
            a.voronoi_geom_extendido
          )
        AS intersection_voronoi_geom_extendido_distritos_union,
          a.*, %s
        FROM `WORKFLOW_b4e0f7e821e5c553_baaafcd2fbb55f4f_result` AS a
        JOIN `WORKFLOW_b4e0f7e821e5c553_e6e2dfef8ede4136_result` AS b
        ON ST_INTERSECTS(
          b.distritos_union,
          a.voronoi_geom_extendido
        )''',
      '%s',
      alias
    );
    END;
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_b4e0f7e821e5c553_99337b37ba6f29c7_result`
    AS
      SELECT * EXCEPT (voronoi_geom_extendido, distritos_union_secondary)
      FROM `WORKFLOW_b4e0f7e821e5c553_9cf51dfd9a45c069_result`;
    END;
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_b4e0f7e821e5c553_2c4b4affdaad7116_result`
    AS
      SELECT * EXCEPT (intersection_voronoi_geom_extendido_distritos_union),
        intersection_voronoi_geom_extendido_distritos_union AS voronoi_distritos_cell
      FROM `WORKFLOW_b4e0f7e821e5c553_99337b37ba6f29c7_result`;
    END;
    BEGIN
    DECLARE __destination STRING DEFAULT 'carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.voronoi';
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
      CLONE `WORKFLOW_b4e0f7e821e5c553_2c4b4affdaad7116_result`''',
      '####',
      __destination
    );
    END;
    END;
    BEGIN
    DECLARE __destination STRING DEFAULT 'carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.distritos_union';
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
      CLONE `WORKFLOW_b4e0f7e821e5c553_e6e2dfef8ede4136_result`''',
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