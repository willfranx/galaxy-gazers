// Get the objects we need to modify
let updateAstronomerForm = document.getElementById('update-astronomer-form');

// Modify the objects we need
updateAstronomerForm.addEventListener("submit", function (e) {
   
    // Prevent the form from submitting
    e.preventDefault();

    // Get form fields we need to get data from
    let inputFullName = document.getElementById("mySelect");
    let updateFirstName = document.getElementById("update-first-name");
    let updateLastName = document.getElementById("update-last-name");
    let updateEmail = document.getElementById("update-email");
    let updateSocialMediaHandle = document.getElementById("update-social-media-handle");

    // Get the values from the form fields
    let astronomerID = inputFullName.value;
    let firstNameValue = updateFirstName.value;
    let lastNameValue = updateLastName.value;
    let emailValue = updateEmail.value;
    let socialMediaHandleValue = updateSocialMediaHandle.value;


    // Put our data we want to send in a javascript object
    let data = {
        astronomer_id: astronomerID,
        first_name: firstNameValue,
        last_name: lastNameValue,
        email: emailValue,
        social_media_handle: socialMediaHandleValue
    }
    
    // Setup our AJAX request
    var xhttp = new XMLHttpRequest();
    xhttp.open("PUT", "/put-astronomer", true);
    xhttp.setRequestHeader("Content-type", "application/json");

    // Tell our AJAX request how to resolve
    xhttp.onreadystatechange = () => {
        if (xhttp.readyState == 4 && xhttp.status == 200) {

            // Add the new data to the table
            updateRow(xhttp.response, fullNameValue);

        }
        else if (xhttp.readyState == 4 && xhttp.status != 200) {
            console.log("There was an error with the input.")
        }
    }

    // Send the request and wait for the response
    window.location.reload();
    xhttp.send(JSON.stringify(data));

})


function updateRow(data, astronomerID){
    let parsedData = JSON.parse(data);
    
    let table = document.getElementById("astronomer-table");

    for (let i = 0, row; row = table.rows[i]; i++) {
       //iterate through rows
       //rows would be accessed using the "row" variable assigned in the for loop
       if (table.rows[i].getAttribute("data-value") == astronomerID) {

            // Get the location of the row where we found the matching person ID
            let updateRowIndex = table.getElementsByTagName("tr")[i];

            // Get td of value
            let td1 = updateRowIndex.getElementsByTagName("td")[1];
            // Reassign to updated value
            td1.innerHTML = parsedData[0].first_name; 

            let td2 = updateRowIndex.getElementsByTagName("td")[2];
            td2.innerHTML = parsedData[0].last_name; 

            let td3 = updateRowIndex.getElementsByTagName("td")[3];
            td3.innerHTML = parsedData[0].email; 

            let td4 = updateRowIndex.getElementsByTagName("td")[4];
            td4.innerHTML = parsedData[0].social_media_handle;
       }
    }
}