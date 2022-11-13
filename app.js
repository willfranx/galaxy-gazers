// App.js

/*
    SETUP
*/

var express = require('express');   // We are using the express library for the web server
var app     = express();            // We need to instantiate an express object to interact with the server in our code
app.use(express.json())
app.use(express.urlencoded({extended: true}))
PORT        = 8021;                 // Set a port number at the top so it's easy to change in the future

// Database
var db = require('./database/db-connector')

// app.js

const { engine } = require('express-handlebars');
var exphbs = require('express-handlebars');     // Import express-handlebars
app.engine('.hbs', engine({extname: ".hbs"}));  // Create an instance of the handlebars engine to process templates
app.set('view engine', '.hbs');                 // Tell express to use the handlebars engine whenever it encounters a *.hbs file.

/*
    ROUTES
*/


// app.js

app.get('/', function(req, res)
    {
        res.render('index');                   
    }); 

app.get('/index', function(req, res)
    {
        res.render('index');                   
    });     

app.get('/astronomers', function(req, res)
    {
        let query1 = "SELECT * FROM Astronomers;";
        db.pool.query(query1, function(error, rows, fields){
            res.render('astronomers', {data: rows});
        })
    });

app.get('/astronomer_sales', function(req, res)
    {
        let query1 = "SELECT * FROM Astronomer_Sales;";
        db.pool.query(query1, function(error, rows, fields){
            res.render('astronomer_sales', {data: rows});
        })
    });

app.post('/add-astronomer-sale-ajax', function(req, res) 
    {
        // Capture the incoming data and parse it back to a JS object
        let data = req.body;
    
        // Capture NULL values
        let astronomer_id = parseInt(data.astronomer_id);
        if (isNaN(astronomer_id))
        {
            astronomer_id = 'NULL'
        }
    
        let sale_id = parseInt(data.sale_id);
        if (isNaN(astronomer_id))
        {
            sale_id = 'NULL'
        }
    
        let profit_due = parseInt(data.profit_due);
        if (isNaN(profit_due))
        {
            astronomer_id = 'NULL'
        }
    
        // Create the query and run it on the database
        query1 = `INSERT INTO Astronomer_Sales (astronomer_id, sale_id, profit_due) VALUES ('${astronomer_id}', '${sale_id}', ${profit_due})`;
        db.pool.query(query1, function(error, rows, fields){
    
            // Check to see if there was an error
            if (error) {
    
                // Log the error to the terminal so we know what went wrong, and send the visitor an HTTP response 400 indicating it was a bad request.
                console.log(error)
                res.sendStatus(400);
            }
            else
            {
                // If there was no error, perform a SELECT * on astronomers
                query2 = `SELECT * FROM Astronomer_Sales;`;
                db.pool.query(query2, function(error, rows, fields){
    
                    // If there was an error on the second query, send a 400
                    if (error) {
                        
                        // Log the error to the terminal so we know what went wrong, and send the visitor an HTTP response 400 indicating it was a bad request.
                        console.log(error);
                        res.sendStatus(400);
                    }
                    // If all went well, send the results of the query back.
                    else
                    {
                        res.send(rows);
                    }
                })
            }
        })
    });

app.get('/celestial_objects', function(req, res)
    {
        let query1 = "SELECT * FROM Celestial_Objects;";
        db.pool.query(query1, function(error, rows, fields){
            res.render('celestial_objects', {data: rows});
        })
    });

app.get('/customers', function(req, res)
    {
        let query1 = "SELECT * FROM Customers;";
        db.pool.query(query1, function(error, rows, fields){
            res.render('customers', {data: rows});
        })
    });

app.get('/prints', function(req, res)
    {
        let query1 = "SELECT * FROM Prints;";
        db.pool.query(query1, function(error, rows, fields){
            res.render('prints', {data: rows});
        })
    });

app.get('/print_sales', function(req, res)
    {
        let query1 = "SELECT * FROM Print_Sales;";
        db.pool.query(query1, function(error, rows, fields){
            res.render('print_sales', {data: rows});
        })
    });

/*
    LISTENER
*/
app.listen(PORT, function(){            // This is the basic syntax for what is called the 'listener' which receives incoming requests on the specified PORT.
    console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.')
});