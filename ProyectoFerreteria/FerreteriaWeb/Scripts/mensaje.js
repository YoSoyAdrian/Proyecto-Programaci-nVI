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
}

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
