// Get the objects we need to modify
let addAstronomerSaleForm = document.getElementById('add-astronomer-sale-form-ajax');

// Modify the objects we need
addAstronomerSaleForm.addEventListener("submit", function (e) {
    
    // Prevent the form from submitting
    e.preventDefault();

    // Get form fields we need to get data from
    let inputAstronomerID = document.getElementById("input-astronomer-id");
    let inputSaleID = document.getElementById("input-sale-id");
    let inputProfitDue = document.getElementById("input-profit-due");

    // Get the values from the form fields
    let astronomerIDValue = inputAstronomerID.value;
    let saleIDValue = inputSaleID.value;
    let profitDueValue = inputProfitDue.value;

    // Put our data we want to send in a javascript object
    let data = {
        astronomer_id: astronomerIDValue,
        sale_id: saleIDValue,
        profit_due: profitDueValue,
    }
    
    // Setup our AJAX request
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", "/add-astronomer-sale-ajax", true);
    xhttp.setRequestHeader("Content-type", "application/json");

    // Tell our AJAX request how to resolve
    xhttp.onreadystatechange = () => {
        if (xhttp.readyState == 4 && xhttp.status == 200) {

            // Add the new data to the table
            addRowToTable(xhttp.response);

            // Clear the input fields for another transaction
            inputAstronomerID.value = '';
            inputSaleID.value = '';
            inputProfitDue.value = '';
        }
        else if (xhttp.readyState == 4 && xhttp.status != 200) {
            console.log("There was an error with the input.")
        }
    }

    // Send the request and wait for the response
    xhttp.send(JSON.stringify(data));

})


// Creates a single row from an Object representing a single record from 
// bsg_people
addRowToTable = (data) => {

    // Get a reference to the current table on the page and clear it out.
    let currentTable = document.getElementById("astronomer-sales-table");

    // Get the location where we should insert the new row (end of table)
    let newRowIndex = currentTable.rows.length;

    // Get a reference to the new row from the database query (last object)
    let parsedData = JSON.parse(data);
    let newRow = parsedData[parsedData.length - 1]

    // Create a row and 4 cells
    let row = document.createElement("TR");
    let idCell = document.createElement("TD");
    let astronomerIDCell = document.createElement("TD");
    let saleIDCell = document.createElement("TD");
    let profitDueCell = document.createElement("TD");

    let deleteCell = document.createElement("TD");

    // Fill the cells with correct data
    idCell.innerText = newRow.id;
    astronomerIDCell.innerText = newRow.astronomer_id;
    saleIDCell.innerText = newRow.sale_id;
    profitDueCell.innerText = newRow.profit_due;

    deleteCell = document.createElement("button");
    deleteCell.innerHTML = "Delete";
    deleteCell.onclick = function(){
        deleteAstronomerSale(newRow.id);
    };

    // Add the cells to the row 
    row.appendChild(idCell);
    row.appendChild(astronomerIDCell);
    row.appendChild(saleIDCell);
    row.appendChild(profitDueCell);
    row.appendChild(deleteCell);
    
    // Add a custom row attribute so the deleteRow function can find a newly added row
    row.setAttribute('data-value', newRow.id);

    // Add the row to the table
    currentTable.appendChild(row);

    // Find drop down menu, create a new option, fill data in the option (full name, id),
    // then append option to drop down menu so newly created rows via ajax will be found in it without needing a refresh
    let selectMenu = document.getElementById("mySelect");
    let option = document.createElement("option");
    option.text = newRow.sale_id;
    option.value = newRow.id;
    selectMenu.add(option);
}