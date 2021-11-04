<<<<<<< HEAD
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

=======
const express = require('express');
const path = require('path');
require('dotenv').config();

//config linux

// DB Config
require('./database/config').dbConnection();

// App de Express
const app = express();
>>>>>>> 088cb63d4ad66606084363a60bd0d34d23caa4fa

// Node Server
const server = require('http').createServer(app);
module.exports.io = require('socket.io')(server);
require('./sockets/socket');


// Path público
const publicPath = path.resolve( __dirname, 'public' );
app.use( express.static( publicPath ) );

<<<<<<< HEAD


// Mis Rutas
app.use( '/api/login', require('./routes/auth') );



=======
>>>>>>> 088cb63d4ad66606084363a60bd0d34d23caa4fa
server.listen( process.env.PORT, ( err ) => {

    if ( err ) throw new Error(err);

    console.log('Servidor corriendo en puerto', process.env.PORT );

<<<<<<< HEAD
});
=======
});


>>>>>>> 088cb63d4ad66606084363a60bd0d34d23caa4fa
