/*CITATION:
DATE: 12/5/2022
Adapted: nodejs-starter-app
SCOPE: module
URL: github/osu-cs340-ecampus/nodejs-starter-app
*/

function deleteAstronomer(astronomerID) {
  // Put our data we want to send in a javascript object
  let data = {
      astronomer_id: astronomerID
  };

  // Setup our AJAX request
  var xhttp = new XMLHttpRequest();
  xhttp.open("DELETE", "/delete-astronomer/", true);
  xhttp.setRequestHeader("Content-type", "application/json");

  // Tell our AJAX request how to resolve
  xhttp.onreadystatechange = () => {
      if (xhttp.readyState == 4 && xhttp.status == 204) {

        // Add the new data to the table
        deleteRow(astronomerID);
        

      }
      else if (xhttp.readyState == 4 && xhttp.status != 204) {
          console.log("There was an error with the input.")
      }
  }
  // Send the request and wait for the response
  window.location.reload();
  xhttp.send(JSON.stringify(data));
}


function deleteRow(astronomerID){

  let table = document.getElementById("astronomers-table");
  for (let i = 0, row; row = table.rows[i]; i++) {
     //iterate through rows
     //rows would be accessed using the "row" variable assigned in the for loop
     if (table.rows[i].getAttribute("data-value") == astronomerID) {
          table.deleteRow(i);
          
          break;
     }
  }

}