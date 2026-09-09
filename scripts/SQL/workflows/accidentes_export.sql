-- WARNING: This procedure requires the Analytics Toolbox and assumes it will be located
-- at the following path: carto-un-eu.carto. If you want to deploy and
-- run it in a different location, you will need to update the code accordingly.
CREATE OR REPLACE PROCEDURE
  `carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.wfproc_8cb51442ff57d51e`(
)
BEGIN
  /*
   {"versionId":"8858c9fea91dfab7","paramsId":"97d170e1550eee4a","isImmutable":false,"diagramJson":"{\"title\":\"ACCIDENTES\",\"description\":\"\",\"nodes\":[{\"id\":\"3a1d1c84-8dd3-49d6-b37a-8e3c9ac84f5c\",\"data\":{\"name\":\"native.intersection\",\"type\":\"generic\",\"label\":\"ST Intersection\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"secondary\",\"type\":\"Table\",\"title\":\"Polygons table\",\"description\":\"Polygons table\"},{\"name\":\"geosource\",\"type\":\"Column\",\"title\":\"Geo column in source table\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Geo column in source table\",\"value\":\"geom\"},{\"name\":\"geosecondary\",\"type\":\"Column\",\"title\":\"Geo column in polygons table\",\"parent\":\"secondary\",\"dataType\":[\"geography\"],\"description\":\"Geo column in polygons table\",\"value\":\"geom\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":544,\"y\":304},\"selected\":false},{\"id\":\"6a5304bd-f1e0-4ea7-9492-5416b8e62dae\",\"data\":{\"name\":\"native.dropcolumn\",\"type\":\"generic\",\"label\":\"Drop Columns\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"column\",\"type\":\"Column\",\"title\":\"Columns to drop\",\"parent\":\"source\",\"mode\":\"multiple\",\"noDefault\":true,\"description\":\"Columns to drop\",\"value\":[\"intersection_geom_geom\",\"geom_secondary\"]}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":656,\"y\":304},\"selected\":false},{\"id\":\"e6e4bf59-c328-4149-a4f8-7833c3e6c1a0\",\"data\":{\"name\":\"native.saveastable\",\"type\":\"generic\",\"label\":\"Save as Table\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"destination\",\"type\":\"OutputTable\",\"title\":\"Table details\",\"placeholder\":\"Rename and select destination\",\"description\":\"Table details\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentalidad\"},{\"name\":\"append\",\"type\":\"Boolean\",\"title\":\"Append to existing table\",\"default\":false,\"description\":\"Append to existing table\",\"value\":false},{\"name\":\"optimizationcol\",\"type\":\"Column\",\"title\":\"Cluster by\",\"parent\":\"source\",\"dataType\":[\"geography\",\"boolean\",\"number\",\"string\",\"date\",\"datetime\",\"time\",\"timestamp\"],\"providers\":[\"bigquery\"],\"optional\":true,\"advanced\":true,\"description\":\"Cluster by\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":928,\"y\":512},\"selected\":false},{\"id\":\"f2d26391-f3c4-413d-ba89-8c4c652023cd\",\"data\":{\"name\":\"native.dropcolumn\",\"type\":\"generic\",\"label\":\"Drop Columns\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"column\",\"type\":\"Column\",\"title\":\"Columns to drop\",\"parent\":\"source\",\"mode\":\"multiple\",\"noDefault\":true,\"description\":\"Columns to drop\",\"value\":[\"tipo_vehiculo_clasificado\",\"tipo_persona\",\"rango_edad\",\"sexo\",\"lesividad_clasificada\",\"positiva_alcohol\",\"positiva_droga\"]}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":992,\"y\":336},\"selected\":false},{\"id\":\"edb63c9b-7c59-4de0-bebe-b4cf11b7302f\",\"data\":{\"name\":\"native.removeduplicatedrows\",\"type\":\"generic\",\"label\":\"Remove Duplicated\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1136,\"y\":336},\"selected\":false},{\"id\":\"26a19292-8422-4aa3-b8a4-65c17980032e\",\"data\":{\"name\":\"native.saveastable\",\"type\":\"generic\",\"label\":\"Save as Table\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"destination\",\"type\":\"OutputTable\",\"title\":\"Table details\",\"placeholder\":\"Rename and select destination\",\"description\":\"Table details\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentes\"},{\"name\":\"append\",\"type\":\"Boolean\",\"title\":\"Append to existing table\",\"default\":false,\"description\":\"Append to existing table\",\"value\":false},{\"name\":\"optimizationcol\",\"type\":\"Column\",\"title\":\"Cluster by\",\"parent\":\"source\",\"dataType\":[\"geography\",\"boolean\",\"number\",\"string\",\"date\",\"datetime\",\"time\",\"timestamp\"],\"providers\":[\"bigquery\"],\"optional\":true,\"advanced\":true,\"description\":\"Cluster by\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1248,\"y\":512},\"selected\":false},{\"id\":\"5eb7e347-2258-4de9-b574-e38af9889272\",\"data\":{\"name\":\"native.sample\",\"type\":\"generic\",\"label\":\"Sample\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"nrows\",\"type\":\"Number\",\"title\":\"Number of rows to sample\",\"min\":1,\"description\":\"Number of rows to sample\",\"value\":1000}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1344,\"y\":336},\"selected\":false},{\"id\":\"539d66b4-84d5-414b-b2e3-6c9d08845f71\",\"data\":{\"name\":\"native.saveastable\",\"type\":\"generic\",\"label\":\"Save as Table\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"destination\",\"type\":\"OutputTable\",\"title\":\"Table details\",\"placeholder\":\"Rename and select destination\",\"description\":\"Table details\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentes_sample\"},{\"name\":\"append\",\"type\":\"Boolean\",\"title\":\"Append to existing table\",\"default\":false,\"description\":\"Append to existing table\",\"value\":false},{\"name\":\"optimizationcol\",\"type\":\"Column\",\"title\":\"Cluster by\",\"parent\":\"source\",\"dataType\":[\"geography\",\"boolean\",\"number\",\"string\",\"date\",\"datetime\",\"time\",\"timestamp\"],\"providers\":[\"bigquery\"],\"optional\":true,\"advanced\":true,\"description\":\"Cluster by\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1456,\"y\":512},\"selected\":false},{\"id\":\"381809b0-69c7-482d-a01c-64f7f29cae7c\",\"data\":{\"name\":\"native.join\",\"type\":\"generic\",\"label\":\"Join\",\"inputs\":[{\"name\":\"maintable\",\"type\":\"Table\",\"title\":\"Main table\",\"description\":\"Main table\"},{\"name\":\"secondarytable\",\"type\":\"Table\",\"title\":\"Secondary table\",\"description\":\"Secondary table\"},{\"name\":\"maincolumn\",\"type\":\"Column\",\"title\":\"Column in main table\",\"parent\":\"maintable\",\"dataType\":[\"boolean\",\"date\",\"datetime\",\"time\",\"timestamp\",\"number\",\"string\"],\"description\":\"Column in main table\",\"value\":\"num_expediente\"},{\"name\":\"secondarycolumn\",\"type\":\"Column\",\"title\":\"Column in secondary table\",\"parent\":\"secondarytable\",\"dataType\":[\"boolean\",\"date\",\"datetime\",\"time\",\"timestamp\",\"number\",\"string\"],\"description\":\"Column in secondary table\",\"value\":\"num_expediente\"},{\"name\":\"jointype\",\"type\":\"Selection\",\"title\":\"Join type\",\"options\":[\"Inner\",\"Left\",\"Right\",\"Full outer\"],\"default\":\"Inner\",\"description\":\"Join type\",\"value\":\"Inner\"}],\"version\":\"1.2\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1488,\"y\":272},\"selected\":false},{\"id\":\"dd23a5b7-1138-4894-bbae-fa4f874703a0\",\"data\":{\"name\":\"native.dropcolumn\",\"type\":\"generic\",\"label\":\"Drop Columns\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"column\",\"type\":\"Column\",\"title\":\"Columns to drop\",\"parent\":\"source\",\"mode\":\"multiple\",\"noDefault\":true,\"description\":\"Columns to drop\",\"value\":[\"distrito_joined\",\"geom_joined\",\"num_expediente_joined\",\"fecha_joined\",\"tipo_accidente_clasificado_joined\",\"estado_meteorologico_joined\",\"anno_joined\",\"mes_joined\",\"dia_mes_joined\",\"dia_semana_joined\",\"horas_joined\",\"hora_rango_joined\"]}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1600,\"y\":272},\"selected\":false},{\"id\":\"5f459751-5e57-4c59-959c-c46c2421032a\",\"data\":{\"name\":\"native.renamecolumn\",\"type\":\"generic\",\"label\":\"Rename Column\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"column\",\"type\":\"Column\",\"title\":\"Column to rename\",\"parent\":\"source\",\"dataType\":[\"boolean\",\"geography\",\"number\",\"string\"],\"description\":\"Column to rename\",\"value\":\"distrito_secondary\"},{\"name\":\"newname\",\"type\":\"String\",\"title\":\"New column name\",\"validation\":\"^[a-zA-Z_][a-zA-Z0-9_]*$\",\"allowExpressions\":false,\"description\":\"New column name\",\"value\":\"distrito\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":784,\"y\":304},\"selected\":false},{\"id\":\"1a484935-a01d-41fc-9303-56988528b6c2\",\"data\":{\"name\":\"native.saveastable\",\"type\":\"generic\",\"label\":\"Save as Table\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"destination\",\"type\":\"OutputTable\",\"title\":\"Table details\",\"placeholder\":\"Rename and select destination\",\"description\":\"Table details\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentalidad_sample\"},{\"name\":\"append\",\"type\":\"Boolean\",\"title\":\"Append to existing table\",\"default\":false,\"description\":\"Append to existing table\",\"value\":false},{\"name\":\"optimizationcol\",\"type\":\"Column\",\"title\":\"Cluster by\",\"parent\":\"source\",\"dataType\":[\"geography\",\"boolean\",\"number\",\"string\",\"date\",\"datetime\",\"time\",\"timestamp\"],\"providers\":[\"bigquery\"],\"optional\":true,\"advanced\":true,\"description\":\"Cluster by\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1712,\"y\":512},\"selected\":false},{\"id\":\"61c13242-1eab-413e-b8bf-1307f8621b40\",\"data\":{\"name\":\"SaveToBucketAndNotify\",\"type\":\"generic\",\"label\":\"Send by Email\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"optional\":true,\"description\":\"Source table\"},{\"name\":\"email\",\"type\":\"Email\",\"title\":\"Email addresses\",\"description\":\"single email string or JSON-formatted array of email addresses\",\"placeholder\":\"E.g.: user@example.com or [\\\"user1@example.com\\\", \\\"user2@example.com\\\"]\",\"allowExpressions\":true,\"value\":\"[\\\"jorgekk22@gmail.com\\\"]\"},{\"name\":\"subject\",\"type\":\"String\",\"title\":\"Subject\",\"placeholder\":\"E.g.: CARTO Workflows result\",\"allowExpressions\":false,\"description\":\"Subject\",\"value\":\"accidentalidad\"},{\"name\":\"body\",\"type\":\"String\",\"mode\":\"multiline\",\"title\":\"Body\",\"optional\":true,\"default\":\"\",\"placeholder\":\"Hello, this is an example body for your email\",\"allowExpressions\":false,\"description\":\"Body\",\"value\":\"\"},{\"name\":\"include_data\",\"type\":\"Boolean\",\"title\":\"Include data\",\"default\":false,\"description\":\"Include data\",\"value\":true},{\"name\":\"format\",\"type\":\"Selection\",\"title\":\"File format\",\"default\":\"CSV\",\"options\":[\"CSV\",\"JSON\"],\"showIf\":[{\"value\":true,\"parameter\":\"include_data\"}],\"description\":\"File format\",\"value\":\"CSV\"},{\"name\":\"bucket\",\"type\":\"String\",\"title\":\"GCS Bucket name\",\"placeholder\":\"Bucket name\",\"optional\":true,\"showIf\":[{\"value\":true,\"parameter\":\"include_data\"}],\"description\":\"GCS Bucket name\"}],\"version\":\"2\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1040,\"y\":512},\"selected\":false},{\"id\":\"86c8e6c7-25fd-4fc5-b1e8-036fc1944e47\",\"data\":{\"name\":\"Note\",\"color\":\"#FE88B1\",\"genAi\":false,\"label\":\"\",\"width\":1600,\"height\":271.99100000000004,\"inputs\":[],\"markdown\":\"---\\nlabel: Spatial Analysis - Accidents\\n---\\n## ANÁLISIS Y PROCESAMIENTO DE DATOS DE ACCIDENTALIDAD\\n\\nEste workflow enriquece los datos de accidentalidad asignando a cada registro su distrito correspondiente. Posteriormente, genera una tabla limpia de accidentes únicos, crea una muestra de datos para análisis y finalmente exporta el conjunto de datos completo y notifica por correo electrónico.\",\"position\":{\"x\":208,\"y\":-352}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":208,\"y\":-352},\"selected\":false},{\"id\":\"03540a83-7761-4131-a2e8-eed70809959d\",\"data\":{\"name\":\"Note\",\"color\":\"#F6CF71\",\"genAi\":false,\"label\":\"\",\"width\":303.992,\"height\":495.99800000000005,\"inputs\":[],\"markdown\":\"---\\nlabel: Data Sources\\n---\\n## FUENTES DE DATOS\\n\\n*   **`accidentalidad_sin_distrito`**: Registros de accidentalidad con granularidad a nivel de persona implicada. Contiene múltiples filas por cada accidente si hay varias personas involucradas.\\n*   **`distritos`**: Polígonos geográficos de los distritos de Madrid, utilizados para el enriquecimiento espacial.\",\"position\":{\"x\":208,\"y\":-48.011}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":208,\"y\":-64},\"selected\":false},{\"id\":\"d12da286-b965-44df-a164-e8467183cbf4\",\"data\":{\"name\":\"Note\",\"color\":\"#8BE0A4\",\"genAi\":false,\"label\":\"\",\"width\":399.992,\"height\":495.99800000000005,\"inputs\":[],\"markdown\":\"---\\n## 1. ENRIQUECER ACCIDENTES CON DISTRITOS\\n\\nSe realiza una intersección espacial (`ST_Intersection`) entre los registros de `accidentalidad_sin_distrito` y los polígonos de `distritos`. Esta operación (un \\\"spatial join\\\") asigna a cada registro de accidente el nombre del distrito donde ocurrió geográficamente. El resultado se limpia y se guarda como la tabla `accidentalidad`.\",\"position\":{\"x\":528,\"y\":-64}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":528,\"y\":-64},\"selected\":false},{\"id\":\"edc3fa5e-ef32-4f2f-bc88-954b690a9285\",\"data\":{\"name\":\"Note\",\"color\":\"#8BE0A4\",\"genAi\":false,\"label\":\"\",\"width\":367.994,\"height\":495.999,\"inputs\":[],\"markdown\":\"---\\n## 2. CREAR TABLA DE ACCIDENTES ÚNICOS\\n\\nA partir de la tabla `accidentalidad` enriquecida, se cambia la granularidad de los datos de \\\"persona implicada\\\" a \\\"evento de accidente\\\". Para ello:\\n1.  Se eliminan las columnas relativas a las personas (`tipo_persona`, `lesividad`, etc.).\\n2.  Se eliminan las filas duplicadas (`Remove Duplicates`).\\nEl resultado es la tabla `accidentes`, donde cada fila representa un único evento de accidente.\",\"position\":{\"x\":944,\"y\":-64}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":944,\"y\":-64},\"selected\":false},{\"id\":\"58ea58df-f91b-40a2-a5bb-2cee9a197489\",\"data\":{\"name\":\"Note\",\"color\":\"#8BE0A4\",\"genAi\":false,\"label\":\"\",\"width\":479.99600000000004,\"height\":495.99600000000004,\"inputs\":[],\"markdown\":\"---\\n## 3. GENERAR MUESTRA DE DATOS DE ACCIDENTALIDAD\\n\\nSe crea una muestra de 1.000 accidentes para un análisis más manejable. El proceso es el siguiente:\\n1.  Se obtiene una muestra aleatoria (`Sample`) de 1.000 accidentes únicos de la tabla `accidentes`.\\n2.  Esta muestra se usa como filtro en un `Join` con la tabla `accidentalidad` original para recuperar todos los registros detallados (incluyendo todas las personas implicadas) que corresponden a esos 1.000 accidentes seleccionados.\",\"position\":{\"x\":1328,\"y\":-64}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":1328,\"y\":-64},\"selected\":false},{\"id\":\"144aa879-18b9-4f0a-b84f-54f8f621b63b\",\"data\":{\"name\":\"Note\",\"color\":\"#9EB9F3\",\"genAi\":false,\"label\":\"\",\"width\":1600,\"height\":255.988,\"inputs\":[],\"markdown\":\"---\\nlabel: Data Sinks\\n---\\n## SALIDAS GUARDADAS\\n\\n*   **`accidentalidad`**: Tabla principal con todos los registros de accidentalidad enriquecidos. **Esta tabla también se exporta a un fichero CSV y se envía una notificación por correo electrónico con el enlace de descarga.**\\n*   **`accidentes`**: Tabla limpia con una fila por cada accidente único, ideal para análisis a nivel de evento (ej. contar accidentes por día).\\n*   **`accidentalidad_sample`**: Muestra final que contiene todos los registros (incluyendo todas las personas) asociados a 1.000 accidentes seleccionados al azar.\",\"position\":{\"x\":208,\"y\":416}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":208,\"y\":448},\"selected\":false},{\"id\":\"2f74c966-db92-4bf9-9839-f17ea8cf5578\",\"data\":{\"id\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.distritos\",\"name\":\"ReadTable\",\"type\":\"table\",\"label\":\"distritos\",\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.distritos\",\"description\":\"Read Table\"}]},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":272,\"y\":352},\"selected\":false},{\"id\":\"3685f2b6-80e6-4a29-a9f0-ecef82132e43\",\"data\":{\"id\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentalidad_sin_distrito\",\"name\":\"ReadTable\",\"type\":\"table\",\"label\":\"accidentalidad_sin_distrito\",\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentalidad_sin_distrito\",\"description\":\"Read Table\"}]},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":272,\"y\":272},\"selected\":false}],\"edges\":[{\"id\":\"3a1d1c84-8dd3-49d6-b37a-8e3c9ac84f5cresult-6a5304bd-f1e0-4ea7-9492-5416b8e62daesource\",\"source\":\"3a1d1c84-8dd3-49d6-b37a-8e3c9ac84f5c\",\"target\":\"6a5304bd-f1e0-4ea7-9492-5416b8e62dae\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"f2d26391-f3c4-413d-ba89-8c4c652023cdresult-edb63c9b-7c59-4de0-bebe-b4cf11b7302fsource\",\"source\":\"f2d26391-f3c4-413d-ba89-8c4c652023cd\",\"target\":\"edb63c9b-7c59-4de0-bebe-b4cf11b7302f\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"edb63c9b-7c59-4de0-bebe-b4cf11b7302fresult-26a19292-8422-4aa3-b8a4-65c17980032esource\",\"source\":\"edb63c9b-7c59-4de0-bebe-b4cf11b7302f\",\"target\":\"26a19292-8422-4aa3-b8a4-65c17980032e\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"5bc5528c-938b-4fa6-a1fa-607dc2142759\",\"type\":\"default\",\"source\":\"5eb7e347-2258-4de9-b574-e38af9889272\",\"target\":\"539d66b4-84d5-414b-b2e3-6c9d08845f71\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"381809b0-69c7-482d-a01c-64f7f29cae7cresult-dd23a5b7-1138-4894-bbae-fa4f874703a0source\",\"source\":\"381809b0-69c7-482d-a01c-64f7f29cae7c\",\"target\":\"dd23a5b7-1138-4894-bbae-fa4f874703a0\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"2991a574-7a82-4baa-9ac9-93192e5eec53\",\"type\":\"default\",\"source\":\"6a5304bd-f1e0-4ea7-9492-5416b8e62dae\",\"target\":\"5f459751-5e57-4c59-959c-c46c2421032a\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"dd23a5b7-1138-4894-bbae-fa4f874703a0result-1a484935-a01d-41fc-9303-56988528b6c2source\",\"source\":\"dd23a5b7-1138-4894-bbae-fa4f874703a0\",\"target\":\"1a484935-a01d-41fc-9303-56988528b6c2\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"5124003b-475a-4cd2-9041-ebb3cc358fb3\",\"type\":\"default\",\"source\":\"5f459751-5e57-4c59-959c-c46c2421032a\",\"target\":\"e6e4bf59-c328-4149-a4f8-7833c3e6c1a0\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"83245f7a-8e62-4739-b737-9499ac761c42\",\"type\":\"default\",\"source\":\"5f459751-5e57-4c59-959c-c46c2421032a\",\"target\":\"f2d26391-f3c4-413d-ba89-8c4c652023cd\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"a297af26-b4fa-43da-ae1d-487a159b2364\",\"type\":\"default\",\"source\":\"5f459751-5e57-4c59-959c-c46c2421032a\",\"target\":\"381809b0-69c7-482d-a01c-64f7f29cae7c\",\"sourceHandle\":\"result\",\"targetHandle\":\"maintable\",\"animated\":false},{\"id\":\"ad6f080c-134c-4541-95ec-07afbe6d1097\",\"type\":\"default\",\"source\":\"e6e4bf59-c328-4149-a4f8-7833c3e6c1a0\",\"target\":\"61c13242-1eab-413e-b8bf-1307f8621b40\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"b58e1c21-4918-4eee-b32e-5a366285260f\",\"type\":\"default\",\"source\":\"edb63c9b-7c59-4de0-bebe-b4cf11b7302f\",\"target\":\"5eb7e347-2258-4de9-b574-e38af9889272\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"0181ac48-e830-4f4a-892b-783df11c164a\",\"type\":\"default\",\"source\":\"5eb7e347-2258-4de9-b574-e38af9889272\",\"target\":\"381809b0-69c7-482d-a01c-64f7f29cae7c\",\"sourceHandle\":\"result\",\"targetHandle\":\"secondarytable\",\"animated\":false},{\"id\":\"2f74c966-db92-4bf9-9839-f17ea8cf5578out-3a1d1c84-8dd3-49d6-b37a-8e3c9ac84f5csecondary\",\"source\":\"2f74c966-db92-4bf9-9839-f17ea8cf5578\",\"target\":\"3a1d1c84-8dd3-49d6-b37a-8e3c9ac84f5c\",\"className\":\"\",\"sourceHandle\":\"out\",\"targetHandle\":\"secondary\",\"animated\":false},{\"id\":\"3685f2b6-80e6-4a29-a9f0-ecef82132e43out-3a1d1c84-8dd3-49d6-b37a-8e3c9ac84f5csource\",\"source\":\"3685f2b6-80e6-4a29-a9f0-ecef82132e43\",\"target\":\"3a1d1c84-8dd3-49d6-b37a-8e3c9ac84f5c\",\"className\":\"\",\"sourceHandle\":\"out\",\"targetHandle\":\"source\",\"animated\":false}],\"variables\":null,\"procedure\":{},\"schedule\":{},\"viewport\":{\"x\":48.75594765066933,\"y\":189.3139120725738,\"zoom\":0.3996518290603591},\"schemaVersion\":\"1.0.0\",\"connectionProvider\":\"bigquery\",\"useCache\":false}"}
  */
  BEGIN
  DECLARE alias STRING;
  CREATE TABLE `carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.table_f119a95e_a5be_47cd_a427_e515138b8dca` AS
  SELECT * FROM `carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.distritos`
  WHERE 1=0;
  EXECUTE IMMEDIATE
  '''
    with __alias AS(
      SELECT CONCAT(
        'b.', column_name, ' AS ', column_name, '_secondary'
      ) col_alias
      FROM `carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3`.INFORMATION_SCHEMA.COLUMNS
    WHERE table_name = 'table_f119a95e_a5be_47cd_a427_e515138b8dca'
    )
    SELECT STRING_AGG(col_alias, ', ')
    FROM __alias
  '''
  INTO alias;
  DROP TABLE `carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.table_f119a95e_a5be_47cd_a427_e515138b8dca`;
  EXECUTE IMMEDIATE
  REPLACE(
    '''CREATE TEMPORARY TABLE `WORKFLOW_8cb51442ff57d51e_87633ce227709ca8_result`
    AS
      SELECT
        ST_INTERSECTION(
          b.geom,
          a.geom
        )
      AS intersection_geom_geom,
        a.*, %s
      FROM `carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentalidad_sin_distrito` AS a
      JOIN `carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.distritos` AS b
      ON ST_INTERSECTS(
        b.geom,
        a.geom
      )''',
    '%s',
    alias
  );
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_8cb51442ff57d51e_37da3304bec96c1c_result`
  AS
    SELECT * EXCEPT (intersection_geom_geom, geom_secondary)
    FROM `WORKFLOW_8cb51442ff57d51e_87633ce227709ca8_result`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_8cb51442ff57d51e_4b9db2484051e496_result`
  AS
    SELECT * EXCEPT (distrito_secondary),
      distrito_secondary AS distrito
    FROM `WORKFLOW_8cb51442ff57d51e_37da3304bec96c1c_result`;
  END;
  BEGIN
  DECLARE __destination STRING DEFAULT 'carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentalidad';
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
    CLONE `WORKFLOW_8cb51442ff57d51e_4b9db2484051e496_result`''',
    '####',
    __destination
  );
  END;
  END;
  BEGIN
          DECLARE emails STRING DEFAULT '''["jorgekk22@gmail.com"]''';
          DECLARE export_id STRING DEFAULT GENERATE_UUID();
          DECLARE bucket STRING DEFAULT 'carto-tnt-gcp-europe-west1-export-storage';
          DECLARE response STRING;
          DECLARE headers STRING DEFAULT '''
          { "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhIjoiYWNfdDg3Mm81M2YiLCJqdGkiOiI5YTg2Y2YzZSJ9.gYbWO0R1rkzFjjIks-fyNMpqxFIX0d_7ze72QhXNScQ",
            "Content-Type": "application/json"
          }''';
          DECLARE bucket_urls STRING;
          DECLARE payload STRING;
          EXECUTE IMMEDIATE FORMAT('''
            EXPORT DATA -- carto-export-id: %s
              OPTIONS (
                uri = 'gs://%s/%s-*.csv.gz',
                format = 'CSV',
                overwrite = true,
                compression = 'GZIP',
          header = true,
          field_delimiter = ','
            )
            AS (
              SELECT * FROM `carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentalidad`
            )
           ''',
           export_id, bucket, export_id
           );
          SET bucket_urls = (
            WITH export_result AS (
              SELECT timeline[0].pending_units + timeline[0].completed_units AS num_files
              FROM `carto-dw-ac-t872o53f`.`region-EU`.INFORMATION_SCHEMA.JOBS_BY_USER
              WHERE creation_time > TIMESTAMP_ADD(CURRENT_TIMESTAMP(), INTERVAL -1 HOUR)
                AND statement_type = 'EXPORT_DATA'
                AND query LIKE CONCAT('%', '-- carto-export-id: ', export_id, '%')
              LIMIT 1
            )
            SELECT ARRAY_TO_STRING(ARRAY(
              SELECT CONCAT(
                '"',
                'https://storage.googleapis.com/',
                bucket,
                '/',
                export_id,
                '-',
                LPAD(CAST(i AS STRING), 12, '0'),
                '.',
                'csv',
                '.gz',
                '"'
              ) AS url
              FROM export_result, UNNEST(GENERATE_ARRAY(0, num_files - 1)) AS i
              ORDER BY i), ', ')
          );
          SET payload = CONCAT('''
            {
              "method": "email",
              "payload": {
                "emails": ''', emails, ''',
                "subject": "accidentalidad",
                "body": "<br><ul>{% for bucketUrl in bucketUrls %}<li>{{ bucketUrl }}</li>{% endfor %}</ul>",
                "replacements": {
                  "bucketUrls": [ ''', bucket_urls, ''']
                }
              }
            }
            '''
          );
          SET response = `carto-un-eu.carto.__REQUEST`(
            'post', 'https://gcp-europe-west1.api.carto.com',
            'v3/workflows/notify', payload, headers
          );
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_8cb51442ff57d51e_d637ece3476ceeff_result`
  AS
    SELECT * EXCEPT (tipo_vehiculo_clasificado, tipo_persona, rango_edad, sexo, lesividad_clasificada, positiva_alcohol, positiva_droga)
    FROM `WORKFLOW_8cb51442ff57d51e_4b9db2484051e496_result`;
  END;
  BEGIN
  DECLARE alias_encoded STRING;
  DECLARE alias_decoded STRING;
  CREATE TABLE `carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.table_e5574d1d_1a89_4421_b46d_8a1f359ccc25` AS
  SELECT * FROM `WORKFLOW_8cb51442ff57d51e_d637ece3476ceeff_result`
  WHERE 1=0;
  EXECUTE IMMEDIATE
  '''
    with __alias AS(
      SELECT REPLACE(
        CASE data_type WHEN 'GEOGRAPHY' THEN 'ST_ASBINARY(%s) AS %s' ELSE '%s AS %s' END
      , '%s', column_name) col_alias_encoded,
      REPLACE(
        CASE data_type WHEN 'GEOGRAPHY' THEN 'ST_GEOGFROMWKB(%s) AS %s' ELSE '%s AS %s' END
      , '%s', column_name) col_alias_decoded
      FROM `carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3`.INFORMATION_SCHEMA.COLUMNS
    WHERE table_name = 'table_e5574d1d_1a89_4421_b46d_8a1f359ccc25'
    )
    SELECT STRING_AGG(col_alias_encoded, ', '), STRING_AGG(col_alias_decoded, ', ')
    FROM __alias
  '''
  INTO alias_encoded, alias_decoded;
  DROP TABLE `carto-dw-ac-t872o53f.workflows_temp_jorgekk22_3000e6c3.table_e5574d1d_1a89_4421_b46d_8a1f359ccc25`;
  EXECUTE IMMEDIATE
  REPLACE(
    REPLACE(
      '''CREATE TEMPORARY TABLE `WORKFLOW_8cb51442ff57d51e_c98e0e235b4075b1_result`
      AS
        SELECT %s1
        FROM (SELECT DISTINCT %s2 FROM `WORKFLOW_8cb51442ff57d51e_d637ece3476ceeff_result`)''',
      '%s1',
      alias_decoded
    ),
    '%s2',
    alias_encoded
  );
  END;
  BEGIN
  DECLARE __destination STRING DEFAULT 'carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentes';
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
    CLONE `WORKFLOW_8cb51442ff57d51e_c98e0e235b4075b1_result`''',
    '####',
    __destination
  );
  END;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_8cb51442ff57d51e_b64d314561db0b03_result`
  AS
    SELECT *
    FROM `WORKFLOW_8cb51442ff57d51e_c98e0e235b4075b1_result`
    ORDER BY RAND()
    LIMIT 1000;
  END;
  BEGIN
  DECLARE __destination STRING DEFAULT 'carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentes_sample';
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
    CLONE `WORKFLOW_8cb51442ff57d51e_b64d314561db0b03_result`''',
    '####',
    __destination
  );
  END;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_8cb51442ff57d51e_3af5299ada2d6db7_result`
  AS
    SELECT 
      _main.*,
      _joined.distrito AS distrito_joined, _joined.geom AS geom_joined, _joined.num_expediente AS num_expediente_joined, _joined.fecha AS fecha_joined, _joined.tipo_accidente_clasificado AS tipo_accidente_clasificado_joined, _joined.estado_meteorologico AS estado_meteorologico_joined, _joined.anno AS anno_joined, _joined.mes AS mes_joined, _joined.dia_mes AS dia_mes_joined, _joined.dia_semana AS dia_semana_joined, _joined.horas AS horas_joined, _joined.hora_rango AS hora_rango_joined
    FROM
      `WORKFLOW_8cb51442ff57d51e_4b9db2484051e496_result` AS _main
    INNER JOIN
      `WORKFLOW_8cb51442ff57d51e_b64d314561db0b03_result` AS _joined
    ON
      _main.num_expediente = _joined.num_expediente;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_8cb51442ff57d51e_8a93b60b44aa46b6_result`
  AS
    SELECT * EXCEPT (distrito_joined, geom_joined, num_expediente_joined, fecha_joined, tipo_accidente_clasificado_joined, estado_meteorologico_joined, anno_joined, mes_joined, dia_mes_joined, dia_semana_joined, horas_joined, hora_rango_joined)
    FROM `WORKFLOW_8cb51442ff57d51e_3af5299ada2d6db7_result`;
  END;
  BEGIN
  DECLARE __destination STRING DEFAULT 'carto-dw-ac-t872o53f.private_jorgekk22_3000e6c3.accidentalidad_sample';
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
    CLONE `WORKFLOW_8cb51442ff57d51e_8a93b60b44aa46b6_result`''',
    '####',
    __destination
  );
  END;
  END;
END;