/* Limpia el formulario del popup */
function clearDialog() {
    $('#id').val(null);
    document.querySelector('#dni').parentNode.MaterialTextfield.change("");
    document.querySelector('#lastName').parentNode.MaterialTextfield.change("");
    document.querySelector('#name').parentNode.MaterialTextfield.change("");
    document.querySelector('#nationality').parentNode.MaterialTextfield.change("");
};

/* Configuracion del popup */
var dialog = document.querySelector('dialog');
var showDialogButton = document.querySelector('#newOwnerBtn');

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

// GET ALL Owners
var getAll = function() {
    var succcessAllOwnerList = function(data) {
        var ownerTBody = $('#ownerTBody');

        ownerTBody.html("");

        $.each(data.content.items, function(index, value) {
            ownerTBody.append("<tr><td><a href='#' onclick='openPopup(" + value.id + ");'>" + value.id + "</a></td>" +
                "                <td class='mdl-data-table__cell--non-numeric'><a href='#' onclick='openPopup(" + value.id + ");'>" + value.dni + "</a></td>" +
                "                <td class='mdl-data-table__cell--non-numeric'><a href='#' onclick='openPopup(" + value.id + ");'>" + value.lastName + "</a></td>" +
                "                <td class='mdl-data-table__cell--non-numeric'><a href='#' onclick='openPopup(" + value.id + ");'>" + value.name + "</a></td>" +
                "                <td class='mdl-data-table__cell--non-numeric'><a href='#' onclick='openPopup(" + value.id + ");'>" + value.nationality + "</a></td>" +
                "            </tr>");
        });

        localStorage.setItem('cantItems', data.content.cantItems);

        setPagination();
    }

    var errorAllOwnerList = function() {
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
        url: "/cars/api/owners?currentPage="+currentPageFromLocal+"&dni="+$("#dniFilter").val()+"&lastName="+$("#lastNameFilter").val()+"&name="+$("#nameFilter").val()+"&nationality="+$("#nationalityFilter").val(),
        contentType: 'application/text; charset=utf-8',
        type: 'GET',
        data: JSON.stringify(datos),
        dataType: 'JSON',
        success: succcessAllOwnerList,
        error: errorAllOwnerList
    });
}

// GET OWNER BY ID
function openPopup(id) {
    var successGetOwner = function(data) {
        $('#popupTitle').html("Edit Owner");

        $('#id').val(data.id);
        document.querySelector('#dni').parentNode.MaterialTextfield.change(data.dni);
        document.querySelector('#lastName').parentNode.MaterialTextfield.change(data.lastName);
        document.querySelector('#name').parentNode.MaterialTextfield.change(data.name);
        document.querySelector('#nationality').parentNode.MaterialTextfield.change(data.nationality);
    }

    var failGetOwner = function() {
        alert("fallo failGetOwner");
    }

    $.ajax({
        url: "/cars/api/owners/"+id,
        contentType: 'application/text; charset=utf-8',
        type: 'GET',
        dataType: 'JSON',
        success: successGetOwner,
        error: failGetOwner
    });

    dialog.showModal();
}

// DELETE OWNER
var deleteOwner = function() {
    // DELETE CAR
    var successDelOwner = function() {
        dialog.close();
        localStorage.setItem('currentPage', 1);
        getAll();
    }

    var failDelOwner = function () {
        alert("Fallo el borrado");
    }

    $.ajax({
        url: "/cars/api/owners/" + $('#id').val(),
        contentType: 'application/text; charset=utf-8',
        type: 'DELETE',
        dataType: 'JSON',
        success: successDelOwner,
        error: failDelOwner
    });
}

// UPDATE OWNER
var updateOwner = function() {
    var successUpdateOwner = function() {
        dialog.close();
        getAll();
    };

    var failUpdateOwner = function () {
        alert("Fallo el update");
    };

    var datos = {
        "id" : $('#id').val(),
        "dni" : $('#dni').val(),
        "lastName" : $('#lastName').val(),
        "name" : $('#name').val(),
        "nationality" : $('#nationality').val()
    };

    if(datos.id == null || datos.id == "") {
        $.ajax({
            url: "/cars/api/owners/" + $('#id').val(),
            contentType: 'application/text; charset=utf-8',
            type: 'POST',
            dataType: 'JSON',
            data: JSON.stringify(datos),
            success: successUpdateOwner,
            error: failUpdateOwner
        });
    } else {
        $.ajax({
            url: "/cars/api/owners/" + $('#id').val(),
            contentType: 'application/text; charset=utf-8',
            type: 'PUT',
            dataType: 'JSON',
            data: JSON.stringify(datos),
            success: successUpdateOwner,
            error: failUpdateOwner
        });
    };
};


$(document).ready(function(){
    getAll();

    $("#findBtn").click(function() {
        localStorage.setItem('currentPage', 1);
        getAll();
    });
});