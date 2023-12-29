const mysql = require('mysql2/promise');

const dsn = {
    host: 'localhost',
    database: 'db_api_mds',
    user: 'root',
    password: 'root',
};

module.exports = {dsn, mysql}