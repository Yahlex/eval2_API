const swaggerAutogen = require('swagger-autogen')()

const outputFile = './swagger_output.json'

const endpointsFiles = ['./routes/index.js, ./routes/terrains.js', './routes/authentification.js', './routes/reservations.js']

const doc = {
    info: {
        title: 'web API RESTful',
        description: 'Bonjour',
    },
    host: 'localhost:3000',
    schemes: ['http'],
};

swaggerAutogen(outputFile, endpointsFiles, doc)
