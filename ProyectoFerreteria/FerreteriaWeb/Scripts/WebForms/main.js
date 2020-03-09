function mostrarContra() {
    var x = document.getElementById("txtPassword");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}
function GetValue(txtCantidad) {
    var control = eval(txtCantidad);
    alert(control.value);
}
$("txtCantidad").click(function () {
    var oID = $(this).attr("idDetalle");
    console.log(oID);
});
