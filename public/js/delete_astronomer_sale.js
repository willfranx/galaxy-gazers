function deleteAstronomerSale(astronomerSaleID) {
  // Put our data we want to send in a javascript object
  let link = '/delete-astronomer-sale-ajax';
  let data = {
    id: astronomerSaleID
  };

  $.ajax({
    url: link,
    type: 'DELETE',
    data: JSON.stringify(data),
    contentType: "application/json; charset=utf-8",
    success: function(result) {
      deleteRow(astronomerSaleID);
    }
  });
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