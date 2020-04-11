


$(document).ready(function () {
    $("#myInput").on("keyup", function () {
        var value = $(this).val().toLocaleLowerCase();
        $("#grvCupon").filter(function () {
            $(this).toggle($(this).text().toLocaleLowerCase().indexOf(value) > -1)
        });
    });
});


