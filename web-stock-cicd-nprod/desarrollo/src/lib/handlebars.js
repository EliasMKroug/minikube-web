const { format } = require('timeago.js');
const moment = require('moment');

const helpers = {
    // Formatea fechas relativas (ej: "hace 5 minutos")
    timeago: (timestamp) => format(timestamp),

    // Formatea fechas en DD/MM/YYYY, evitando errores si el valor es nulo
    formatDate: (date) => (date ? moment(date).format('DD/MM/YYYY') : ''),

    // Convierte un objeto en JSON (útil para debugging en Handlebars)
    json: (context) => JSON.stringify(context, null, 2),

    // Comparación de valores con múltiples operadores en Handlebars
    ifCond: function (v1, operator, v2, options) {
        switch (operator) {
            case '==': return (v1 == v2) ? options.fn(this) : options.inverse(this);
            case '===': return (v1 === v2) ? options.fn(this) : options.inverse(this);
            case '!=': return (v1 != v2) ? options.fn(this) : options.inverse(this);
            case '!==': return (v1 !== v2) ? options.fn(this) : options.inverse(this);
            case '<': return (v1 < v2) ? options.fn(this) : options.inverse(this);
            case '<=': return (v1 <= v2) ? options.fn(this) : options.inverse(this);
            case '>': return (v1 > v2) ? options.fn(this) : options.inverse(this);
            case '>=': return (v1 >= v2) ? options.fn(this) : options.inverse(this);
            case '&&': return (v1 && v2) ? options.fn(this) : options.inverse(this);
            case '||': return (v1 || v2) ? options.fn(this) : options.inverse(this);
            default: return options.inverse(this);
        }
    },

    // Helper simple para comparar igualdad (alternativa a ifCond para ==)
    eq: (a, b) => a === b
};

module.exports = helpers;
