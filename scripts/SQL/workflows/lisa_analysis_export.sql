-- WARNING: This procedure requires the Analytics Toolbox and assumes it will be located
-- at the following path: carto-un-eu.carto. If you want to deploy and
-- run it in a different location, you will need to update the code accordingly.
CREATE OR REPLACE PROCEDURE
  `carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.wfproc_595e93c05637805c`(
)
BEGIN
  /*
   {"versionId":"f199830a9b206820","paramsId":"97d170e1550eee4a","isImmutable":false,"diagramJson":"{\"title\":\"Getis Ord vs Local Morans I \",\"description\":\"\",\"nodes\":[{\"id\":\"226661be-8dc6-49bd-beff-430c00a001de\",\"data\":{\"id\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentes\",\"name\":\"ReadTable\",\"type\":\"table\",\"label\":\"accidentes\",\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentes\",\"description\":\"Read Table\"}]},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":96,\"y\":192},\"selected\":false},{\"id\":\"c8155fac-2fc1-4136-85cd-5582e68e7b46\",\"data\":{\"name\":\"native.h3frompoint\",\"type\":\"generic\",\"label\":\"H3 from GeoPoint\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"pointscol\",\"type\":\"Column\",\"title\":\"Points column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Points column\",\"value\":\"geom\"},{\"name\":\"resolution\",\"type\":\"Number\",\"title\":\"Resolution\",\"min\":0,\"max\":15,\"default\":8,\"mode\":\"slider\",\"description\":\"Resolution\",\"value\":9}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":416,\"y\":192},\"selected\":false},{\"id\":\"4779dff1-8f20-473b-8871-b750c99b1822\",\"data\":{\"name\":\"native.groupby\",\"type\":\"generic\",\"label\":\"Group by\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"columns\",\"type\":\"SelectColumnAggregation\",\"title\":\"Aggregation\",\"parent\":\"source\",\"placeholder\":\"workflows.parameterForm.selectAField\",\"allowExpression\":false,\"description\":\"Aggregation\",\"value\":\"num_expediente,count\"},{\"name\":\"groupby\",\"type\":\"Column\",\"title\":\"Group by\",\"parent\":\"source\",\"mode\":\"multiple\",\"dataType\":[\"boolean\",\"number\",\"string\",\"date\",\"datetime\",\"time\",\"timestamp\"],\"noDefault\":true,\"maxSelectionsCount\":null,\"description\":\"Group by\",\"value\":[\"h3\"]}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":544,\"y\":192},\"selected\":false},{\"id\":\"486d99e7-0f45-47b1-85c0-9f6cf2155666\",\"data\":{\"name\":\"native.renamecolumn\",\"type\":\"generic\",\"label\":\"Rename Column\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"column\",\"type\":\"Column\",\"title\":\"Column to rename\",\"parent\":\"source\",\"dataType\":[\"boolean\",\"geography\",\"number\",\"string\"],\"description\":\"Column to rename\",\"value\":\"num_expediente_count\"},{\"name\":\"newname\",\"type\":\"String\",\"title\":\"New column name\",\"validation\":\"^[a-zA-Z_][a-zA-Z0-9_]*$\",\"allowExpressions\":false,\"description\":\"New column name\",\"value\":\"volumen_total_accidentes\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":672,\"y\":192},\"selected\":false},{\"id\":\"ccc3745b-59bd-4d56-9f70-7e3f34d57e00\",\"data\":{\"name\":\"native.getisord\",\"type\":\"generic\",\"label\":\"Getis Ord\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"indexcol\",\"type\":\"Column\",\"title\":\"Index column\",\"parent\":\"source\",\"dataType\":[\"string\",\"number\"],\"description\":\"Index column\",\"value\":\"h3\"},{\"name\":\"valuecol\",\"type\":\"Column\",\"title\":\"Value column\",\"parent\":\"source\",\"dataType\":[\"number\"],\"description\":\"Value column\",\"value\":\"volumen_total_accidentes\"},{\"name\":\"kernel\",\"type\":\"Selection\",\"title\":\"Kernel function for spatial weights\",\"options\":[\"uniform\",\"triangular\",\"quadratic\",\"quartic\",\"gaussian\"],\"providers\":[\"bigquery\",\"snowflake\"],\"description\":\"Kernel function for spatial weights\",\"value\":\"uniform\"},{\"name\":\"size\",\"type\":\"Number\",\"title\":\"Size\",\"default\":3,\"min\":1,\"max\":10,\"description\":\"Size\",\"value\":1}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":816,\"y\":192},\"selected\":false},{\"id\":\"1a448d71-b4f8-4695-9b50-9866bb559ebd\",\"data\":{\"name\":\"native.h3boundary\",\"type\":\"generic\",\"label\":\"H3 Boundary\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"h3col\",\"type\":\"Column\",\"title\":\"H3 column\",\"parent\":\"source\",\"placeholder\":\"h3\",\"dataType\":[\"string\"],\"description\":\"H3 column\",\"value\":\"index\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":944,\"y\":192},\"selected\":false},{\"id\":\"a6e9387f-5b6e-43a5-9d79-f5132dd67ce6\",\"data\":{\"name\":\"native.localmoransi\",\"type\":\"generic\",\"label\":\"Local Morans I\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"indexcol\",\"type\":\"Column\",\"title\":\"Index column\",\"parent\":\"source\",\"dataType\":[\"string\",\"number\"],\"description\":\"Index column\",\"value\":\"h3\"},{\"name\":\"valuecol\",\"type\":\"Column\",\"title\":\"Value column\",\"parent\":\"source\",\"dataType\":[\"number\"],\"description\":\"Value column\",\"value\":\"volumen_total_accidentes\"},{\"name\":\"size\",\"type\":\"Number\",\"title\":\"Size\",\"default\":3,\"min\":1,\"max\":10,\"description\":\"Size\",\"value\":1},{\"name\":\"decay\",\"type\":\"Selection\",\"title\":\"Decay function\",\"options\":[\"uniform\",\"inverse\",\"inverse_square\",\"exponential\"],\"description\":\"Decay function\",\"value\":\"uniform\"},{\"name\":\"permutations\",\"type\":\"Number\",\"title\":\"Permutations\",\"min\":1,\"max\":1000,\"default\":1,\"description\":\"Permutations\",\"value\":99}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":816,\"y\":320},\"selected\":false},{\"id\":\"1805ac68-67ef-4212-835f-1f0b1291817f\",\"data\":{\"name\":\"native.h3boundary\",\"type\":\"generic\",\"label\":\"H3 Boundary\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"h3col\",\"type\":\"Column\",\"title\":\"H3 column\",\"parent\":\"source\",\"placeholder\":\"h3\",\"dataType\":[\"string\"],\"description\":\"H3 column\",\"value\":\"index\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":944,\"y\":320},\"selected\":false},{\"id\":\"ee8e3462-2a48-4493-aa4b-1ba1e6d50264\",\"data\":{\"name\":\"native.saveastable\",\"type\":\"generic\",\"label\":\"Save as Table\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"destination\",\"type\":\"OutputTable\",\"title\":\"Table details\",\"placeholder\":\"Rename and select destination\",\"description\":\"Table details\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.Getis_Ord\"},{\"name\":\"append\",\"type\":\"Boolean\",\"title\":\"Append to existing table\",\"default\":false,\"description\":\"Append to existing table\",\"value\":false},{\"name\":\"optimizationcol\",\"type\":\"Column\",\"title\":\"Cluster by\",\"parent\":\"source\",\"dataType\":[\"geography\",\"boolean\",\"number\",\"string\",\"date\",\"datetime\",\"time\",\"timestamp\"],\"providers\":[\"bigquery\"],\"optional\":true,\"advanced\":true,\"description\":\"Cluster by\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1072,\"y\":192},\"selected\":false},{\"id\":\"0c420bca-2ad8-413c-8007-76892fd5f6fc\",\"data\":{\"name\":\"native.saveastable\",\"type\":\"generic\",\"label\":\"Save as Table\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"destination\",\"type\":\"OutputTable\",\"title\":\"Table details\",\"placeholder\":\"Rename and select destination\",\"description\":\"Table details\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.Local_Morans_I\"},{\"name\":\"append\",\"type\":\"Boolean\",\"title\":\"Append to existing table\",\"default\":false,\"description\":\"Append to existing table\",\"value\":false},{\"name\":\"optimizationcol\",\"type\":\"Column\",\"title\":\"Cluster by\",\"parent\":\"source\",\"dataType\":[\"geography\",\"boolean\",\"number\",\"string\",\"date\",\"datetime\",\"time\",\"timestamp\"],\"providers\":[\"bigquery\"],\"optional\":true,\"advanced\":true,\"description\":\"Cluster by\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1072,\"y\":320},\"selected\":false},{\"id\":\"00b45c6a-94aa-4ba8-8abd-ac7f3482e29e\",\"data\":{\"name\":\"Note\",\"color\":\"#FE88B1\",\"genAi\":false,\"label\":\"\",\"width\":735.9989999999999,\"height\":271.994,\"inputs\":[],\"markdown\":\"---\\nlabel: Spatial Statistics- Get Ord *  - Local Moran's I\\n---\\n## Análisis Comparativo de Patrones de Riesgo\\nEste workflow compara dos métodos estadísticos para una comprensión completa de las zonas de riesgo. La **rama superior (`Getis Ord`)** localiza 'Hotspots', mientras que la **rama inferior (`Local Morans I`)** identifica 'Clústeres' y 'Atípicos Espaciales'.\",\"position\":{\"x\":0,\"y\":-208}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":0,\"y\":-192}},{\"id\":\"980488d3-80e7-42e1-9fbc-25c7e5707130\",\"data\":{\"name\":\"Note\",\"color\":\"#F6CF71\",\"genAi\":false,\"label\":\"\",\"width\":368,\"height\":175.99,\"inputs\":[],\"markdown\":\"---\\nlabel: Data Source\\n---\\n**accidentes**: Cada fila respresenta un accidentes\",\"position\":{\"x\":-160,\"y\":112}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":0,\"y\":96}},{\"id\":\"a99a42d7-f9cf-45c7-b679-b2e18a1de415\",\"data\":{\"name\":\"Note\",\"color\":\"#8BE0A4\",\"genAi\":false,\"label\":\"\",\"width\":623.997,\"height\":623.9939999999999,\"inputs\":[],\"markdown\":\"## Ejecución de Métodos: Getis-Ord vs. Local Moran's I\\n**1. Rama Superior (Getis-Ord Gi\\\\*):**\\nIdentifica 'Hotspots' (concentraciones de riesgo) y 'Coldspots'. El resultado principal es el índice `gi`, que mide la intensidad de la concentración.\\n- **Parámetros:** `Kernel: uniform`, `Size: 1`\\n\\n**2. Rama Inferior (Local Moran's I):**\\nDetecta la estructura espacial, clasificando cada celda en la columna `quad` para encontrar 'Clústeres' (ej. High-High) y 'Atípicos' (ej. Low-High).\\n- **Parámetros:** `Decay function: uniform`, `Size: 1`, `Permutations: 99`\\n\\n\\n** Añadimos frontera** este truco es esencial hace que los H3 sean de tipo geography\\n\\n**Guardamos** las tablas\",\"position\":{\"x\":752,\"y\":-192}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":752,\"y\":-192}}],\"edges\":[{\"id\":\"2a6c3356-e594-476c-b89c-073df4db3e2a\",\"type\":\"default\",\"source\":\"226661be-8dc6-49bd-beff-430c00a001de\",\"target\":\"c8155fac-2fc1-4136-85cd-5582e68e7b46\",\"sourceHandle\":\"out\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"c8155fac-2fc1-4136-85cd-5582e68e7b46result-4779dff1-8f20-473b-8871-b750c99b1822source\",\"source\":\"c8155fac-2fc1-4136-85cd-5582e68e7b46\",\"target\":\"4779dff1-8f20-473b-8871-b750c99b1822\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"4779dff1-8f20-473b-8871-b750c99b1822result-486d99e7-0f45-47b1-85c0-9f6cf2155666source\",\"source\":\"4779dff1-8f20-473b-8871-b750c99b1822\",\"target\":\"486d99e7-0f45-47b1-85c0-9f6cf2155666\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"486d99e7-0f45-47b1-85c0-9f6cf2155666result-ccc3745b-59bd-4d56-9f70-7e3f34d57e00source\",\"source\":\"486d99e7-0f45-47b1-85c0-9f6cf2155666\",\"target\":\"ccc3745b-59bd-4d56-9f70-7e3f34d57e00\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"ccc3745b-59bd-4d56-9f70-7e3f34d57e00result-1a448d71-b4f8-4695-9b50-9866bb559ebdsource\",\"source\":\"ccc3745b-59bd-4d56-9f70-7e3f34d57e00\",\"target\":\"1a448d71-b4f8-4695-9b50-9866bb559ebd\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"a3334e1a-008b-4e34-ac6d-47f7297961c9\",\"type\":\"default\",\"source\":\"486d99e7-0f45-47b1-85c0-9f6cf2155666\",\"target\":\"a6e9387f-5b6e-43a5-9d79-f5132dd67ce6\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"abde8cbb-70db-4151-9daa-545adc91df02\",\"type\":\"default\",\"source\":\"a6e9387f-5b6e-43a5-9d79-f5132dd67ce6\",\"target\":\"1805ac68-67ef-4212-835f-1f0b1291817f\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"1a448d71-b4f8-4695-9b50-9866bb559ebdresult-ee8e3462-2a48-4493-aa4b-1ba1e6d50264source\",\"source\":\"1a448d71-b4f8-4695-9b50-9866bb559ebd\",\"target\":\"ee8e3462-2a48-4493-aa4b-1ba1e6d50264\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"1805ac68-67ef-4212-835f-1f0b1291817fresult-0c420bca-2ad8-413c-8007-76892fd5f6fcsource\",\"source\":\"1805ac68-67ef-4212-835f-1f0b1291817f\",\"target\":\"0c420bca-2ad8-413c-8007-76892fd5f6fc\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false}],\"variables\":null,\"procedure\":{},\"schedule\":{},\"viewport\":{\"x\":114.65257111949381,\"y\":248.37247644994798,\"zoom\":0.6265326023722106},\"schemaVersion\":\"1.0.0\",\"connectionProvider\":\"bigquery\",\"useCache\":false}"}
  */
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_595e93c05637805c_f107384622ee8b2c_result`
  AS
    SELECT
    `carto-un-eu.carto`.H3_FROMGEOGPOINT(
        geom, 9
      ) h3, *
    FROM `carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentes`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_595e93c05637805c_9e76f23a0ff67c1b_result`
  AS
    SELECT h3,
      COUNT(num_expediente) num_expediente_count
    FROM `WORKFLOW_595e93c05637805c_f107384622ee8b2c_result`
    GROUP BY h3;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_595e93c05637805c_1869bdbce36f85e3_result`
  AS
    SELECT * EXCEPT (num_expediente_count),
      num_expediente_count AS volumen_total_accidentes
    FROM `WORKFLOW_595e93c05637805c_9e76f23a0ff67c1b_result`;
  END;
  BEGIN
  DECLARE grid_type STRING;
  DECLARE grid_resolution INT64;
  CALL `carto-un-eu.carto`.__CHECK_GRID_INDEX_COLUMN(
      'SELECT * FROM `WORKFLOW_595e93c05637805c_1869bdbce36f85e3_result`',
      'h3',
      grid_type,
      grid_resolution
  );
  IF grid_type = 'quadbin' THEN
      CALL `carto-un-eu.carto`.GETIS_ORD_QUADBIN_TABLE(
          'SELECT * FROM `WORKFLOW_595e93c05637805c_1869bdbce36f85e3_result`',
          'carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.__temp_0533fef6_4079_4091_b34a_2fa8868e81d1',
          'h3',
          'volumen_total_accidentes',
          1,
          'uniform'
      );
  ELSEIF grid_type = 'h3' THEN
      CALL `carto-un-eu.carto`.GETIS_ORD_H3_TABLE(
          'SELECT * FROM `WORKFLOW_595e93c05637805c_1869bdbce36f85e3_result`',
          'carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.__temp_0533fef6_4079_4091_b34a_2fa8868e81d1',
          'h3',
          'volumen_total_accidentes',
          1,
          'uniform'
      );
  ELSE
      RAISE USING MESSAGE = 'Invalid spatial index column, please select a column that contains h3 or quadbin indexes.';
  END IF;
  CREATE TEMPORARY TABLE `WORKFLOW_595e93c05637805c_916fc587e0fe1950_result`
  AS
    SELECT * FROM `carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.__temp_0533fef6_4079_4091_b34a_2fa8868e81d1`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_595e93c05637805c_120108da04e39f04_result`
  AS
    SELECT
      `carto-un-eu.carto`.H3_BOUNDARY(
          index
      ) index_geo, *
    FROM `WORKFLOW_595e93c05637805c_916fc587e0fe1950_result`;
  END;
  BEGIN
  DECLARE __destination STRING DEFAULT 'carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.Getis_Ord';
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
    CLONE `WORKFLOW_595e93c05637805c_120108da04e39f04_result`''',
    '####',
    __destination
  );
  END;
  END;
  BEGIN
  DECLARE grid_type STRING;
  DECLARE grid_resolution INT64;
  CALL `carto-un-eu.carto`.__CHECK_GRID_INDEX_COLUMN(
    'SELECT * FROM `WORKFLOW_595e93c05637805c_1869bdbce36f85e3_result`',
    'h3',
    grid_type,
    grid_resolution
  );
  IF grid_type = 'quadbin' THEN
    CALL `carto-un-eu.carto`.LOCAL_MORANS_I_QUADBIN_TABLE(
      'WORKFLOW_595e93c05637805c_1869bdbce36f85e3_result',
      '`carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.__temp_917b1247_74c9_4204_88aa_9586f6d5c602`',
      'h3',
      'volumen_total_accidentes',
      1,
      'uniform',
      99
    );
  ELSEIF grid_type = 'h3' THEN
    CALL `carto-un-eu.carto`.LOCAL_MORANS_I_H3_TABLE(
      'WORKFLOW_595e93c05637805c_1869bdbce36f85e3_result',
      '`carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.__temp_917b1247_74c9_4204_88aa_9586f6d5c602`',
      'h3',
      'volumen_total_accidentes',
      1,
      'uniform',
      99
    );
  ELSE
    RAISE USING MESSAGE = 'Invalid spatial index column, please select a column that contains h3 or quadbin indexes.';
  END IF;
  CREATE TEMPORARY TABLE `WORKFLOW_595e93c05637805c_e1bb9a8419249eb8_result`
  AS
    SELECT * FROM `carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.__temp_917b1247_74c9_4204_88aa_9586f6d5c602`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_595e93c05637805c_006ab7e27c271a9f_result`
  AS
    SELECT
      `carto-un-eu.carto`.H3_BOUNDARY(
          index
      ) index_geo, *
    FROM `WORKFLOW_595e93c05637805c_e1bb9a8419249eb8_result`;
  END;
  BEGIN
  DECLARE __destination STRING DEFAULT 'carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.Local_Morans_I';
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
    CLONE `WORKFLOW_595e93c05637805c_006ab7e27c271a9f_result`''',
    '####',
    __destination
  );
  END;
  END;
END;