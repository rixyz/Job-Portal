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
