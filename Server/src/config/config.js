require("dotenv").config();
var Connection = require('tedious').Connection;
const dbDetails = {
    username: process.env.DB_USER,
    password: process.env.DB_PASSWORD || "",
    database: process.env.DB_DATABASE,
    host: process.env.DB_SERVER,
    dialect: "mssql",
    port: process.env.DB_PORT,
    options: {
        trustServerCertificate: false
    }
};
const Sequelize = require('sequelize')
const sequelize = new Sequelize(process.env.DB_DATABASE,
    process.env.DB_USER,
    process.env.DB_PASSWORD||'', {
        host: process.env.DB_SERVER,
        port: process.env.DB_PORT,
        dialect: 'mssql',
        logging: console.log,
        freezeTableName: true,
        encrypt: false,
        tls: {
            // do not fail on invalid certs
            rejectUnauthorized: false
        },

        pool: {
            max: 1000000,
            min: 0,
            acquire: 30000,
            idle: 10000
        }
    })


module.exports = {
    sequelize: sequelize,
    development: dbDetails,
    test: dbDetails,
    production: dbDetails
};