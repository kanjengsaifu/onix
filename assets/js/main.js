$('.carousel').carousel();

function nama_kimia(text) {
    var array = {
        "1":"<sub>1</sub>",
        "2":"<sub>2</sub>",
        "3":"<sub>3</sub>",
        "4":"<sub>4</sub>",
        "5":"<sub>5</sub>",
        "6":"<sub>6</sub>",
        "7":"<sub>7</sub>",
        "8":"<sub>8</sub>",
        "9":"<sub>9</sub>"
    };

    for (var val in array)
        text = text.replace(new RegExp(val, "g"), array[val]);

    return text;
}

$(function () {
    $('[data-toggle="tooltip"]').tooltip()
})

$(".fancybox-thumb").fancybox({
    prevEffect	: 'none',
    nextEffect	: 'none',
    helpers	: {
        title	: {
            type: 'outside'
        },
        thumbs	: {
            width	: 800,
            height	: 480
        },
        height: 600,
        width: 800
    }
});

$('#btn-back').click(function(e){
    parent.history.back();
    e.preventDefault();
});

$('#btn-reset-permohonan').click(function(e){
    e.preventDefault();
    var c = confirm('Apakah anda yakin mengulangi pengisian form ?');

    if(c)
        window.location = base_url + 'permohonan/reset';
});

$(function() {
    $('#nav-wrapper').height($("#nav").height());

    $('#nav').affix({
        offset: { top: $('#nav').offset().top }
    });
});

$(".fancybox-thumb")
    .attr('rel', 'gallery')
    .fancybox({
        padding : 0
    });



$('.proses-table tbody tr').each(function() {
    var nTds = $('td', this);
    var status = $(nTds[5]).text();

    if(status == 'selesai')
        this.setAttribute('class', 'success');
    else
        this.setAttribute('class', 'warning');
});

$('.table-data').dataTable({
    bFilter: true,
    bInfo: true,
    "oLanguage": {
        "sZeroRecords": "Data Tidak Ditemukan",
        "sEmptyTable": "Tidak Ada Data Tersedia"
    }
});

$('.table-data-simple').dataTable({
    "bPaginate": false,
    "bLengthChange": false,
    "bFilter": false,
    "bSort": false,
    "bInfo": false,
    "bAutoWidth": false,
    "oLanguage": {
        "sZeroRecords": "Data Tidak Ditemukan",
        "sEmptyTable": "Tidak Ada Data Tersedia"
    }
});

$('.proses-table').dataTable({
    "bPaginate": false,
    "bLengthChange": false,
    "bFilter": false,
    "bSort": false,
    "bInfo": false,
    "bAutoWidth": false,
    "fnCreatedRow": function( nRow, aData, iDataIndex ) {
        $(nRow).attr('id', aData[1]);
    },
    "oLanguage": {
        "sZeroRecords": "Data Tidak Ditemukan",
        "sEmptyTable": "Tidak Ada Data Tersedia"
    }
});


    var oTable = $('#default-table').dataTable({
        "bPaginate": false,
        "bLengthChange": false,
        "bSort": false,
        "bInfo": false,
        "bAutoWidth": false,
        "fnCreatedRow": function( nRow, aData, iDataIndex ) {
            $(nRow).attr('id', aData[1]);
        },
        "oLanguage": {
            "sZeroRecords": "Data Tidak Ditemukan",
            "sEmptyTable": "Tidak Ada Data Tersedia"
        }
    });

    var kpTable = $('#default-table-kp').dataTable({
        "bPaginate": false,
        "bLengthChange": false,
        "bSort": false,
        "bInfo": false,
        "bAutoWidth": false,
        "fnCreatedRow": function( nRow, aData, iDataIndex ) {
            $(nRow).attr('id', aData[1]);
        },
        "oLanguage": {
            "sZeroRecords": "Data Tidak Ditemukan",
            "sEmptyTable": "Tidak Ada Data Tersedia"
        }
    });


    $('#search-box').keyup(function(){
        oTable.fnFilter(  this.value );
    });

    $('#search-box-kp').keyup(function(){
        kpTable.fnFilter(  this.value );
    });




