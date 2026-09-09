########################################
# LIBRERÍAS
########################################
library(dplyr)
library(lubridate)
library(hms)
library(sf)
library(terra)
library(geojsonio)
library(readr)
library(tidyr)
library(parzer)
library(forcats)

########################################
# DIRECTORIO DE TRABAJO
########################################
setwd("C:/Users/Jorge/OneDrive/TFG_Location_Intelligence/data")

# Inicializar listas para acumulación
# accidentes_all <- list()
# implicados_all <- list()
accidentalidad_sin_distrito_all <- list()

for (año in 2019:2025) {
  archivo <- paste0("raw/Accidentalidad/", año, "_Accidentalidad.csv")
  if (file.exists(archivo)) {
    df <- read_delim(archivo, delim = ";", locale = locale(encoding = "UTF-8"),
                     col_types = cols(num_expediente = col_character()))
    
    valores_na <- c("NULL", "", "Se desconoce", "Sin especificar", "Desconocido", "#¡VALOR!")
    
    # FILTRADO TEMPRANO
    df <- df %>%
      filter(!is.na(num_expediente)) %>%
      mutate(
        coordenada_x_utm = suppressWarnings(as.numeric(coordenada_x_utm)),
        coordenada_y_utm = suppressWarnings(as.numeric(coordenada_y_utm))
      ) %>%
      filter(!is.na(coordenada_x_utm), !is.na(coordenada_y_utm))
    
    df_limpio <- df %>%
      mutate(across(where(is.character), ~ ifelse(. %in% valores_na, NA_character_, .))) %>%
      mutate(
        fecha_f = dmy(fecha),
        horas = hour(hms::as_hms(as.character(hora))),
        hora_rango = case_when(
          horas < 6 ~ "madrugada",
          horas < 12 ~ "mañana",
          horas < 18 ~ "tarde",
          horas <= 23 ~ "noche",
          TRUE ~ NA_character_
        ),
        anno = factor(year(fecha_f), ordered = TRUE),
        mes = month(fecha_f, label = TRUE, abbr = FALSE),
        dia_mes = factor(day(fecha_f), ordered = TRUE),
        dia_semana = wday(fecha_f, label = TRUE, abbr = FALSE),
        horas = factor(horas, ordered = TRUE),
        hora_rango = factor(hora_rango, levels = c("madrugada", "mañana", "tarde", "noche"), ordered = TRUE),
        num_expediente = factor(num_expediente),
        lesividad = fct_explicit_na(lesividad, "Lesividad Desconocida"),
        lesividad_clasificada = factor(case_when(
          lesividad %in% c(
            "Asistencia sanitaria ambulatoria con posterioridad",
            "Asistencia sanitaria inmediata en centro de salud o mutua",
            "Asistencia sanitaria sólo en el lugar del accidente",
            "Atención en urgencias sin posterior ingreso",
            "Ingreso inferior o igual a 24 horas"
          ) ~ "HERIDOS LEVES",
          lesividad == "Ingreso superior a 24 horas" ~ "HERIDOS GRAVES",
          lesividad == "Fallecido 24 horas" ~ "FALLECIDOS",
          lesividad == "Sin asistencia sanitaria" ~ "SIN ASISTENCIA / ILESOS",
          lesividad == "Lesividad Desconocida" ~ "LESIVIDAD DESCONOCIDA",
          TRUE ~ "LESIVIDAD DESCONOCIDA"
        ), levels = c("SIN ASISTENCIA / ILESOS", "HERIDOS LEVES", "HERIDOS GRAVES", "FALLECIDOS", "LESIVIDAD DESCONOCIDA"), ordered = TRUE),
        estado_meteorológico = fct_explicit_na(estado_meteorológico, "Desconocido"),
        sexo = fct_explicit_na(sexo, "No Especificado"),
        tipo_persona = fct_explicit_na(tipo_persona, "No Especificado"),
        rango_edad = factor(fct_explicit_na(rango_edad, "No Especificado"),
                            levels = c("Menor de 5 años", "De 6 a 9 años", "De 10 a 14 años", "De 15 a 17 años",
                                       "De 18 a 20 años", "De 21 a 24 años", "De 25 a 29 años", "De 30 a 34 años",
                                       "De 35 a 39 años", "De 40 a 44 años", "De 45 a 49 años", "De 50 a 54 años",
                                       "De 55 a 59 años", "De 60 a 64 años", "De 65 a 69 años", "De 70 a 74 años",
                                       "Más de 74 años", "No Especificado"), ordered = TRUE),
        tipo_vehiculo = fct_explicit_na(tipo_vehiculo, "No Especificado"),
        tipo_vehiculo_clasificado = factor(case_when(
          tipo_vehiculo %in% c("Motocicleta > 125cc", "Motocicleta hasta 125cc",
                               "Moto de tres ruedas > 125cc", "Moto de tres ruedas hasta 125cc") ~ "Motocicleta",
          tipo_vehiculo %in% c("Ciclomotor", "Ciclomotor de dos ruedas L1e-B", "Ciclomotor de tres ruedas") ~ "Ciclomotor",
          tipo_vehiculo %in% c("Bicicleta", "Ciclo", "Bicicleta EPAC (pedaleo asistido)") ~ "Bicicleta",
          tipo_vehiculo %in% c("Patinete", "Patinete no eléctrico") ~ "Patinete",
          tipo_vehiculo %in% c("Camión rígido", "Tractocamión", "Vehículo articulado") ~ "Camión",
          tipo_vehiculo %in% c("Autobús", "Autobús articulado", "Autobus EMT", "Autobús articulado EMT",
                               "Microbús <= 17 plazas") ~ "Autobús",
          tipo_vehiculo %in% c("Turismo", "Todo terreno", "Furgoneta") ~ "Turismo/Furgoneta",
          tipo_vehiculo %in% c("Tren/metro", "Tranvía") ~ "Transporte ferroviario",
          tipo_vehiculo %in% c("Ambulancia SAMUR") ~ "Ambulancia",
          tipo_vehiculo %in% c("Maquinaria agrícola", "Maquinaria de obras") ~ "Maquinaria",
          tipo_vehiculo %in% c("Remolque", "Semiremolque", "Caravana") ~ "Remolques/Caravanas",
          tipo_vehiculo %in% c("VMU eléctrico") ~ "Vehículo movilidad urbana",
          tipo_vehiculo %in% c("Otros vehículos con motor", "Otros vehículos sin motor") ~ "Otros",
          tipo_vehiculo == "No Especificado" ~ "No Especificado",
          TRUE ~ "Otros"
        ), ordered = FALSE),
        positiva_alcohol = fct_explicit_na(as.character(positiva_alcohol), "N"),
        positiva_droga = fct_explicit_na(as.character(positiva_droga), "0"),
        tipo_accidente = fct_explicit_na(tipo_accidente, "No Especificado"),
        tipo_accidente_clasificado = factor(case_when(
          tipo_accidente %in% c("Colisión frontal", "Colisión fronto-lateral", "Colisión lateral") ~ "Colisión doble",
          tipo_accidente == "Colisión múltiple" ~ "Colisión múltiple",
          tipo_accidente == "Alcance" ~ "Alcance",
          tipo_accidente == "Choque contra obstáculo fijo" ~ "Choque contra obstáculo",
          tipo_accidente == "Atropello a persona" ~ "Atropello a persona",
          tipo_accidente == "Vuelco" ~ "Vuelco",
          tipo_accidente == "Caída" ~ "Caída",
          tipo_accidente %in% c("Atropello a animal", "Despeñamiento", "Solo salida de la vía", "Otro") ~ "Otras causas",
          tipo_accidente == "No Especificado" | is.na(tipo_accidente) ~ "No especificado",
          TRUE ~ "No especificado"
        ))
      )
    
    # Crear objeto espacial
    accidentalidad_sf <- df_limpio %>%
      st_as_sf(coords = c("coordenada_x_utm", "coordenada_y_utm"), crs = 32630) %>%
      st_transform(crs = 4326)
    
    # accidentes <- accidentalidad_sf %>%
    #   select(num_expediente, fecha = fecha_f, tipo_accidente_clasificado, estado_meteorológico,
    #          anno, mes, dia_mes, dia_semana, horas, hora_rango, geometry) %>%
    #   distinct(num_expediente, .keep_all = TRUE)
    
    # implicados <- df_limpio %>%
    #   select(num_expediente, tipo_vehiculo_clasificado, tipo_persona, rango_edad, sexo,
    #          lesividad_clasificada, positiva_alcohol, positiva_droga)
    
    accidentalidad_sin_distrito <- accidentalidad_sf %>%
      select(num_expediente, fecha = fecha_f, tipo_accidente_clasificado, estado_meteorológico,
             anno, mes, dia_mes, dia_semana, horas, hora_rango,
             tipo_vehiculo_clasificado, tipo_persona, rango_edad, sexo,
             lesividad_clasificada, positiva_alcohol, positiva_droga, geometry)
    
    # Guardar en listas
    # accidentes_all[[as.character(año)]] <- accidentes
    # implicados_all[[as.character(año)]] <- implicados
    accidentalidad_sin_distrito_all[[as.character(año)]] <- accidentalidad_sin_distrito
    
    # # Guardar resultados del año
    # st_write(accidentes, file.path("processed", paste0("accidentes_", año, ".geojson")), delete_dsn = TRUE)
    # write_csv(st_drop_geometry(victimas), file.path("processed", paste0("victimas_", año, ".csv")))
    # st_write(datos_limpios, file.path("processed", paste0("datos_limpios_", año, ".geojson")), delete_dsn = TRUE)
    
    message("Año ", año, " procesado y guardado correctamente.")
  } else {
    warning("Archivo no encontrado para el año ", año)
  }
}

# Unir todos los años
# accidentes <- do.call(rbind, accidentes_all)
# implicados <- bind_rows(implicados_all)
accidentalidad_sin_distrito <- do.call(rbind, accidentalidad_sin_distrito_all)

# Guardar
# st_write(accidentes, "processed/accidentes.geojson", delete_dsn = TRUE)
# write_csv(implicados, "processed/implicados.csv")
st_write(accidentalidad_sin_distrito, "processed/accidentalidad_sin_distrito.geojson", delete_dsn = TRUE)



########################################
# CARGA Y FILTRADO DE DISTRITOS
########################################
distritos <- st_read("raw/Distritos/madrid-districts_.geojson", quiet = TRUE) %>%
  rename(distrito = name) %>%
  mutate(distrito = as.factor(distrito)) %>%
  select(distrito, geometry)

st_write(distritos, "processed/distritos.geojson", driver = "GeoJSON", delete_dsn = TRUE)


########################################
# CARGA Y FILTRADO DE RADARES
########################################
# Leer CSV original
df_radares_csv <- read_delim("raw/Radares/RADARES FIJOS_vDTT (1).csv",
                             delim = ";",
                             locale = locale(encoding = "UTF-8"),
                             show_col_types = FALSE) %>%
  rename(
    Velocidad_limite = `Velocidad límite`,
    Longitud_inicio_tramo = `Longitud inicio tramo`,
    Latitud_inicio_tramo = `Latitud inicio tramo`
  )


# Filtrar radares fijos y convertir a sf
radares_fijos_sf <- df_radares_csv %>%
  filter(Tipo == "Fijo") %>%
  select( Velocidad_limite, Longitud, Latitud) %>%
  st_as_sf(coords = c("Longitud", "Latitud"), crs = 4326)

# Guardar como GeoJSON
st_write(radares_fijos_sf, "processed/radares_fijos.geojson", driver = "GeoJSON", delete_dsn = TRUE)





########################################
# CARGA Y FILTRADO DE CÁMARAS
########################################

# Cámaras CCTV (desde KML)
kml_data_camaras <- st_read("raw/Camaras/CCTV.kml", quiet = TRUE)
camaras_cctv <- kml_data_camaras[st_geometry_type(kml_data_camaras) == "POINT", ] %>%
  st_zm(drop = TRUE, what = "ZM") %>%  # Elimina Z y M si existen
  mutate(tipo = "CCTV")%>%
  select(tipo, geometry)

  

# Cámaras ZBE (desde CSV con coordenadas UTM)
df_camaras_ZBE_csv <- read_delim("raw/Camaras/camaras_ZBE.csv", delim = ";", locale = locale(encoding = "UTF-8"))
camaras_zbe <- df_camaras_ZBE_csv %>%
  mutate(
    utm_x_calc = suppressWarnings(as.numeric(utm_x)),
    utm_y_calc = suppressWarnings(as.numeric(utm_y))
  ) %>%
  filter(!is.na(utm_x_calc) & !is.na(utm_y_calc) & utm_x_calc != 0 & utm_y_calc != 0) %>%
  st_as_sf(coords = c("utm_x_calc", "utm_y_calc"), crs = 32630) %>%
  st_transform(crs = 4326) %>%
  mutate(tipo = "ZBE")%>%
  select(tipo, geometry)
  

# Cámaras ZBEDEP (desde CSV con long/lat)
df_camaras_ZBEDEP_csv <- read_delim("raw/Camaras/camaras_ZBEDEP.csv", delim = ";", locale = locale(encoding = "UTF-8"))
camaras_zbedep <- df_camaras_ZBEDEP_csv %>%
  st_as_sf(coords = c("longitud", "latitud"), crs = 4326) %>%
  mutate(tipo = "ZBEDEP")%>%
  select(tipo, geometry)
 

# Unir todas las cámaras
camaras <- bind_rows(camaras_cctv, camaras_zbe, camaras_zbedep)


# Guardar como único GeoJSON
st_write(camaras, "processed/camaras.geojson", driver = "GeoJSON", delete_dsn = TRUE)

# # ---- Guardar como GeoJSON ----
# st_write(camaras_cctv,    "processed/camaras_cctv.geojson",    driver = "GeoJSON", delete_dsn = TRUE)
# st_write(camaras_zbe,     "processed/camaras_zbe.geojson",     driver = "GeoJSON", delete_dsn = TRUE)
# st_write(camaras_zbedep,  "processed/camaras_zbedep.geojson",  driver = "GeoJSON", delete_dsn = TRUE)



########################################
# CARGA Y FILTRADO DE HOSPITALES
########################################
# Leer CSV original
df_hospitales_csv <- read.csv2("raw/Hospitales/hospitales_50.csv", encoding = "UTF-8")

# Seleccionar y convertir coordenadas UTM a numérico
hospitales_geom <- df_hospitales_csv %>%
  mutate(
    x = suppressWarnings(as.numeric(as.character(COORDENADA.X))),
    y = suppressWarnings(as.numeric(as.character(COORDENADA.Y)))
  ) %>%
  filter(!is.na(x) & !is.na(y)) %>%
  st_as_sf(coords = c("x", "y"), crs = 32630) %>%
  st_transform(crs = 4326) %>%
  select(NOMBRE, geometry)  # Solo geometría

# Guardar como GeoJSON
st_write(hospitales_geom, "processed/hospitales.geojson", driver = "GeoJSON", delete_dsn = TRUE)


