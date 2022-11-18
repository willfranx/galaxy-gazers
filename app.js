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
app.use(express.static(__dirname + '/public'));
const { engine } = require('express-handlebars');
var exphbs = require('express-handlebars');     // Import express-handlebars
app.engine('.hbs', engine({extname: ".hbs"}));  // Create an instance of the handlebars engine to process templates
app.set('view engine', '.hbs');                 // Tell express to use the handlebars engine whenever it encounters a *.hbs file.

/*
    ROUTES
*/


//INDEX
app.get('/', function(req, res)
    {
        res.render('index');                   
    }); 

app.get('/index', function(req, res)
    {
        res.render('index');                   
    });     

//ASTRONOMERS
app.get('/astronomers', function(req, res)
    {
        let query1;

        // If there is no query string, we just perform a basic SELECT
        if (req.query.first_name === undefined)
        {
            query1 = "SELECT * FROM Astronomers;";
        }

        // If there is a query string, we assume this is a search, and return desired results
        else
        {
            query1 = `SELECT * FROM Astronomers WHERE first_name LIKE "${req.query.first_name}%"`
        }

        // Query 2 is the same in both cases
        let query2 = "SELECT * FROM Astronomers;";
        db.pool.query(query1, function(error, rows, fields){

            let sales = rows
            return res.render('astronomers', {data: rows, sales: sales});
        })
    });

app.post('/add-astronomer', function(req, res) 
{
    // Capture the incoming data and parse it back to a JS object
    let data = req.body;

    // Capture NULL values
    let social_media_handle = parseInt(data.social_media_handle);
    if (isNaN(social_media_handle))
    {
        social_media_handle = 'NULL'
    }

    // Create the query and run it on the database
    query1 = `INSERT INTO Astronomers (first_name, last_name, email, social_media_handle) VALUES ('${data['input-first-name']}', '${data['input-last-name']}', '${data['input-email']}', '${data['input-social-media-handle']}')`;
    db.pool.query(query1, function(error, rows, fields){

        // Check to see if there was an error
        if (error) {

            // Log the error to the terminal so we know what went wrong, and send the visitor an HTTP response 400 indicating it was a bad request.
            console.log(error)
            res.sendStatus(400);
        }
        else
        {
            res.redirect('/astronomers');
        }
    })
});

app.delete('/delete-astronomer-ajax/', function(req,res,next){
    let data = req.body;
    let astronomerID = parseInt(data.astronomer_id);
    let deleteAstronomerSale = `DELETE FROM Astronomer_Sales WHERE astronomer_id = ?`;
    let deleteAstronomer= `DELETE FROM Astronomers WHERE astronomer_id = ?`;
  
  
          // Run the 1st query
          db.pool.query(deleteAstronomerSale, [astronomerID], function(error, rows, fields){
              if (error) {
  
              // Log the error to the terminal so we know what went wrong, and send the visitor an HTTP response 400 indicating it was a bad request.
              console.log(error);
              res.sendStatus(400);
              }
  
              else
              {
                  // Run the second query
                  db.pool.query(deleteAstronomer, [astronomerID], function(error, rows, fields) {
  
                      if (error) {
                          console.log(error);
                          res.sendStatus(400);
                      } else {
                          res.sendStatus(204);
                      }
                  })
              }
  })});

//ASTRONOMER SALES
app.get('/astronomer_sales', function(req, res)
    {
        let query1;

        // If there is no query string, we just perform a basic SELECT
        if (req.query.astronomer_id === undefined)
        {
            query1 = "SELECT * FROM Astronomer_Sales;";
        }

        // If there is a query string, we assume this is a search, and return desired results
        else
        {
            query1 = `SELECT * FROM Astronomer_Sales WHERE astronomer_id LIKE "${req.query.astronomer_id}%"`
        }

        // Query 2 is the same in both cases
        let query2 = "SELECT * FROM Astronomer_Sales;";
        db.pool.query(query1, function(error, rows, fields){

            let sales = rows
            return res.render('astronomer_sales', {data: rows, sales: sales});
        })
    });

app.post('/add-astronomer-sale', function(req, res) 
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
            profit_due = 'NULL'
        }
    
        // Create the query and run it on the database
        query1 = `INSERT INTO Astronomer_Sales (astronomer_id, sale_id, profit_due) VALUES ('${data['input-astronomer-id']}', '${data['input-sale-id']}', '${data['input-profit-due']}')`;
        db.pool.query(query1, function(error, rows, fields){

            // Check to see if there was an error
            if (error) {
    
                // Log the error to the terminal so we know what went wrong, and send the visitor an HTTP response 400 indicating it was a bad request.
                console.log(error)
                res.sendStatus(400);
            }
    
            // If there was no error, we redirect back to our root route, which automatically runs the SELECT * FROM bsg_people and
            // presents it on the screen
            else
            {
                res.redirect('/astronomer_sales');
            }
        })
    });

app.delete('/delete-astronomer-sale-ajax/', function(req,res,next){
    let data = req.body;
    let astronomerSaleID = parseInt(data.id);
    let deleteAstronomerSale= `DELETE FROM Astronomer_Sales, Astronomers, Sales WHERE id = ?`;
    
        // Run the 1st query
        db.pool.query(deleteAstronomerSale, [astronomerSaleID], function(error, rows, fields){
            if (error) {
                    console.log(error);
                    res.sendStatus(400);
                } else {
                    res.sendStatus(204);
                }
    })
});

// CELESTIAL OBJECTS

app.get('/celestial_objects', function(req, res)
    {
        let query1 = "SELECT * FROM Celestial_Objects;";
        db.pool.query(query1, function(error, rows, fields){
            res.render('celestial_objects', {data: rows});
        })
    });

app.post('/add-celestial-object', function(req, res) 
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
        profit_due = 'NULL'
    }

    // Create the query and run it on the database
    query1 = `INSERT INTO Astronomer_Sales (astronomer_id, sale_id, profit_due) VALUES ('${data['input-astronomer-id']}', '${data['input-sale-id']}', '${data['input-profit-due']}')`;
    db.pool.query(query1, function(error, rows, fields){

        // Check to see if there was an error
        if (error) {

            // Log the error to the terminal so we know what went wrong, and send the visitor an HTTP response 400 indicating it was a bad request.
            console.log(error)
            res.sendStatus(400);
        }

        // If there was no error, we redirect back to our root route, which automatically runs the SELECT * FROM bsg_people and
        // presents it on the screen
        else
        {
            res.redirect('/astronomer_sales');
        }
    })
});

// CUSTOMERS

    app.get('/customers', function(req, res)
    {
        let query1 = "SELECT * FROM Customers;";
        db.pool.query(query1, function(error, rows, fields){
            res.render('customers', {data: rows});
        })
    });

//PRINTS

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