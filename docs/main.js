document.addEventListener('DOMContentLoaded', () => {
    // --- DEFINICIÓN COMPLETA Y UNIFICADA DE LA HISTORIA ---
    const storySteps = [
        { id: 'indice-general', isTheory: true, title: 'Índice de la Presentación', summary: `Bienvenido al análisis de la siniestralidad vial en Madrid. Navega por las secciones usando este índice o los botones de navegación.`, theoryContent: `` },
        { id: 'teoria-mapa-perfecto', isTheory: true, title: 'Fundamento: Mapa Fiel', summary: `Toda representación 2D de la Tierra es una distorsión. Esta sección introduce el fundamento matemático que lo demuestra: el Teorema Egregium.`, theoryContent: `<h3>Fundamento: La Imposibilidad de un Mapa Fiel</h3><div class="theorem-block"><h4>Teorema Egregium</h4><p>La curvatura de Gauss K(p) de una superficie es un invariante ante isometrías locales.</p></div><p>Este resultado nos dice que la curvatura de Gauss depende únicamente de la Primera Forma Fundamental y sus derivadas. En consecuencia, si <i>f : 𝕊₁ → 𝕊₂</i> es una isometría local, entonces K<sub>𝕊₁</sub>(p) = K<sub>𝕊₂</sub>(f(p)) para todo p ∈ 𝕊₁.</p><div class="corollary-block"><h4>Corolario</h4><p>No existe ningún mapa perfecto (localmente isométrico) entre un abierto de la esfera <strong>𝕊²</strong> y un abierto del plano <strong>ℝ²</strong>.</p><div class="demonstration-container"><button class="demo-btn" data-target="demo-1">Demostración</button></div><div id="demo-1" class="demonstration hidden"><p>Supongamos que <i>f : Ω ⊂ 𝕊²(R) → ∆ ⊂ ℝ²</i> es una isometría local. Por el Teorema Egregium, se preserva la curvatura de Gauss:</p><p class="math-formula">K<sub>𝕊²</sub>(p) = K<sub>ℝ²</sub>(f(p)) ∀p ∈ Ω</p><p>Pero K<sub>𝕊²</sub> = 1/R² > 0, mientras que K<sub>ℝ²</sub> = 0. Contradicción. Por tanto, tal isometría no puede existir.</p><p class="proof-end">■</p></div></div><img src="images/mercator-projection.gif" class="theory-gif" alt="Animación de la Proyección de Mercator mostrando la distorsión">`},
        { id: 'teoria-datos-h3', isTheory: true, title: 'Fundamento: Rejillas H3', summary: 'Partimos de datos vectoriales, pero para un análisis robusto los agregamos en una rejilla hexagonal (H3) que combina precisión y eficiencia.', theoryContent: `<h3>Indices Espaciales : H3</h3><p></p><h4> Una Rejilla Espacial Uniforme (Teselación)</h4><p>Matemáticamente, solo triángulos, cuadrados y hexágonos pueden teselar un plano a la perfección.</p><button class="expand-btn" data-text-show="Mostrar detalles técnicos" data-text-hide="Ocultar detalles técnicos">Mostrar detalles técnicos</button><div class="details-container"><h4>Análisis Comparativo de Teselaciones</h4><p>La elección de la forma de la celda es crucial y se basa en tres propiedades fundamentales:</p><ul><li><strong>1. Recorrido de Vecinos (Distancia):</strong> Al analizar áreas de influencia, es vital medir la distancia desde una celda a sus vecinas. Los hexágonos son ideales, ya que todos sus vecinos están a la misma distancia, a diferencia de los cuadrados o triángulos.</li></ul><img src="images/grid_neighbors.png" alt="Comparación de vecindad en diferentes rejillas"><p class="image-caption">Análisis de la vecindad para los tres tipos de polígonos regulares.</p><ul><li><strong>2. Subdivisión (Jerarquía):</strong> Para realizar análisis a diferentes escalas (zoom), necesitamos que las celdas se puedan agrupar o subdividir. Aunque la subdivisión de los hexágonos es imperfecta (un padre contiene 7 hijos con una ligera aproximación), el sistema H3 gestiona esta jerarquía de forma muy eficiente.</li></ul><img src="images/hierarchical_grid.png" alt="Jerarquía de celdas H3"><p class="image-caption">Ejemplo de la subdivisión imperfecta pero eficiente de los hexágonos.</p><ul><li><strong>3. Distorsión en la Proyección:</strong> Como vimos, proyectar una esfera en un plano siempre introduce distorsión. La proyección de H3 es más equitativa, ya que se basa en proyectar un <strong>icosaedro</strong> sobre la esfera, lo que distribuye la distorsión de forma mucho más homogénea.</li></ul><img src="images/icosahedron_projection.png" alt="Proyección gnomónica de un icosaedro sobre la esfera"><p class="image-caption">Proyección gnomónica de un icosaedro para definir la rejilla base H3.</p></div><h4>El Veredicto: H3, el Poder del Hexágono</h4><p>El sistema H3 de Uber, basado en hexágonos, representa el mejor <strong>compromiso</strong> entre estas tres propiedades. Su forma es ideal para análisis de proximidad, y su proyección minimiza la distorsión a escala global.</p><div class="gif-container"><img src="images/h3_global_grid.gif" class="theory-gif" alt="Animación de la rejilla global H3"><img src="images/micro_scale.gif" class="theory-gif" alt="Animación de la jerarquía de H3 a microescala"></div><p class="image-caption">La rejilla H3 funciona tanto a escala global como a nivel de calle, como se aprecia en estos GIFs de la presentación original de Uber.</p>`},
        { id: 'teoria-lisa', isTheory: true, title: 'Métodos: Estadística Espacial', summary: `Se usan métodos globales para saber SI hay un patrón y métodos locales para saber DÓNDE está.`, theoryContent: `<h3>Métodos Estadísticos Espaciales</h3><h4>Métodos Globales: ¿Existe un patrón?</h4><p>El primer paso es usar un método global para determinar si los datos presentan un patrón de agrupamiento o si, por el contrario, son aleatorios. El más común es el <strong>I de Moran Global</strong>, que resume la autocorrelación de todo el mapa en un solo número. Para este estudio, se obtuvo un valor de <strong>0.53</strong>, confirmando una considerable tendencia al agrupamiento de accidentes en Madrid.</p><h4>Métodos Locales (LISA): ¿Dónde está el patrón?</h4><p>Una vez que sabemos que existe un patrón, los Indicadores Locales de Asociación Espacial (LISA) nos ayudan a localizarlo, identificando clústeres y outliers específicos en el mapa.</p><div class="theory-subsection"><h5 class="subsection-title">Estadístico Getis-Ord G<sub>i</sub>*</h5><p>Ideal para identificar <strong>hotspots</strong> (clústeres de valores altos) y <strong>coldspots</strong> (clústeres de valores bajos).</p><button class="expand-btn" data-text-show="Ver Fórmula e Interpretación" data-text-hide="Ocultar Fórmula e Interpretación">Ver Fórmula e Interpretación</button><div class="details-container"><p class="math-formula">$$ G_i^* = \\frac{\\sum_{j=1}^{n} w_{ij}x_j - \\bar{X}\\sum_{j=1}^{n} w_{ij}}{S \\sqrt{\\frac{[n\\sum_{j=1}^{n} w_{ij}^2 - (\\sum_{j=1}^{n} w_{ij})^2]}{n-1}}} $$</p><p><strong>Interpretación:</strong> El resultado es una puntuación Z. Un valor alto y positivo indica un <strong>hotspot</strong>; un valor bajo y negativo indica un <strong>coldspot</strong>. El patrón es robusto si el p-valor es significativo (p < 0.05).</p></div></div><div class="theory-subsection"><h5 class="subsection-title">Estadístico I de Moran Local</h5><p>Más versátil, ya que no solo detecta clústeres de valores similares, sino también <strong>outliers espaciales</strong>.</p><button class="expand-btn" data-text-show="Ver Fórmula e Interpretación" data-text-hide="Ocultar Fórmula e Interpretación">Ver Fórmula e Interpretación</button><div class="details-container"><p class="math-formula">$$ I_i = \\frac{x_i - \\bar{X}}{S^2} \\sum_{j=1, j \\neq i}^{n} w_{ij}(x_j - \\bar{X}) $$</p><p><strong>Interpretación:</strong> El resultado permite clasificar cada zona en cuatro categorías: <strong>High-High</strong> (clúster caliente), <strong>Low-Low</strong> (clúster frío), <strong>High-Low</strong> (outlier o "isla de peligro") y <strong>Low-High</strong> (outlier o "isla de seguridad").</p></div></div><img src="images/Get_Ord_vs_Local_Morans_I_comparison.png" alt="Comparación conceptual entre Getis-Ord Gi* y Local Moran's I"><p class="image-caption">Getis-Ord se centra en la magnitud (hotspot/coldspot), mientras que Moran's I analiza la similitud con el entorno.</p>`},
        { id: 'teoria-voronoi-isocronas', isTheory: true, title: 'Métodos: Accesibilidad Real', summary: `Se explica la transición de un modelo simple (Voronoi) a uno más realista (Isócronas).`, theoryContent: `<h3>De la Proximidad Teórica a la Accesibilidad Real</h3><p>Para analizar la cobertura sanitaria, comenzamos con un modelo teórico de proximidad y lo evolucionamos hacia un modelo realista de accesibilidad.</p><h4>Paso 1: Proximidad Teórica (Diagramas de Voronoi)</h4><p>El Diagrama de Voronoi particiona el espacio en regiones donde cada punto es asignado al "semillero" (hospital) más cercano, asumiendo una distancia en línea recta (euclídea).</p><div class="theory-subsection"><h5 class="subsection-title">Definición Formal</h5><p>Dado un conjunto de hospitales $P = \\{p_1, p_2, ..., p_n\\}$, la región de Voronoi $V(p_i)$ para el hospital $p_i$ es el conjunto de todos los puntos $x$ en el plano que están más cerca de $p_i$ que de cualquier otro hospital $p_j$.</p><p class="math-formula">$$ V(p_i) = \\{ x \\in \\mathbb{R}^2 \\mid d(x, p_i) \\le d(x, p_j) \\text{ para todo } j \\neq i \\} $$</p><p><strong>Limitación Clave:</strong> Este modelo es útil como primera aproximación, pero es irreal porque ignora la red de carreteras, los sentidos de circulación y el tráfico.</p></div><h4>Paso 2: Accesibilidad Real (Isócronas)</h4><p>Para superar la limitación anterior, reemplazamos la métrica euclídea ($d$) por una función de coste basada en el tiempo de viaje a través de la red de transporte ($t_{net}$). Esto nos da las <strong>Isócronas</strong>.</p><div class="theory-subsection"><h5 class="subsection-title">Definición Formal</h5><p>Una isócrona es una línea que une todos los puntos a los que se puede llegar en un mismo intervalo de tiempo $T$ desde un origen $p_i$.</p><p class="math-formula">$$ I_t(p_i, T) = \\{ x \\in \\mathbb{R}^2 \\mid t_{net}(p_i, x) = T \\} $$</p><p><strong>Ventaja:</strong> Este modelo ofrece una visión mucho más precisa y realista de las verdaderas áreas de servicio hospitalario, considerando cómo nos movemos realmente por la ciudad.</p></div>`},
        { id: 'teoria-preprocesamiento-r', isTheory: true, title: 'Metodología y Flujo de Trabajo', summary: `El proyecto se estructuró en cuatro fases secuenciales, combinando herramientas para cubrir todo el ciclo de vida del dato.`, theoryContent: `<h3>Metodología y Flujo de Trabajo</h3><p>El análisis se estructuró en cuatro fases secuenciales, combinando herramientas locales y plataformas en la nube para cubrir todo el ciclo de vida del dato, desde su adquisición hasta su análisis avanzado.</p><div class="theory-subsection"><h5 class="subsection-title">Fase 1: Preprocesamiento con R</h5><p>Consolidación, limpieza y enriquecimiento de las diversas fuentes de datos para generar un conjunto de datos limpio y coherente.</p><button class="expand-btn" data-text-show="Ver Pasos Detallados" data-text-hide="Ocultar Pasos Detallados">Ver Pasos Detallados</button><div class="details-container"><ol><li><strong>Carga y Limpieza Iterativa:</strong> Se implementó un bucle para leer los archivos CSV anuales, estandarizando valores nulos y filtrando registros sin coordenadas válidas.</li><li><strong>Enriquecimiento Temporal:</strong> Se procesaron fechas y horas para generar variables categóricas clave como día de la semana o franja horaria.</li><li><strong>Recategorización de Variables:</strong> Se agruparon categorías complejas (lesividad, tipo de vehículo) en clasificaciones más generales para facilitar el análisis.</li><li><strong>Geoprocesamiento y Transformación:</strong> Los datos se convirtieron en objetos espaciales (sf), transformando las coordenadas de UTM a WGS 84 para compatibilidad web.</li><li><strong>Consolidación de Fuentes Auxiliares:</strong> Se procesaron y unificaron los datos de distritos, radares y hospitales.</li><li><strong>Exportación:</strong> Todos los datos limpios y procesados se exportaron a formato GeoJSON, el estándar para datos geoespaciales en la web.</li></ol></div></div><div class="theory-subsection"><h5 class="subsection-title">Fase 2: Análisis Exploratorio con Tableau</h5><p>Creación de dashboards interactivos para la exploración de patrones temporales, perfiles demográficos y relaciones entre variables a nivel general.</p><button class="expand-btn" data-text-show="Ver Pasos Detallados" data-text-hide="Ocultar Pasos Detallados">Ver Pasos Detallados</button><div class="details-container"><ol><li><strong>Conexión y Verificación:</strong> Se estableció una conexión directa al fichero procesado, verificando la correcta interpretación de los tipos de campo.</li><li><strong>Creación de Campos Calculados:</strong> Se generaron métricas personalizadas, destacando el uso de Expresiones de Nivel de Detalle (LODs) para calcular valores a nivel de accidente único (e.g., máxima lesividad).</li><li><strong>Desarrollo de Dashboards Temáticos:</strong> Se diseñaron siete dashboards para responder a preguntas específicas de investigación usando una variedad de gráficos.</li><li><strong>Ensamblaje del Story Interactivo:</strong> Se integraron los dashboards en un Story de Tableau para presentar los hallazgos de forma secuencial y guiada.</li></ol></div></div><div class="theory-subsection"><h5 class="subsection-title">Fase 3: Modelado y Análisis Espacial con CARTO</h5><p>Aplicación de técnicas geoespaciales avanzadas para enriquecer datos, crear áreas de servicio y desarrollar perfiles de riesgo de alta resolución.</p><button class="expand-btn" data-text-show="Ver Workflows Implementados" data-text-hide="Ocultar Workflows Implementados">Ver Workflows Implementados</button><div class="details-container"><ul><li><strong>Enriquecimiento y Muestreo:</strong> Asignación de distritos a cada accidente y creación de una tabla de eventos únicos.</li><li><strong>Áreas de Influencia (Voronoi):</strong> Creación de zonas teóricas de cobertura hospitalaria basadas en la proximidad euclídea.</li><li><strong>Perfil de Riesgo Hospitalario (Isócronas y H3):</strong> Generación de un mapa de riesgo de alta resolución basado en tiempos de viaje reales.</li><li><strong>Detección de Clústeres (LISA):</strong> Validación estadística de hotspots y coldspots de siniestralidad.</li><li><strong>Identificación de Puntos Negros (DBSCAN):</strong> Localización de las concentraciones de accidentes más extremas a nivel de intersección.</li></ul></div></div><div class="theory-subsection"><h5 class="subsection-title">Fase 4: Diseño de Mapas Analíticos con CARTO Builder</h5><p>Traducción de los resultados del modelado espacial a mapas temáticos interactivos para la comunicación visual de los hallazgos.</p><button class="expand-btn" data-text-show="Ver Pasos Detallados" data-text-hide="Ocultar Pasos Detallados">Ver Pasos Detallados</button><div class="details-container"><ol><li><strong>Carga de la Fuente de Datos:</strong> Se añadieron las tablas de resultados de los workflows como nuevas capas en el mapa.</li><li><strong>Estilo de la Capa (Styling):</strong> Se aplicó un estilo coroplético a los polígonos, usando rampas de color para representar la intensidad del fenómeno.</li><li><strong>Configuración de la Interacción:</strong> Se definieron ventanas emergentes (pop-ups) y etiquetas flotantes (tooltips) para mostrar información detallada al interactuar con el mapa.</li><li><strong>Diseño Final del Mapa:</strong> Se seleccionaron mapas base neutros (Positron, Dark Matter) y se configuraron leyendas claras para facilitar la interpretación.</li></ol></div></div>`},
        { id: 'tableau', title: 'Análisis Exploratorio', summary: `Comenzamos con una visión general en Tableau para explorar la magnitud del problema y revelar patrones iniciales.`, isTableau: true },
        { id: 'workflow-1', title: 'Workflow: Procesamiento', summary: `Los datos brutos se limpian, estructuran y enriquecen en CARTO.`, fullScreenImage: 'images/workflow_accidentes.png' },
        { id: 'map-1', title: 'Mapa: Concentración', summary: `El primer mapa revela una extremada concentración de la siniestralidad en el núcleo central de la ciudad.`, mapId: '07a2baaa-8cc2-40a8-af24-fb532fcf2804' },
        { id: 'workflow-2', title: 'Workflow: Cobertura Teórica', summary: `Generamos un diagrama de Voronoi para un primer análisis de accesibilidad.`, fullScreenImage: 'images/workflow_voronoi.png' },
        { id: 'map-2', title: 'Mapa: Voronoi', summary: `El mapa de Voronoi muestra alta cobertura central y disparidad en la periferia.`, mapId: '8a3b4956-1d3e-43e7-9ba9-95b10ccd78ed' },
        { id: 'workflow-3', title: 'Workflow: Accesibilidad Real', summary: `Comparamos áreas de servicio basadas en tiempo (isócronas) y distancia (isodistancias).`, fullScreenImage: 'images/workflow_isocrona_isodistancia.png' },
        { id: 'map-3', title: 'Mapa: Isócronas vs Isodistancias', summary: `La isócrona (azul) prueba que la accesibilidad real, medida en tiempo, es más realista.`, mapId: '8bf2e8f5-18d9-4d67-8fda-332e0fbc1fd3' },
        { id: 'workflow-4', title: 'Workflow: Perfil de Riesgo', summary: `Calculamos métricas de riesgo por celda H3, cruzándolas con tiempos de respuesta hospitalaria.`, fullScreenImage: 'images/workflow_perfil_riesgo_hospitales.png' },
        { id: 'map-4', title: 'Mapa 3D: Paradoja de Densidad', summary: `La zona más peligrosa (picos altos) es también la mejor cubierta (color verde).`, mapId: '90620153-3159-4b07-9adc-bcf1cf1dcae5' },
        { id: 'map-5', title: 'Mapa 3D: Riesgo Peatonal', summary: `El riesgo de atropellos está contenido dentro de las áreas con mejor acceso a emergencias.`, mapId: '87792130-2479-49a5-863f-8113e65f5bcc' },
        { id: 'workflow-5', title: 'Workflow: Validación LISA (H9)', summary: `Aplicamos Getis-Ord Gi* y Local Moran's I para validar patrones visuales.`, fullScreenImage: 'images/workflow_lisa_h9.png' },
        { id: 'map-lisa-h9-bruto', title: 'Mapa: LISA H9 (Bruto)', summary: `Los resultados brutos sugieren un patrón claro, pero sin significancia estadística.`, mapId: 'cb8c833b-5c94-4d43-aabc-1bdbd77f20d6' },
        { id: 'map-6', title: 'Mapa: LISA H9 (Filtrado)', summary: `Al filtrar (95% confianza), se valida un masivo hotspot en la almendra central.`, mapId: '4d15ecf4-a760-4e4d-b167-18fcf689aa0f' },
        { id: 'workflow-lisa-h10', title: 'Workflow: Precisión LISA (H10)', summary: `Realizamos un análisis LISA a resolución superior (H10) para máximo detalle.`, fullScreenImage: 'images/workflow_lisa_h10.png' },
        { id: 'map-lisa-h10', title: 'Mapa: LISA H10 (Bruto)', summary: `El resultado inicial es una visión sin precedentes del "esqueleto" del riesgo vial.`, mapId: '3ad15414-f6f0-40d5-810b-824d1e2f8ad9' },
        { id: 'map-lisa-h10-filtrado', title: 'Mapa: LISA H10 (Filtrado)', summary: `Se confirman los hotspots, validando el esqueleto del riesgo vial.`, mapId: '1c803970-e85a-479e-b8f8-8a5037950689' },
        { id: 'workflow-dbscan', title: 'Workflow: Puntos Negros (DBSCAN)', summary: `DBSCAN identifica las concentraciones de accidentes más extremas a nivel de intersección.`, fullScreenImage: 'images/workflow_dbscan_polygons.png' },
        { id: 'map-dbscan', title: 'Mapa: Puntos Negros', summary: `El riesgo extremo se cristaliza en intersecciones, cruces y rotondas específicas.`, mapId: 'a957593f-9954-401d-a841-a2feb3e4ecd0' },
        { id: 'thank-you', title: 'Agradecimientos', summary: 'Fin de la presentación.', isThankYou: true }
    ];

    // ===== ESTRUCTURA PARA EL MENÚ JERÁRQUICO (CON NOMBRES ACTUALIZADOS) =====
    const menuStructure = [
        { title: "Introducción", children: [0], initiallyExpanded: true },
        {
            title: "Fundamentos Teóricos", // Nombre cambiado
            children: [1, 2, 3, 4],
        },
        { title: "Metodología", children: [5] },
        {
            title: "Análisis y Resultados",
            children: [
                6, // Tableau
                7, 8, // Concentración
                9, 10, // Cobertura Teórica
                11, 12, // Accesibilidad Real
                13, 14, 15, // Riesgo y Paradoja
                16, 17, 18, // Validación LISA H9
                19, 20, 21, // Precisión LISA H10
                22, 23, // Puntos Negros DBSCAN
                24 // Agradecimientos
            ]
        }
    ];

    /**
     * Genera un contenido de índice colapsado, mostrando solo los grupos principales.
     * @param {Array} structure La estructura del menú jerárquico.
     * @param {Array} steps Los datos de todas las diapositivas.
     * @returns {string} El contenido HTML del índice.
     */
    function generateIndexContent(structure, steps) {
        let html = `<h3>Índice de la Presentación</h3>
                    <p>Este proyecto se estructura en los siguientes bloques temáticos. Haz clic para navegar directamente a cada sección.</p>
                    <div class="index-container">
                    <ol class="index-list">`;

        // Empezamos desde el segundo grupo (índice 1) para no listar "Introducción"
        structure.slice(1).forEach(group => {
            // El enlace apuntará al primer elemento hijo del grupo
            const firstStepIndex = group.children[0];
            const groupTitle = group.title;

            // Creamos un resumen con los títulos de los primeros 3 sub-items
            const summary = group.children
                .map(childIndex => steps[childIndex].title)
                .slice(0, 3) // Tomamos los 3 primeros para que sea breve
                .join(' • '); // Los unimos con un separador

            html += `<li class="index-item" data-target-index="${firstStepIndex}">
                         <span class="index-section-title">${groupTitle}</span>
                         <p class="index-section-summary">${summary}${group.children.length > 3 ? '...' : ''}</p>
                     </li>`;
        });

        html += `</ol></div>`;
        return html;
    }
    
    storySteps[0].theoryContent = generateIndexContent(menuStructure, storySteps);

    const chaptersWrapper = document.getElementById('chapters-wrapper');
    const prevBtn = document.getElementById('prev-btn');
    const nextBtn = document.getElementById('next-btn');
    const stepIndicator = document.getElementById('step-indicator');
    const tableauContainer = document.getElementById('tableau-container');
    const cartoContainer = document.getElementById('carto-map-container');
    const workflowContainer = document.getElementById('workflow-image-container');
    const theoryPanel = document.getElementById('theory-panel');
    const thankYouContainer = document.getElementById('thank-you-container');
    const workflowImage = document.getElementById('workflow-image');
    const iframe = document.getElementById('carto-map-iframe');
    const landingPage = document.getElementById('landing-page');
    const startBtn = document.getElementById('start-btn');
    const appContainer = document.getElementById('app-container');
    const prevBtnText = prevBtn.querySelector('.btn-text');

    let currentIndex = 0;
    let panzoomInstance = null;
    let collapsedGroups = new Set();

    function renderHierarchicalMenu() {
        const activeGroupIndex = menuStructure.findIndex(group => group.children.includes(currentIndex));

        let menuHtml = '<ul class="docs-nav">';
        menuStructure.forEach((group, groupIndex) => {
            const isCollapsed = !group.initiallyExpanded && collapsedGroups.has(groupIndex) && activeGroupIndex !== groupIndex;

            menuHtml += `
                <li class="nav-group ${isCollapsed ? 'collapsed' : ''}" data-group-index="${groupIndex}">
                    <div class="nav-group-header">
                        <span class="nav-group-title">${group.title}</span>
                        <svg class="nav-chevron" viewBox="0 0 24 24"><path d="M7.41 8.59L12 13.17l4.59-4.58L18 10l-6 6-6-6 1.41-1.41z"/></svg>
                    </div>
                    <ul class="nav-items">
                        ${group.children.map(stepIndex => `
                            <li class="nav-item ${stepIndex === currentIndex ? 'active' : ''}" data-step-index="${stepIndex}">
                                ${storySteps[stepIndex].title}
                            </li>
                        `).join('')}
                    </ul>
                </li>
            `;
        });
        menuHtml += '</ul>';
        chaptersWrapper.innerHTML = menuHtml;
    }

    function showStep(index) {
        const step = storySteps[index];
        
        tableauContainer.style.display = 'none';
        cartoContainer.style.display = 'none';
        workflowContainer.style.display = 'none';
        theoryPanel.style.display = 'none';
        thankYouContainer.style.display = 'none';

        if (panzoomInstance) { 
            workflowContainer.removeEventListener('wheel', panzoomInstance.zoomWithWheel); 
            panzoomInstance.destroy(); 
            panzoomInstance = null; 
        }

        if (step.isTableau) { 
            tableauContainer.style.display = 'block'; 
        } else if (step.mapId) { 
            cartoContainer.style.display = 'block'; 
            updateIframe(step.mapId); 
        } else if (step.fullScreenImage) {
            workflowContainer.style.display = 'flex';
            workflowImage.src = step.fullScreenImage;
            panzoomInstance = Panzoom(workflowImage, { maxScale: 5, minScale: 0.5, contain: 'outside' });
            workflowContainer.addEventListener('wheel', panzoomInstance.zoomWithWheel, { passive: false });
        } else if (step.isTheory) {
            theoryPanel.style.display = 'block';
            theoryPanel.innerHTML = step.theoryContent;
            if (typeof MathJax !== 'undefined') {
                MathJax.typesetPromise();
            }
        } else if (step.isThankYou) {
            thankYouContainer.style.display = 'flex';
        }
        
        currentIndex = index;
        renderHierarchicalMenu();
        
        const activeItem = chaptersWrapper.querySelector('.nav-item.active');
        if (activeItem) {
            setTimeout(() => {
                activeItem.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
            }, 300);
        }

        prevBtn.classList.toggle('home-button', index === 0);
        prevBtnText.innerHTML = index === 0 ? 'Inicio' : 'Anterior';
        prevBtn.disabled = false;
        nextBtn.disabled = index === storySteps.length - 1;
        stepIndicator.textContent = `Paso ${index + 1} de ${storySteps.length}`;
    }

    function updateIframe(mapId) { 
        if (mapId && !iframe.src.includes(mapId)) { 
            cartoContainer.classList.add('loading'); 
            iframe.src = `https://pinea.app.carto.com/map/${mapId}`; 
            iframe.onload = () => cartoContainer.classList.remove('loading'); 
        } 
    }

    function init() {
        startBtn.addEventListener('click', () => { 
            landingPage.classList.add('hidden'); 
            appContainer.classList.add('visible'); 
            Split(['#split-0', '#split-1'], { sizes: [70, 30], minSize: [400, 300], gutterSize: 8, cursor: 'col-resize' }); 
            showStep(0); 
        });

        nextBtn.addEventListener('click', () => { 
            if (currentIndex < storySteps.length - 1) { 
                showStep(currentIndex + 1); 
            } 
        });

        prevBtn.addEventListener('click', () => { 
            if (currentIndex === 0) { 
                window.location.reload(); 
            } else { 
                showStep(currentIndex - 1); 
            } 
        });
        
        chaptersWrapper.addEventListener('click', (event) => {
            const navItem = event.target.closest('.nav-item');
            if (navItem) {
                const newIndex = parseInt(navItem.dataset.stepIndex, 10);
                if (!isNaN(newIndex) && newIndex !== currentIndex) {
                    showStep(newIndex);
                }
                return;
            }

            const groupHeader = event.target.closest('.nav-group-header');
            if (groupHeader) {
                const groupElement = groupHeader.parentElement;
                const groupIndex = parseInt(groupElement.dataset.groupIndex, 10);
                if (collapsedGroups.has(groupIndex)) {
                    collapsedGroups.delete(groupIndex);
                } else {
                    collapsedGroups.add(groupIndex);
                }
                groupElement.classList.toggle('collapsed');
            }
        });

        appContainer.addEventListener('click', (event) => {
            const expandBtn = event.target.closest('.expand-btn');
            if (expandBtn) {
                const detailsContainer = expandBtn.nextElementSibling;
                detailsContainer.classList.toggle('visible');
                expandBtn.textContent = detailsContainer.classList.contains('visible') ? expandBtn.dataset.textHide : expandBtn.dataset.textShow;
            }

            const demoBtn = event.target.closest('.demo-btn');
            if (demoBtn) {
                const demoContent = document.getElementById(demoBtn.dataset.target);
                demoContent.classList.toggle('hidden');
            }
            
            const indexItem = event.target.closest('.index-item');
            if (indexItem) {
                showStep(parseInt(indexItem.dataset.targetIndex, 10));
            }
        });

        document.addEventListener('keydown', (event) => {
            if (event.target.tagName === 'INPUT' || event.target.tagName === 'TEXTAREA' || event.ctrlKey || event.altKey || event.metaKey) return;
            if (event.key === 'ArrowRight') nextBtn.click();
            else if (event.key === 'ArrowLeft') prevBtn.click();
        });

        const firstCartoMap = storySteps.find(s => s.mapId); 
        if (firstCartoMap) { 
            const tempIframe = document.createElement('iframe'); 
            tempIframe.src = `https://pinea.app.carto.com/map/${firstCartoMap.mapId}`; 
            tempIframe.style.display = 'none'; 
            document.body.appendChild(tempIframe); 
        }
    }
    
    init();
});