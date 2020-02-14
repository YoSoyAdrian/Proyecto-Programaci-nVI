$(document).ready(function () {
    $("#myBtn").click(function () {
        $("#myModal").modal();
    });
});

var correo = document.getElementsByName("email")[0];
var formulario = Document.getElementsByName("form2")[0];

    

function check() {

    var verificarUsuario = function () {
        if (correo == "adrianmejia99@gmail.com") {
            alert("Correcto");
        } else {
            alert("Incorrecto");
        }
    };
    
    var boton = document.getElementById('btnEntrar');

    boton.addEventListener("click", verificarUsuario());
    
};
