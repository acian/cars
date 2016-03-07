/**
 * Created by jfn on 03/03/16.
 */

$(document).ready(function() {

    $("#findOwnerPopupBtn").click(function() {
        $("#findOwnerPopupBtn").hide();

        document.querySelector('#ownerLastName').parentNode.MaterialTextfield.change("");
        $("#placeHolerOwnerFinder").html("Enter Last Name To Find");
        $("#ownerLastName").width(300);
        $("#placeHolerOwnerFinder").width(300);

        $("#ownerFinder").show();
        $("#ownerLastName").prop('disabled', false);
        $('#ownerPopupFinderTBody').html("");
    });

    $("#ownerFinder").hide();
    $("#findOwnerPopupBtn").show();
    $("#iconBtnFinder").html("person_add");

    $("#ownerLastName").keyup(function() {
        if($(this).val().length > 0)
            buscarOwner();
    });

    var buscarOwner = function() {
        var succcessOwnerFinderList = function(data) {
            var ownerTBody = $('#ownerPopupFinderTBody');

            ownerTBody.html("");

            $.each(data.content.items, function(index, value) {
                ownerTBody.append("<tr>" +
                    "                <td class='mdl-data-table__cell--non-numeric'><a class='tableItemsPopup' href='#' onclick='getOwnerById(" + value.id + ");'>" + value.dni + "</a></td>" +
                    "                <td class='mdl-data-table__cell--non-numeric'><a class='tableItemsPopup' href='#' onclick='getOwnerById(" + value.id + ");'>" + value.lastName + "</a></td>" +
                    "                <td class='mdl-data-table__cell--non-numeric'><a class='tableItemsPopup' href='#' onclick='getOwnerById(" + value.id + ");'>" + value.name + "</a></td>" +
                    "            </tr>");
            });
        }

        var errorOwnerFinderList = function() {
            alert("Error");
        }

        $.ajax({
            url: "/cars/api/owners?currentPage=1&lastName="+$("#ownerLastName").val(),
            contentType: 'application/text; charset=utf-8',
            type: 'GET',
            dataType: 'JSON',
            success: succcessOwnerFinderList ,
            error: errorOwnerFinderList
        });
    };

    inicializarOwnerFinder();
});


var getOwnerById = function(id) {
    var successGetOwnerById = function(data) {
        seleccionarOwner(data);
    }

    var failGetOwnerById = function() {
        alert("fallo failGetOwner");
    }

    $.ajax({
        url: "/cars/api/owners/"+id,
        contentType: 'application/text; charset=utf-8',
        type: 'GET',
        dataType: 'JSON',
        success: successGetOwnerById,
        error: failGetOwnerById
    });
};

var seleccionarOwner = function(data) {
    $("#ownerLastName").val(data.lastName + " (" + data.dni + ")");
    $("#idOwner").val(data.id);
    validateData();

    inicializarOwnerFinder();
};

var inicializarOwnerFinder = function() {
    $("#ownerFinder").hide();
    $("#findOwnerPopupBtn").show();
    $("#iconBtnFinder").html("person_add");
    $("#ownerLastName").prop('disabled', true);
    $("#ownerLastName").width(200);
    $("#placeHolerOwnerFinder").width(200);
};