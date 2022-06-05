/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

function Validate() {
    var pass = document.getElementById("password").value;
    var reppass = document.getElementById("rep-password").value;
    console.log(pass + " " + reppass);

    if (pass !== reppass) {
        alert("Password doesn't match");
        return false;
    }
    return true;
}
