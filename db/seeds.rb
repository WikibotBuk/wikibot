# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Wiki.destroy_all

PREGUNTAS = [
  {
    question: "¿Qué es una Remuneración?",
    answer: "Art. 41. Código del Trabajo: “Se entiende por remuneración las contraprestaciones en dinero y las adicionales en especie avaluables en dinero que debe percibir el trabajador del empleador por causa del contrato de trabajo”. Se necesita de un riguroso cálculo para pagar las remuneraciones y existen distintos conceptos. El sueldo es uno de los más conocidos, pero existen otros como el sobresueldo, los aguinaldos, incluso las gratificaciones, entre otros. Además se debe incorporar conceptos como haberes y descuentos legales asociados a cada colaborador.",
    kind: "Remuneraciones",
    subtype: ""
  },
  {
    question: "¿Qué es una Nómina?",
    answer: "La nómina es una herramienta que hace referencia y organiza los pagos que retribuyen las compañías a sus colaboradores (aquellos que tienen un vínculo por medio de un contrato laboral) por el desarrollo de sus tareas y funciones asignadas. ",
    kind: "Remuneraciones",
    subtype: ""
  },
  {
    question: "Liquidacion",
    answer: "Es un documento tangible (digital o físico) que BUK genera para cada empleado de una empresa de forma periódica, el cual refleja la remuneración o pago que recibe dicho empleado por la prestación de sus servicios laborales. La liquidación/comprobante está compuesta de tres grandes aspectos: Haberes/Devengos, Deberes/Deducciones y Aportes/Apropiaciones.",
    kind: "Remuneraciones",
    subtype: ""
  },
  {
    question: "Haberes",
    answer: "Los haberes/devengos hacen referencia a todos los ingresos que reciben los colaboradores como personas trabajadoras, antes de que se le apliquen las deducciones correspondientes. En otras palabras, los haberes/devengos son ese componente de la nómina que “suma”. ",
    kind: "Remuneraciones",
    subtype: ""
  },
  {
    question: "Deberes",
    answer: "A diferencia de los devengos, las deducciones conforman un componente de la nómina que “resta”. Son conceptos que debes descontar de la nómina de cada uno de los colaboradores, con su previa autorización, y que debes pagar a terceros.",
    kind: "Remuneraciones",
    subtype: ""
  },
  {
    question: "Aportes Patronales",
    answer: "Las apropiaciones/aportes patronales son aportes que se deben hacer como empresa con base en la nómina, y son adicionales a los pagos que se hacen a los colaboradores.",
    kind: "Remuneraciones",
    subtype: ""
  },
  {
    question: "Reliquidación",
    answer: "Es el proceso mediante el cual se distribuye un
              haber en partes iguales en los meses de un periodo determinado, de forma
              tal que en cada uno de esos meses, el monto distribuido, componga
              una nueva base imponible y tributable, afecta a los parámetros de cada
              mes.",
    kind: "Remuneraciones",
    subtype: ""
  },
  {
    question: "Finiquito",
    answer: "Es un acto por el cual un trabajador y un empleador ratifican o aprueban ante un Ministro de Fe el término de la relación laboral y su acuerdo con lo estipulado en un documento escrito.",
    kind: "Remuneraciones",
    subtype: ""
  },
  {
    question: "GeoVictoria",
    answer: "Geovictoria es una aplicación de control integral de asistencia, buk esta integrado con esta app permitiendoles sincronizar los datos que tiene geovictoria en licencias y permisos con buk. Actualmente en la aplicación existen dos integraciones diferentes con geovictoria, la versión 2 y la versión 3. ",
    kind: "HCM",
    subtype: ""
  },
  {
    question: "Generales",
    answer: "Son todas aquellas configuraciones que modifican distintos parámetros generales, y están disponibles en Configuración >> General y si eres administrador de la página en buk en cuestión. La mayoría de los parámetros se definen en el proceso de Implementación y la idea es que queden fijos desde ese instante en adelante. Puedes encontrar más información aquí: https://help.buk.cl/es/articles/3403776-configuracion-general",
    kind: "HCM",
    subtype: ""
  },
  {
    question: "DDJJ",
    answer: "Es un proceso de información tributaria donde los contribuyentes deben entregar al Servicio de Impuestos Interno toda la información tributaria propia y de terceros, generada durante todo el año.",
    kind: "Remuneraciones",
    subtype: ""
  },
  {
    question: "LRE",
    answer: "Libro de remuneraciones electrónico: Permite a los empleadores informar estandarizada y mensualmente los pagos de las remuneraciones de sus trabajadores a la Dirección del Trabajo (DT).",
    kind: "Remuneraciones",
    subtype: ""
  },
  {
    question: "Importadores",
    answer: "Existen múltiples Importadores en BUK (Asistencia, Empleados, Trabajos, etc.) que permiten cargar información de dichas entidades en la base de datos del cliente de BUK. Algunos de estos importadores son utilizados exclusivamente en el proceso de implementación de un cliente, mientras que otros son utilizados para realizar acciones masivas sobre entidades ya existentes en el sistema (MODIFICACIÓN).",
    kind: "HCM",
    subtype: ""
  },
  {
    question: "¿Las vacaciones compensadas pueden ser administrativas? ",
    answer: "No, pueden ser solo progresivas.",
    kind: "HCM",
    subtype: ""
  },
  {
    question: "¿Qué es la Evaluación 360º?",
    answer: "Para mas info ir a: https://help.buk.cl/es/articles/4308041-evaluacion-360%C2%BA

    La Evaluación 360º es una evaluación integral que abarca la percepción del desempeño de un colaborador por parte de sus compañeros, subordinados, jefe directo y clientes internos, lo que permite obtener distintos puntos de vista sobre las fortalezas y los aspectos de mejora de un colaborador en relación a las competencias y habilidades que la organización ha definido como fundamentales para el desempeño de su cargo.

    A partir de hoy, además de la autoevaluación y la evaluación descendente ya disponibles en nuestra plataforma, podrás incluir en tus procesos, la evaluación ascendente y la evaluación paralela para evaluar el desempeño de tus colaboradores. • Tendrás la opción de configurar formulario único o múltiples formularios para tus procesos. Estos formularios podrás asignarlos por tipo de evaluación y además por familia de cargo.",
    kind: "Talento",
    subtype: ""
  },
  {
    question: "¿Como configurar una Evaluación 360º?",
    answer: "Para mas info ir a: https://help.buk.cl/es/articles/4308041-evaluacion-360%C2%BA

    La Evaluación 360º es una evaluación integral que abarca la percepción del desempeño de un colaborador por parte de sus compañeros, subordinados, jefe directo y clientes internos, lo que permite obtener distintos puntos de vista sobre las fortalezas y los aspectos de mejora de un colaborador en relación a las competencias y habilidades que la organización ha definido como fundamentales para el desempeño de su cargo.

    A partir de hoy, además de la autoevaluación y la evaluación descendente ya disponibles en nuestra plataforma, podrás incluir en tus procesos, la evaluación ascendente y la evaluación paralela para evaluar el desempeño de tus colaboradores. • Tendrás la opción de configurar formulario único o múltiples formularios para tus procesos. Estos formularios podrás asignarlos por tipo de evaluación y además por familia de cargo.",
    kind: "Talento",
    subtype: ""
  },
  {
    question: "¿Qué es la Evaluación 360º?",
    answer: "Para mas info ir a: https://help.buk.cl/es/articles/4308041-evaluacion-360%C2%BA
    Para configurar una evaluación de desempeño, debes ir al menú:

    Talento > Desempeño > Evaluaciones > Nueva Evaluación.

    Podrás crear una nueva evaluación a partir de la configuración de una evaluación anterior, o realizar una nueva configuración.
    Para crear una evaluación debes configurar:
    - Nombre de la evaluación
    - Etapas del Proceso
    - Formularios
    - Escalas de Resultado
    - Participantes y Evaluadores",
    kind: "Talento",
    subtype: ""
  },
  {
    question: "Etapas del Proceso",
    answer: "Debes configurar los tipos de evaluación que tendrá tu proceso. Puedes elegir autoevaluación, evaluación descendente, evaluación ascendente y evaluación paralela.
    Debes asignar el peso que tendrá cada tipo de evaluación para el cálculo de la nota final.
    Podrás definir el orden en el cual se deben responder las evaluaciones.",
    kind: "Talento",
    subtype: ""
  },
  {
    question: "Etapas del Proceso",
    answer: "Puedes configurar formulario único o múltiples formularios para tu proceso.
    Si configuras más de un formulario, debes asignarlos a un tipo de evaluación.
    Además, tienes la opción de asignarlo por familia de cargo.

    - Debes elegir las secciones que va a incluir cada formulario.
    - Debes definir una escala para evaluar cada sección.
    - Debes asignar el peso que tendrá cada sección en el formulario.",
    kind: "Talento",
    subtype: ""
  },
]

Wiki.create(PREGUNTAS)
