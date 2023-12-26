var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const swaggerUi = require('swagger-ui-express')
const swaggerFile = require('./swagger_output.json')
var indexRouter = require('./routes/index');
var terrainRouter = require('./routes/terrains'); // Ajout de la ligne pour le routeur des terrains
// const creneauxRouter = require('./routes/creneaux');
// const reservationsRouter = require('./routes/reservations');


var app = express();

var http = require('http');

/**
 * Get port from environment and store in Express.
 */

var port = 3000 ;
app.set('port', port);

/**
 * Create HTTP server.
 */

var server = http.createServer(app);

/**
 * Listen on provided port, on all network interfaces.
 */

server.listen(port);

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

/**
 * Enregistrement des routes
 */
app.use('/', indexRouter);
app.use('/', terrainRouter); // Utilisation du routeur des terrains pour les URLs commencant par /terrain
// app.use('/creneaux',creneauxRouter);
// app.use('/reservation',reservationsRouter);


/**
 * Configuration Swagger, exposition de la doc sur la route /doc
 */
app.use('/doc', swaggerUi.serve, swaggerUi.setup(swaggerFile))

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.send('Error');
});

module.exports = app;
