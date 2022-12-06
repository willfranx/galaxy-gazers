function deleteAstronomerSale(astronomerSaleID) {

  let data = {
      id: astronomerSaleID
  };

  // Setup AJAX request
  var xhttp = new XMLHttpRequest();
  xhttp.open("DELETE", "/delete-astronomer-sale/", true);
  xhttp.setRequestHeader("Content-type", "application/json");


  xhttp.onreadystatechange = () => {
      if (xhttp.readyState == 4 && xhttp.status == 204) {

        deleteRow(astronomerSaleID);
        

      }
      else if (xhttp.readyState == 4 && xhttp.status != 204) {
          console.log("There was an error with the input.")
      }
  }
  window.location.reload();
  xhttp.send(JSON.stringify(data));
}


function deleteRow(astronomerSaleID){

  let table = document.getElementById("astronomer-sales-table");
  for (let i = 0, row; row = table.rows[i]; i++) {

     if (table.rows[i].getAttribute("data-value") == astronomerSaleID) {
          table.deleteRow(i);
          
          break;
     }
  }

}