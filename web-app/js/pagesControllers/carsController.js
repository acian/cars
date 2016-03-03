/* Limpia el formulario del popup */
function clearDialog() {
    $('#id').val(null);
    document.querySelector('#year').parentNode.MaterialTextfield.change("");
    document.querySelector('#make').parentNode.MaterialTextfield.change("");
    document.querySelector('#model').parentNode.MaterialTextfield.change("");
};

/* Configuracion del popup */
var dialog = document.querySelector('dialog');
var showDialogButton = document.querySelector('#newCarBtn');
if (!dialog.showModal) {
    dialogPolyfill.registerDialog(dialog);
}
showDialogButton.addEventListener('click', function() {
    clearDialog();
    $('#popupTitle').html("New Car");
    dialog.showModal();
});

dialog.querySelector('.close').addEventListener('click', function() {
    dialog.close();
});

// GET ALL CAR
var getAll = function() {
    var succcessAllCarList = function(data) {
        var carTBody = $('#carTBody');

        carTBody.html("");

        $.each(data.content.items, function(index, value) {
            carTBody.append("<tr><td><a href='#' onclick='openPopup(" + value.id + ");'>" + value.id + "</a></td>" +
                "                <td class='mdl-data-table__cell--non-numeric'><a href='#' onclick='openPopup(" + value.id + ");'>" + value.year + "</a></td>" +
                "                <td class='mdl-data-table__cell--non-numeric'><a href='#' onclick='openPopup(" + value.id + ");'>" + value.make + "</a></td>" +
                "                <td class='mdl-data-table__cell--non-numeric'><a href='#' onclick='openPopup(" + value.id + ");'>" + value.model + "</a></td>" +
                "            </tr>");
        });

        localStorage.setItem('cantItems', data.content.cantItems);

        setPagination();
    }

    var errorAllCarList = function() {
        alert("Error");
    }


    var currentPageFromLocal = localStorage.getItem('currentPage');

    if(typeof currentPageFromLocal === 'undefined'){
        currentPageFromLocal = 1;
        localStorage.setItem('currentPage', currentPageFromLocal);
    }

    var datos = {
        paginaActual : currentPageFromLocal
    }

    $.ajax({
        url: "/cars/api/cars?currentPage="+currentPageFromLocal+"&year="+$("#yearFilter").val()+"&make="+$("#makeFilter").val()+"&model="+$("#modelFilter").val(),
        contentType: 'application/text; charset=utf-8',
        type: 'GET',
        data: JSON.stringify(datos),
        dataType: 'JSON',
        success: succcessAllCarList,
        error: errorAllCarList
    });
}

// GET CAR BY ID
function openPopup(id) {
    var successGetCar = function(data) {
        $('#popupTitle').html("Edit Car");

        $('#id').val(data.id);
        document.querySelector('#year').parentNode.MaterialTextfield.change(data.year);
        document.querySelector('#make').parentNode.MaterialTextfield.change(data.make);
        document.querySelector('#model').parentNode.MaterialTextfield.change(data.model);
    }

    var failGetCar = function() {
        alert("fallo failGetCar");
    }

    $.ajax({
        url: "/cars/api/cars/"+id,
        contentType: 'application/text; charset=utf-8',
        type: 'GET',
        dataType: 'JSON',
        success: successGetCar,
        error: failGetCar
    });

    dialog.showModal();
}

// DELETE CAR
var deleteCar = function() {
    // DELETE CAR
    var successDelCar = function() {
        dialog.close();
        getAll();
    }

    var failDelCar = function () {
        alert("Fallo el borrado");
    }

    /*data: {
     "id" : $('#id').val(),
     "year" : $('#year').c,
     "make" : $('#make').val(),
     "model" : $('#model').val()
     },*/

    $.ajax({
        url: "/cars/api/cars/" + $('#id').val(),
        contentType: 'application/text; charset=utf-8',
        type: 'DELETE',
        dataType: 'JSON',
        success: successDelCar,
        error: failDelCar
    });
}

// UPDATE CAR
var updateCar = function() {
    // UPDATE CAR
    var successUpdateCar = function() {
        dialog.close();
        getAll();
    };

    var failUpdateCar = function () {
        alert("Fallo el update");
    };

    var datos = {
        "id" : $('#id').val(),
        "year" : $('#year').val(),
        "make" : $('#make').val(),
        "model" : $('#model').val()
    };

    if(datos.id == null || datos.id == "") {
        $.ajax({
            url: "/cars/api/cars/" + $('#id').val(),
            contentType: 'application/text; charset=utf-8',
            type: 'POST',
            dataType: 'JSON',
            data: JSON.stringify(datos),
            success: successUpdateCar,
            error: failUpdateCar
        });
    } else {
        $.ajax({
            url: "/cars/api/cars/" + $('#id').val(),
            contentType: 'application/text; charset=utf-8',
            type: 'PUT',
            dataType: 'JSON',
            data: JSON.stringify(datos),
            success: successUpdateCar,
            error: failUpdateCar
        });
    };
};


$(document).ready(function(){
    getAll();

    $("#findBtn").click(function() {
        localStorage.setItem('currentPage', 1);
        getAll();
    });

    $("#addOwnerBtn").click(function() {
        $("#ownerFinder").show();
    });

    $("#saveOwnerBtn").click(function() {
        $("#ownerFinder").hide();
    });

    $("#ownerFinder").hide();
});