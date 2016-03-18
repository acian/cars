/**
 * Created by jfn on 29/02/16.
 */

$(document).ready(function() {
    var cantPages;
    var currentPage;

    setPagination = function() {
        // Cantidad de paginas
  //      cantPages = localStorage.getItem('cantPages');

        // Pagina actual
        currentPage = localStorage.getItem('currentPage');

        /* Obtengo la cantidad de registros y los divido
           en 10 registros por pagina y luego reondeo hacia
           arriba.
        */
        var value = localStorage.getItem('cantItems');
        cantPages = Math.ceil(value/10);

        if(cantPages == 0 || cantPages === null || typeof cantPages === 'undefined')
            cantPages = 1;

        localStorage.setItem('cantPages', cantPages);

        // Seteo los nuevos valores en pantalla
        $('#currentPageSpn').html(currentPage);
        $('#maxPagesSpn').html(cantPages);
    };

    $("#flechaIquierda").click(function() {
        if(currentPage <= 1)
            return;

        localStorage.setItem('currentPage', --currentPage);

        $('#currentPageSpn').html(currentPage);

        getAll();
    });

    $( "#flechaDerecha" ).click(function() {
        if(currentPage == cantPages)
            return;

        localStorage.setItem('currentPage', ++currentPage);

        $('#currentPageSpn').html(currentPage);

        getAll();
    });
});