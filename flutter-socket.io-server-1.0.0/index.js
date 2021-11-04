const path = require('path');
require('dotenv').config();

// DB Config
require('./database/config').dbConnection();


var express = require('express')
var cors = require('cors')
var app = express()

app.use(cors())

app.get('/products/:id', function (req, res, next) {
  res.json({msg: 'This is CORS-enabled for all origins!'})
})

app.listen(80, function () {
  console.log('CORS-enabled web server listening on port 80')
})

// Lectura y parseo del Body
app.use( express.json() );


// Node Server
const server = require('http').createServer(app);
module.exports.io = require('socket.io')(server);
require('./sockets/socket');


// Path público
const publicPath = path.resolve( __dirname, 'public' );
app.use( express.static( publicPath ) );



// Mis Rutas
app.use( '/api/login', require('./routes/auth') );



server.listen( process.env.PORT, ( err ) => {

    if ( err ) throw new Error(err);

    console.log('Servidor corriendo en puerto', process.env.PORT );

});