# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PREGUNTAS = [
  {
    question: "¿Qué es una Remuneración?",
    answer: "Art. 41. Código del Trabajo: “Se entiende por remuneración las contraprestaciones en dinero y las adicionales en especie avaluables en dinero que debe percibir el trabajador del empleador por causa del contrato de trabajo”. Se necesita de un riguroso cálculo para pagar las remuneraciones y existen distintos conceptos. El sueldo es uno de los más conocidos, pero existen otros como el sobresueldo, los aguinaldos, incluso las gratificaciones, entre otros. Además se debe incorporar conceptos como haberes y descuentos legales asociados a cada colaborador.",
    type: "",
    subtype: ""
  },
  {
    question: "¿Qué es una Nómina?",
    answer: "La nómina es una herramienta que hace referencia y organiza los pagos que retribuyen las compañías a sus colaboradores (aquellos que tienen un vínculo por medio de un contrato laboral) por el desarrollo de sus tareas y funciones asignadas. ",
    type: "",
    subtype: ""
  },
  {
    question: "Liquidacion",
    answer: "Es un documento tangible (digital o físico) que BUK genera para cada empleado de una empresa de forma periódica, el cual refleja la remuneración o pago que recibe dicho empleado por la prestación de sus servicios laborales. La liquidación/comprobante está compuesta de tres grandes aspectos: Haberes/Devengos, Deberes/Deducciones y Aportes/Apropiaciones.",
    type: "",
    subtype: ""
  },
  {
    question: "Haberes",
    answer: "Los haberes/devengos hacen referencia a todos los ingresos que reciben los colaboradores como personas trabajadoras, antes de que se le apliquen las deducciones correspondientes. En otras palabras, los haberes/devengos son ese componente de la nómina que “suma”. ",
    type: "",
    subtype: ""
  },
  {
    question: "Aportes Patronales",
    answer: "Las apropiaciones/aportes patronales son aportes que se deben hacer como empresa con base en la nómina, y son adicionales a los pagos que se hacen a los colaboradores.",
    type: "",
    subtype: ""
  },
  {
    question: "Reliquidación",
    answer: "Es el proceso mediante el cual se distribuye un
              haber en partes iguales en los meses de un periodo determinado, de forma
              tal que en cada uno de esos meses, el monto distribuido, componga
              una nueva base imponible y tributable, afecta a los parámetros de cada
              mes.",
    type: "",
    subtype: ""
  },
  {
    question: "Finiquito",
    answer: "Es un acto por el cual un trabajador y un empleador ratifican o aprueban ante un Ministro de Fe el término de la relación laboral y su acuerdo con lo estipulado en un documento escrito.",
    type: "",
    subtype: ""
  },
  {
    question: "GeoVictoria",
    answer: "Geovictoria es una aplicación de control integral de asistencia, buk esta integrado con esta app permitiendoles sincronizar los datos que tiene geovictoria en licencias y permisos con buk. Actualmente en la aplicación existen dos integraciones diferentes con geovictoria, la versión 2 y la versión 3. ",
    type: "",
    subtype: ""
  },
  {
    question: "Generales",
    answer: "Son todas aquellas configuraciones que modifican distintos parámetros generales, y están disponibles en Configuración >> General y si eres administrador de la página en buk en cuestión. La mayoría de los parámetros se definen en el proceso de Implementación y la idea es que queden fijos desde ese instante en adelante. Puedes encontrar más información aquí: https://help.buk.cl/es/articles/3403776-configuracion-general",
    type: "",
    subtype: ""
  },
]

Wiki.create(PREGUNTAS)
