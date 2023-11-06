var trocadorLogin = document.getElementById("login");
var trocadorRegister = document.getElementById("register");

function redirecionarToRegister() {
    trocadorLogin.style.display = "none";
    trocadorRegister.style.display = "flex"
}

function redirecionarToLogin() {
    trocadorRegister.style.display = "none"; trocadorLogin.style.display = "flex"
}