const mongoose = require('mongoose');

<<<<<<< HEAD

const dbConnection = async() => {

    try {
        await mongoose.connect( process.env.DB_CONNECTION, {
            useNewUrlParser: true,
            useUnifiedTopology: true,
        });

=======
const dbConnection = async() => {

    try {
>>>>>>> 088cb63d4ad66606084363a60bd0d34d23caa4fa
        console.log('DB Online');
        

    } catch (error) {
        console.log(error);
        throw new Error('Error en la base de datos - Hable con el admin');
    }
<<<<<<< HEAD

=======
>>>>>>> 088cb63d4ad66606084363a60bd0d34d23caa4fa
}

module.exports = {
    dbConnection
}