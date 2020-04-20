mensajeRedirect = function (titulo, texto, tipo, url) {
    Swal.fire({
        title: `${titulo}`,
        text: `${texto}`,
        type: `${tipo}`,
        confirmButtonText: 'Aceptar',
        allowEscapeKey: true,
        allowOutsideClick: false
    }).then(function () {
        window.location.href = `${url}`;
    });
}
mensaje = function (titulo, texto, tipo) {
    Swal.fire({
        title: `${titulo}`,
        text: `${texto}`,
        type: `${tipo}`,
        confirmButtonText: 'Aceptar',
        allowEscapeKey: true,
        allowOutsideClick: false
    });
};
mensajeConfirm = function (titulo) {
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000,
        timerProgressBar: true,
        onOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
    })

    Toast.fire({
        icon: 'success',
        title: `${titulo}`
    })
};

function contrasenna() {

    (async () => {

        //const { value: password } = await Swal.fire({
        //    title: 'Nueva contraseña',
        //    input: 'password',
        //    ,
        //    inputAttributes: {
        //        maxlength: 10,
        //        autocapitalize: 'off',
        //        autocorrect: 'off'
        //    }
        //})
        const { value: password } = await Swal.fire({
            title: 'Escriba la nueva contraseña',
            html:
                '<form id="form1">' +
                '<div class="row">' +
                '<div class="col-md-12">' +
                '</div>' +
                '<div class="input-group col-md-8">' +
                '<input ID="txtPassword" type="Password" Class="form-control">' +
                '</div>' +
                '<div class=" col-md-2">' +
                '<span onclick="mostrarContrasena()" class="material-icons btn">visibility</span>' +
                '</div>' +
                '</form>',

            focusConfirm: false,
            preConfirm: () => {
                return [
                    document.getElementById('password').value

                ]
            }
        })

    })()
};

function mostrarContrasena() {
    var tipo = document.getElementById("txtPassword");
    if (tipo.type == "password") {
        tipo.type = "text";
    } else {
        tipo.type = "password";
    }
}
function info() {
    Swal.fire(
        'Sabías que?',
        'Al registrarte obtienes un rango que mejora con la cantidad de compras que realices',
        'question',
        
    )
};