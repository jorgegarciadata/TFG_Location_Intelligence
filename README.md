# TFG_Location_Intelligence
#  Análisis de Datos Geoespaciales: Siniestralidad Vial en Madrid
**Geospatial Data Analysis: Application to Road Accidents in Madrid**

Este repositorio contiene el código, las consultas espaciales y el visor web desarrollados para el Trabajo de Fin de Grado en Matemáticas. 

El proyecto aplica técnicas de **Location Intelligence**, Estadística Espacial (LISA, H3) y algoritmos de clustering (DBSCAN) para analizar los patrones de accidentalidad en la ciudad de Madrid, detectando "puntos negros" e identificando la paradoja entre el riesgo vial y la cobertura hospitalaria.

**Autor:** Jorge García de Lorenzo
**Herramientas Principales:** R, SQL, CARTO, Tableau.

---

##  Estructura del Repositorio

El proyecto está organizado de la siguiente manera:

* **`scripts/`**: Código fuente del análisis.
  * `R/`: Scripts de preprocesamiento, limpieza y estandarización geográfica (generación de GeoJSON).
  * `SQL/`: Consultas espaciales (CARTO Workflows) para análisis de Voronoi, Isócronas, y estadística espacial (Getis-Ord Gi*, Moran's I).
* **`web/`**: Recursos frontend (HTML, JS, CSS) para la presentación de resultados y mapas interactivos.
* **`Analisis_de_Datos_Geoespaciales...pdf`**: Memoria completa del Trabajo de Fin de Grado con toda la fundamentación matemática y teórica.

---

##  Origen y Gestión de los Datos (Política Zero-Data)

> **Política de Repositorio Ligero:** Este repositorio **NO contiene ningún archivo de datos (ni crudos ni procesados)**. La carpeta `data/` ha sido excluida íntegramente mediante `.gitignore` para garantizar un repositorio ágil y respetar los límites de GitHub. 

Este proyecto está diseñado para ser **100% reproducible**. Para ejecutar el código o los workflows espaciales localmente, debes descargar los conjuntos de datos originales y generar los archivos procesados siguiendo estos pasos:

### 1. Adquisición de Fuentes Crudas
Descarga los siguientes conjuntos de datos públicos del **Portal de Datos Abiertos del Ayuntamiento de Madrid** y colócalos en tu estructura local (`data/raw/`) respetando las siguientes rutas:

* **Siniestralidad Vial (2019-2025):** 
  * *Ruta local:* `data/raw/Accidentalidad/`
  * *Descarga:* https://datos.madrid.es/dataset/300228-0-accidentes-trafico-detalle
* **Hospitales de la Comunidad de Madrid:** 
  * *Ruta local:* `data/raw/Hospitales/`
  * *Descarga:* (https://datos.madrid.es/dataset/212769-0-atencion-medica)
* **Límites de Distritos y Callejero:** 
  * *Rutas locales:* `data/raw/Distritos/`
  * *Descarga:* https://geoportal.madrid.es/IDEAM_WBGEOPORTAL/dataset.iam?id=541f4ef6-762b-11e9-861d-ecb1d753f6e8
* **Cámaras y Radares (CCTV, ZBE, Fijos):** 
  * *Rutas locales:* `data/raw/Camaras/` y `data/raw/Radares/`
  * *Descarga:* https://datos.madrid.es/dataset/300429-0-camaras-videovigilancia/downloads 
  * *Descarga:* https://datos.madrid.es/dataset/300049-0-radares-fijos-moviles

### 2. Pipeline de Preprocesamiento
Una vez que tengas la carpeta `data/raw/` completa con los archivos descargados, la reconstrucción de los datos es automática.

Ejecuta el script principal de R para unificar, limpiar, georreferenciar y categorizar todas las variables:
```bash
# Desde la raíz del proyecto, ejecuta:
Rscript scripts/R/clean_to_CARTO.R
