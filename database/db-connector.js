/*CITATION:
DATE: 12/5/2022
Adapted: nodejs-starter-app
SCOPE: module
URL: github/osu-cs340-ecampus/nodejs-starter-app
*/
// ./database/db-connector.js

// Get an instance of mysql we can use in the app
var mysql = require('mysql')

// Create a 'connection pool' using the provided credentials
var pool = mysql.createPool({
    connectionLimit : 10,
    host            : 'classmysql.engr.oregonstate.edu',
    user            : 'cs340_deshazen',
    password        : '1297',
    database        : 'cs340_deshazen'
})

// Export it for use in our applicaiton
module.exports.pool = pool;