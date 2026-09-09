# 🗺️ Análisis de Datos Geoespaciales: Siniestralidad Vial en Madrid
**Geospatial Data Analysis: Application to Road Accidents in Madrid**

[![🌍 Visor Web Interactivo](https://img.shields.io/badge/Visor_Web-Interactivo-blue?style=for-the-badge)](https://jorgegarciadata.github.io/TFG_Location_Intelligence/)
[![📄 Memoria del TFG (PDF)](https://img.shields.io/badge/Memoria_TFG-PDF-red?style=for-the-badge)](./Analisis_de_Datos_Geoespaciales__Aplicacion_a_la_Siniestralidad_Vial_en_Madrid.pdf)

Este repositorio contiene el código, las consultas espaciales y el visor web desarrollados para el Trabajo de Fin de Grado en Matemáticas. 

El proyecto aplica técnicas de **Location Intelligence**, Estadística Espacial (LISA, H3) y algoritmos de clustering (DBSCAN) para analizar los patrones de accidentalidad en la ciudad de Madrid, detectando "puntos negros" e identificando la paradoja entre el riesgo vial y la cobertura hospitalaria.

**Autor:** Jorge García de Lorenzo  
**Herramientas Principales:** R, SQL, CARTO, Tableau.

---

## 📂 Estructura del Repositorio

El proyecto está organizado de la siguiente manera:

* **`data/`**: Contiene los conjuntos de datos utilizados y generados a lo largo del proyecto.
  * `processed/`: Datos limpios, transformados y listos para el análisis (por ejemplo, los GeoJSON generados).
  * `raw/`: Datos brutos originales sin procesar, tal y como se obtuvieron de las fuentes.
* **`scripts/`**: Código fuente del análisis.
  * `R/`: Scripts de preprocesamiento, limpieza y estandarización geográfica (generación de GeoJSON).
  * `SQL/`: Consultas espaciales (CARTO Workflows) para análisis de Voronoi, Isócronas, y estadística espacial (Getis-Ord Gi*, Moran's I).
* **`docs/`**: Recursos frontend (HTML, JS, CSS) utilizados por GitHub Pages para el visor interactivo.
* **`Analisis_de_Datos_Geoespaciales__Aplicacion_a_la_Siniestralidad_Vial_en_Madrid.pdf`**: Memoria completa del Trabajo de Fin de Grado con toda la fundamentación matemática y teórica.

---

## 📊 Origen y Gestión de los Datos

> ⚠️ **Política de Repositorio Ligero:** Este repositorio **NO contiene ningún archivo de datos (ni crudos ni procesados)**. La carpeta `data/` ha sido excluida íntegramente mediante `.gitignore` para garantizar un repositorio ágil y respetar los límites de GitHub. 

Este proyecto está diseñado para ser **100% reproducible**. Para ejecutar el código o los workflows espaciales localmente, debes descargar los conjuntos de datos originales y generar los archivos procesados siguiendo estos pasos:

### 1. Adquisición de Fuentes Crudas
Descarga los siguientes conjuntos de datos públicos del **Portal de Datos Abiertos del Ayuntamiento de Madrid** y colócalos en tu estructura local (`data/raw/`) respetando las siguientes rutas:

* **Siniestralidad Vial (2019-2025):** 
  * *Ruta local:* `data/raw/Accidentalidad/`
  * *Descarga:* [Accidentes de tráfico (Detalle)](https://datos.madrid.es/dataset/300228-0-accidentes-trafico-detalle)
* **Hospitales de la Comunidad de Madrid:** 
  * *Ruta local:* `data/raw/Hospitales/`
  * *Descarga:* [Atención médica - Hospitales](https://datos.madrid.es/dataset/212769-0-atencion-medica)
* **Límites de Distritos y Callejero:** 
  * *Rutas locales:* `data/raw/Distritos/`
  * *Descarga:* [Distritos de Madrid](https://geoportal.madrid.es/IDEAM_WBGEOPORTAL/dataset.iam?id=541f4ef6-762b-11e9-861d-ecb1d753f6e8)
* **Cámaras y Radares (CCTV, ZBE, Fijos):** 
  * *Rutas locales:* `data/raw/Camaras/` y `data/raw/Radares/`
  * *Descarga:* [Cámaras de videovigilancia](https://datos.madrid.es/dataset/300429-0-camaras-videovigilancia/downloads) | [Radares fijos y móviles](https://datos.madrid.es/dataset/300049-0-radares-fijos-moviles)

### 2. Pipeline de Preprocesamiento
Una vez que tengas la carpeta `data/raw/` completa con los archivos descargados.

Ejecuta el script principal de R para unificar, limpiar, georreferenciar y categorizar todas las variables:

```bash
# Desde la raíz del proyecto, ejecuta:
Rscript scripts/R/clean_to_CARTO.R