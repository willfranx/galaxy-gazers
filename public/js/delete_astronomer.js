function deleteAstronomer(astronomerID) {
  // Put our data we want to send in a javascript object
  let link = '/delete-astronomer-ajax/';
  let data = {
    id: astronomerID
  };

  $.ajax({
    url: link,
    type: 'DELETE',
    data: JSON.stringify(data),
    contentType: "application/json; charset=utf-8",
    success: function(result) {
      deleteRow(astronomerID);
    }
  });
}


function deleteRow(astronomerID){
  let table = document.getElementById("astronomers-table");
  for (let i = 0, row; row = table.rows[i]; i++) {
     if (table.rows[i].getAttribute("data-value") == astronomerID) {
          table.deleteRow(i);
          break;
     }
  }
}