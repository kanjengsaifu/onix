
var link = "http://localhost/labpsdg/analisis/";
var base_url = "http://localhost/labpsdg/";

    // var link = "http://192.168.1.14/labpsdg/analisis/";
    // var base_url = "http://192.168.1.14/labpsdg/";

    /**
     * Lokasi
     */

    if($('#provinsi').length > 0)
    {
        $(document).on('ready', function(){
            var id_prov = $('#provinsi').val();
            kab(id_prov);
        });
    }

    function kab(prov) {
        $.getJSON(base_url + 'lokasi/kabupaten_by_provinsi/' + prov, {}, function(json) {
            if(json == false) {
                $('#lokasi')
                    .find('option')
                    .remove()
                    .end()
                    .append('<option value="">--Kota--</option>')
                    .val('');
            }
            else {
                $('#lokasi')
                    .find('option')
                    .remove()
                    .end()
                    .append('<option value="">--Kota--</option>')
                    .val('');

                $.each(json, function(key, value) {
                    $('#lokasi')
                        .append($("<option></option>")
                        .attr("value", value.id_kabupaten)
                        .text(value.nama));
                });
            }
        });
    }

    function refresh_harga()
    {
        var param = [];
        $("input:checkbox[id=param]:checked").each(function(){
            param.push($(this).val());
        });

        var jumlah_conto = $('#jumlah').val();
        $.ajax({
            url: base_url + 'parameter/jumlah_harga',
            type: 'post',
            data: {
                param: param,
                jumlah: jumlah_conto
            },
            dataType: 'json',
            success: function(json) {
                if(json.harga == 0)
                    $('#harga').hide();
                else
                {
                    if($('#nama').val().substr(0,1) == 'p') {
                        $('#harga').show();
                        $('#harga').text(json.harga);
                    }
                }
            }
        });
    }

    $('#btn-hapus-petugas').click(function(){
        var id = $(this).data('id');
        var nama = $(this).data('name');
        var p = confirm('Apakah anda yakin Hapus petugas dengan nama ' + nama + ' ?');

        if(p == true)
        {
            $.ajax({
                url: base_url + 'petugas/delete',
                type: 'post',
                data: {
                    id: id
                },
                dataType: 'json',
                success: function(json) {
                    if(json.status == true)
                        window.location.href = base_url + 'petugas';
                    else
                        alert('Gagal Hapus Petugas ' + nama);
                }
            });
        }
        else
            return false;
    });

$('.btn-update-harga-parameter').click(function(){
    var id = $(this).data('id');
    var rowid = $(this).data('rowid');
    var harga = $('#harga_parameter_' + id).val();
    var jumlah_conto    = $('#jumlah_conto').val();
    var total_biaya;

    $.ajax({
        url: base_url + 'permohonan/update_harga_parameter_permohonan',
        type: 'post',
        data: {
            id: id,
            rowid: rowid,
            harga: harga
        },
        dataType: 'json',
        success: function(data) {
            alert('Berhasil Update Harga Parameter');
            $('#total-harga-perconto').text(data.total_perconto);
            total_biaya = data.total * jumlah_conto;

            $('#total-biaya').text(total_biaya);
        }
    })
});

$('.btn-reset-harga-parameter').click(function(){
    var id = $(this).data('id');
    var rowid = $(this).data('rowid');
    var jumlah_conto    = $('#jumlah_conto').val();
    var total_biaya;

    $.ajax({
        url: base_url + 'permohonan/reset_harga_parameter_permohonan',
        type: 'post',
        data: {
            id: id,
            rowid: rowid
        },
        dataType: 'json',
        success: function(data) {
            $('#harga_parameter_' + id).val(data.harga);
            $('#total-harga-perconto').text(data.total);

            total_biaya = data.total * jumlah_conto;

            console.log(jumlah_conto);
            console.log(data.total);
            console.log(total_biaya);

            $('#total-biaya').text(total_biaya);
        }
    })
});

$("#form-insert-permohonan").submit(function(e){
    var c = confirm('Apakah anda yakin menyimpan form permohonan ini?');

    if(c == false)
        return false;
});

$("#form-cancel-permohonan").submit(function(e){
    var c = confirm('Apakah anda yakin Cancel form permohonan ini?');

    if(c == false)
        return false;
});

$("#form-reset-permohonan").submit(function(e){
    var c = confirm('Apakah anda yakin Reset form permohonan ini?');

    if(c == false)
        return false;
});

$('.form-update-conto-parameter').change(function(){

    var id = $(this).data('id');
    var nilai = $(this).val();


    $.ajax({
        url: base_url + 'conto/update_parameter',
        type: 'post',
        data: {
            id: id,
            nilai: nilai
        },
        success: function(data) {
            if(data == true){
                $('#nilai_' + id).text( nilai );
            }
        }
    });
});

$('.form-update-analisis-parameter-satuan').change(function(){

    var id = $(this).data('id');
    var satuan = $(this).val();

    $.ajax({
        url: base_url + 'analisis/update_parameter_satuan',
        type: 'post',
        data: {
            id: id,
            satuan: satuan
        },
        success: function(data) {
            if(data != false){
                $('#satuan_' + id).text( satuan );
            }
            else {
                $('#satuan_' + id).text( '-' );
            }
        }
    });
});

$('.form-update-analisis-parameter-metoda').change(function(e){

    var id = $(this).data('id');
    var id_metoda = $(this).val();

    $.ajax({
        url: base_url + 'analisis/update_parameter_metoda',
        type: 'post',
        data: {
            id: id,
            id_metoda: id_metoda
        },
        success: function(data) {
            if(data != false){
                $('#metoda_' + id).text( data );
            }
            else {
                $('#metoda_' + id).text('-');
            }
        }
    });
});

$('.form-update-analisis-parameter-basis').change(function(){
    var id = $(this).data('id');
    var basis = $(this).val();

    $.ajax({
        url: base_url + 'analisis/update_parameter_basis',
        type: 'post',
        data: {
            id: id,
            basis: basis
        },
        success: function(data) {
            if(data != false){
                $('#basis_' + id).text( data );
            }
            else {
                $('#basis_' + id).text('-');
            }
        }
    });
});

$('#form-update-kode-conto').submit(function(e){
    e.preventDefault();

    var data = $(this).serialize();
    var dataArray = $(this).serializeArray();

    $.ajax({
        url: base_url + 'conto/update_kode_conto',
        type: 'post',
        data: data,
        success: function(data){
            if(data == true){
                $('#kode-conto').text($('input[name=kode_conto]').val());
            }
        }
    })
});

$('#btn-show-pass-admin').click(function(){
    $('#pass-awal-form').removeClass('hide');
    $('#pass-awal-form').delay(2500).fadeOut(3000);
});

$('#btn-reset-pass-admin').click(function(){
    var id = $(this).data('id');

    var c = confirm('Apakah anda yakin melakukan reset password ?');

    if(c == false) {
        return false;
    }

    $.ajax({
        url: base_url + 'petugas/reset_password',
        type: 'post',
        data: {
            id: id
        },
        success: function(data){
            if(data != false)
            {
                alert(data);
            }
        }
    })
});

/**
 * ubah dari menit ke perconto atau sebaliknya
 * @param status
 */
function change_type_waktu(status){
    if(status)
        $('#perhari').show()
    else
        $('#perhari').hide()
}
var is_perhari = $('#is_perhari');
var checked = is_perhari.is(':checked');
change_type_waktu(checked)
is_perhari.click(function() {
    var checked = ($(this).is(':checked'));
    change_type_waktu(checked)
});

/**
 * Kelengkapan
 */
$('#btn-add-kelengkapan').click(function(){
    var id_kelengkapan = $('#kelengkapan').val();
    var nama_kelengkapan = $('#kelengkapan').find('option:selected').text();

    var template = "<div class='list-group-item list-group-item-info' id='kelengkapan-" + id_kelengkapan + "'>" +
        "<button class='btn btn-link btn-del-kelengkapan' data-id='"+ id_kelengkapan +"'><i class='fa fa-times'></i></button> " +
        nama_kelengkapan +
        "<input type='hidden' name='kelengkapan[]' value='" + id_kelengkapan + "'> " +
        "<input type='hidden' name='nama_kelengkapan[]' value='" + nama_kelengkapan + "'> " +
        "</div> "

    if($('#kelengkapan-' + id_kelengkapan).length == 0){
        if(id_kelengkapan != 0) {
            $('#list-kelengkapan').append(template);
        }
    }
});

$(document).on('click', '.btn-del-kelengkapan', function(){
    var id_kelengkapan = $(this).data('id');
    $("#kelengkapan-" + id_kelengkapan).remove();
});

$('.btn-detail-prosedur-kegiatan').click(function(){
    var id = $(this).data('id');
    $('#prosedur-kegiatan-' + id).toggleClass('show');
});

$('.btn-del-prosedur-kegiatan').click(function(){
    var c = confirm('Apakah anda yakin menghapus kegiatan ini ?');

    if(c == false) {
        return false;
    }

    var id = $(this).data('id');

    $.ajax({
        url: base_url + 'type_analisis/delete_prosedur_kegiatan',
        type: 'post',
        data: {id: id},
        success: function(data) {
            if(data == true) {
                $('#kegiatan-' + id).remove();
            }
        }
    })
});

$('.update-prosedur-khusus').change(function(){
    var id = $(this).data('id');
    var status = $(this).is(':checked');

    if (status == true){
        status = 1
    }
    else {
        status = 0
    }

    $.ajax({
        url: base_url + 'type_analisis/update_prosedur_khusus',
        type: 'post',
        data: {id: id, status: status},
        success: function(data) {
            console.log(data);
            if(data == true) {
                if(status == true)
                {
                    $('#kegiatan-' + id).removeClass('task-info');
                    $('#kegiatan-' + id).addClass('task-danger');
                }
                else
                {
                    $('#kegiatan-' + id).addClass('task-info');
                    $('#kegiatan-' + id).removeClass('task-danger');
                }
            }
        }
    })

});

/**
 * list kegiatan
 */
$(function(){

    var tasks = function(){

        $("#tasks").sortable({
            update: function(event, ui) {
                var data = $(this).sortable('serialize');
                console.log(data);

                $.ajax({
                    url: base_url + 'type_analisis/update_prosedur_kegiatan_order',
                    type: 'post',
                    data: data
                })
            }
        }).disableSelection();

    }();

});

function is_not_number(value)
{
    if(isNaN(value))
        return 0
    else
        return value;
}


/**
 * Fisika
 */

// FMBMA
$('#btn-add-mineral-fmbma').click(function(){
    var id = $('#mineral').val();
    var mineral = $('#mineral option:selected').text();
    var tr = "<tr id='mineral-" + id + "'>" +
        "<td>" + mineral + " <input type='hidden' name='komposisi_mineral[" + id + "][nama_mineral]' value='" + mineral + "'><input type='hidden' name='komposisi_mineral[" + id + "][id]' value='" + id + "'></td>" +
        "<td><input type='text' class='form-control' value='0' name='komposisi_mineral[" + id + "][t1]'></td>" +
        "<td><input type='text' class='form-control' value='0' name='komposisi_mineral[" + id + "][t2]'></td>" +
        "<td><input type='text' class='form-control' value='0' name='komposisi_mineral[" + id + "][t3]'></td>" +
        "<td><input type='text' class='form-control' value='0' name='komposisi_mineral[" + id + "][t4]'></td>" +
        "<td><input type='text' class='form-control' value='0' name='komposisi_mineral[" + id + "][t5]'></td>" +
        "<td><input type='text' class='form-control' value='0' name='komposisi_mineral[" + id + "][t6]'></td>" +
        "<td><input type='text' class='form-control' value='0' name='komposisi_mineral[" + id + "][t7]'></td>" +
        "<td><button type='button' class='btn btn-xs btn-delete-mineral-fmbma btn-danger' data-id='" + id + "'><i class='fa fa-times'></i> hapus</button></td>'" +
        "</tr>";

    var check = $('tr#mineral-' + id);
    if(check.length == 0)
    {
        $('#fmbma-komposisi-mineral tbody').append(tr);
    }
});

$(document).on('click', '.btn-delete-mineral-fmbma', function(){
    var c = confirm('Apakah anda yakin menghapus komposisi mineral ini ?');

    if(c == false) {
        return false;
    }

    var id = $(this).data('id');
    $('tr#mineral-' + id).remove();
});

$('#form-fmbma .fraksi').keyup(function(){
    total_fraksi();
});

$("#btn-copy-fmbma").click(function(){
    $.getJSON(base_url + 'pengaturan/komposisi_mineral_fmbma', [], function(data){
        var id, nama_mineral, i;
        for( i=0; i < data.length; i++){
            id = data[i].id;
            mineral = data[i].nama_mineral;

            var tr = "<tr id='mineral-" + id + "'>" +
                "<td>" + mineral + " <input type='hidden' name='komposisi_mineral[" + id + "][nama_mineral]' value='" + mineral + "'><input type='hidden' name='komposisi_mineral[" + id + "][id]' value='" + id + "'></td>" +
                "<td><input type='text' class='form-control' value='0' name='komposisi_mineral[" + id + "][t1]'></td>" +
                "<td><input type='text' class='form-control' value='0' name='komposisi_mineral[" + id + "][t2]'></td>" +
                "<td><input type='text' class='form-control' value='0' name='komposisi_mineral[" + id + "][t3]'></td>" +
                "<td><input type='text' class='form-control' value='0' name='komposisi_mineral[" + id + "][t4]'></td>" +
                "<td><input type='text' class='form-control' value='0' name='komposisi_mineral[" + id + "][t5]'></td>" +
                "<td><input type='text' class='form-control' value='0' name='komposisi_mineral[" + id + "][t6]'></td>" +
                "<td><input type='text' class='form-control' value='0' name='komposisi_mineral[" + id + "][t7]'></td>" +
                "<td><button type='button' class='btn btn-xs btn-delete-mineral-fmbma btn-danger' data-id='" + id + "'><i class='fa fa-times'></i> hapus</button></td>'" +
                "</tr>";

                $('#fmbma-komposisi-mineral tbody').append(tr);
        }

        $('#table-empty-fmbma').remove();
    });
});

function total_fraksi() {
    var total_fraksi = 0;
    $('#form-fmbma').find('input[name^=fraksi]').each(function(){
        var fraksi = $(this).val()
        total_fraksi = total_fraksi + parseFloat(fraksi);
    });
    $('.total-fraksi').text(total_fraksi.toFixed(2));
    $('.total-fraksi').val(total_fraksi.toFixed(2));
}

// FMBAB
$('#btn-add-mineral-fmbab').click(function(){
    var id = $('#mineral').val();
    var mineral = $('#mineral option:selected').text();
    var tr = "<tr id='mineral-" + id + "'>" +
        "<td>" + mineral + " <input type='hidden' name='komposisi_mineral[" + id + "][nama_mineral]' value='" + mineral + "'><input type='hidden' name='komposisi_mineral[" + id + "][id]' value='" + id + "'></td>" +
        "<td><input type='text' class='form-control' value='0' id='input-sm-" + id + "' name='komposisi_mineral[" + id + "][sm]'></td>" +
        "<td><div id='sm-" + id + "'>0</div></td>" +
        "<td><input type='text' class='form-control' value='0' id='input-m-" + id + "' name='komposisi_mineral[" + id + "][m]'></td>" +
        "<td><div id='m-" + id + "'>0</div></td>" +
        "<td><input type='text' class='form-control' value='0' id='input-nm-" + id + "' name='komposisi_mineral[" + id + "][nm]'></td>" +
        "<td><div id='nm-" + id + "'>0</div></td>" +
        "<td><div id='hasil-'" + id + ">0</div></td>" +
        "<td><button type='button' class='btn btn-xs btn-delete-mineral-fmbma btn-danger' data-id='" + id + "'><i class='fa fa-times'></i> hapus</button></td>'" +
        "</tr>";

    var check = $('tr#mineral-' + id);
    if(check.length == 0)
    {
        $('#fmbab-komposisi-mineral tbody').append(tr);
        $('#info-add-mineral').text('berhasil tambah ' + mineral);
    }
    else
    {
        $('#info-add-mineral').text(mineral + ' sudah ada');
    }
});

$("#btn-copy-fmbab").click(function(){
    $.getJSON(base_url + 'pengaturan/komposisi_mineral_fmbab', [], function(data){
        var id, nama_mineral, i;
        for( i=0; i < data.length; i++){
            id = data[i].id;
            mineral = data[i].nama_mineral;

            var tr = "<tr id='mineral-" + id + "'>" +
                "<td>" + mineral + " <input type='hidden' name='komposisi_mineral[" + id + "][nama_mineral]' value='" + mineral + "'><input type='hidden' name='komposisi_mineral[" + id + "][id]' value='" + id + "'></td>" +
                "<td><input type='text' class='form-control input-fmbab' value='0' id='input-sm-" + id + "' name='komposisi_mineral[" + id + "][sm]'></td>" +
                "<td><div id='sm-" + id + "'>0</div></td>" +
                "<td><input type='text' class='form-control input-fmbab' value='0' id='input-m-" + id + "' name='komposisi_mineral[" + id + "][m]'></td>" +
                "<td><div id='m-" + id + "'>0</div></td>" +
                "<td><input type='text' class='form-control input-fmbab' value='0' id='input-nm-" + id + "' name='komposisi_mineral[" + id + "][nm]'></td>" +
                "<td><div id='nm-" + id + "'>0</div></td>" +
                "<td><div id='hasil-'" + id + ">0</div></td>" +
                "<td><button type='button' class='btn btn-xs btn-delete-mineral-fmbma btn-danger' data-id='" + id + "'><i class='fa fa-times'></i> hapus</button></td>'" +
                "</tr>";

                $('#fmbab-komposisi-mineral tbody').append(tr);
        }

        $('#table-empty-fmbab').remove();
    });
});

$('.input-fmbab').keyup(function(){
    refresh_fmbab();
});

$('fmbab-komposisi-mineral').ready(function(){
    refresh_fmbab();
})

function refresh_fmbab()
{
    var sm = $('#sm').val();
    var m = $('#m').val();
    var nm = $('#nm').val();

    var berat_total = parseFloat(sm) + parseFloat(m) + parseFloat(nm);


    var sm_berat_total = sm/berat_total;
    var m_berat_total = m/berat_total;
    var nm_berat_total = nm/berat_total;

    var jumlah_sm = 0;
    var jumlah_m = 0;
    var jumlah_nm = 0;
    var jumlah_hasil = 0;

    $('#berat-total').text(berat_total.toFixed(2));

    $("[id^='mineral-']").each(function(){
        var id = $(this).attr('id').substring(8);
        var mineral_sm = $("#input-sm-" + id).val();
        var mineral_m = $("#input-m-" + id).val();
        var mineral_nm = $("#input-nm-" + id).val();

        var total_sm = sm_berat_total*mineral_sm;
        var total_m = m_berat_total*mineral_m;
        var total_nm = nm_berat_total*mineral_nm;

        $('#sm-' + id).text(is_not_number(total_sm.toFixed(2)));
        $('#m-' + id).text(is_not_number(total_m.toFixed(2)));
        $('#nm-' + id).text(is_not_number(total_nm.toFixed(2)));

        var hasil = total_sm + total_m + total_nm;

        $('#hasil-' + id).text(is_not_number(hasil.toFixed(2)));

        jumlah_sm += parseFloat(mineral_sm);
        jumlah_m += parseFloat(mineral_m);
        jumlah_nm += parseFloat(mineral_nm);
        jumlah_hasil += hasil;

    });

    $('#jumlah-sm').text(jumlah_sm);
    $('#jumlah-m').text(jumlah_m);
    $('#jumlah-nm').text(jumlah_nm);
    $('#jumlah-hasil').text(jumlah_hasil.toFixed(0));
}

// FMBMB
$('#btn-add-mineral-fmbmb').click(function(){
    var id = $('#mineral').val();
    var mineral = $('#mineral option:selected').text();
    var tr = "<tr id='mineral-" + id + "'>" +
        "<td>" + mineral + " <input type='hidden' name='komposisi_mineral[" + id + "][nama_mineral]' value='" + mineral + "'><input type='hidden' name='komposisi_mineral[" + id + "][id]' value='" + id + "'></td>" +
        "<td><textarea class='form-control' name='komposisi_mineral[" + id + "][keterangan]'></textarea></td>" +
        "<td><button type='button' class='btn btn-xs btn-delete-mineral-fmbma btn-danger' data-id='" + id + "'><i class='fa fa-times'></i> hapus</button></td>'" +
        "</tr>";

    var check = $('tr#mineral-' + id);
    if(check.length == 0)
    {
        $('#fmbmb-komposisi-mineral tbody').append(tr);
    }
});


//FMBMN
$('#btn-add-mineral-fmbmn').click(function(){
    var id = $('#mineral').val();
    var mineral = $('#mineral option:selected').text();
    var tr = "<tr id='mineral-" + id + "'>" +
        "<td>" + mineral + " <input type='hidden' name='komposisi_mineral[" + id + "][nama_mineral]' value='" + mineral + "'><input type='hidden' name='komposisi_mineral[" + id + "][id]' value='" + id + "'></td>" +
        "<td><input type='text' class='form-control' name='komposisi_mineral[" + id + "][nilai]' value='0'></td>" +
        "<td><textarea class='form-control' name='komposisi_mineral[" + id + "][keterangan]'></textarea></td>" +
        "<td><button type='button' class='btn btn-xs btn-delete-mineral-fmbma btn-danger' data-id='" + id + "'><i class='fa fa-times'></i> hapus</button></td>'" +
        "</tr>";

    var check = $('tr#mineral-' + id);
    if(check.length == 0)
    {
        $('#fmbmn-komposisi-mineral tbody').append(tr);
    }
});

// FMBXR
$('#btn-add-mineral-fmbxr').click(function(){
    var id = $('#mineral').val();
    var mineral = $('#mineral option:selected').text();
    var tr = "<tr id='mineral-" + id + "'>" +
        "<td>" + mineral + " <input type='hidden' name='komposisi_mineral[" + id + "][nama_mineral]' value='" + mineral + "'><input type='hidden' name='komposisi_mineral[" + id + "][id]' value='" + id + "'></td>" +
        "<td><button type='button' class='btn btn-xs btn-delete-mineral-fmbxr btn-danger' data-id='" + id + "'><i class='fa fa-times'></i> hapus</button></td>'" +
        "</tr>";

    var check = $('tr#mineral-' + id);
    if(check.length == 0)
    {
        $('#fmbxr-komposisi-mineral tbody').append(tr);
    }
});

$(".mail-to-checkall").on("click",function(){

    var prop = $('.mail-to-checkall').prop("checked");

    $(".mail-to-checkbox").each(function(){
        var cl = $(this);
        cl.toggleClass("checked",prop).prop("checked",prop);
    });

});

$(".parameter-checkall").on("click",function(){
    var type = $(this).val();

    $('.parameter-checkbox-' + type).prop('checked', this.checked);

});

$('#btn-delete-message').click(function(){
    var c = confirm('Apakah anda yakin menghapus message ini ?');

    if(c == false){
        return false;
    }
});

$('#btn-selesai-conto').click(function(){
    var c = confirm('Apakah anda yakin selesai menganalisis conto ini ?');

    if(c == false){
        return false;
    }
});

$('#btn-ubah-conto').click(function(){
    var c = confirm('Apakah anda yakin mengubah conto ini ?');

    if(c == false){
        return false;
    }
});

$('.form-update-selesai-preparasi').submit(function(){
    var id = $(this).find('.id_analisis_type_analisis').val();
    var selesai_preparasi = $(this).find( '.selesai_preparasi' ).val();

    console.log(id);
    console.log(selesai_preparasi);

    $.ajax({
        type: 'post',
        url: base_url + 'preparasi/update_selesai_preparasi_analisis_type_analisis',
        data: {
            id: id,
            is_prepared: 1,
            selesai_preparasi: selesai_preparasi
        },
        success: function(data) {
            console.log(data);
            if(data == false){}
            else {
                $('#tanggal-selesai-' + id).text(data);
            }
        }
    });

    return false;
});

$('.delete_type_analisis_parameter').submit(function(){
    var c = confirm('Apakah anda yakin menghapus parameter ini ?');

    if(c == false){
        return false;
    }
});

$('#form_pendaftaran').submit(function(){
    var c = confirm('Apakah anda telah mengisi data dengan benar ?');

    if(c == false){
        return false;
    }
});

$('#form_insert_batch_conto').submit(function(){
    var c = confirm('Proses akan berlangsung beberapa menit mohon untuk menunggu dan jangan tutup/refresh jendela ini ?');

    if(c == false){
        return false;
    }
});

$('.update-kode-conto').change(function(){
    var id = $(this).data('id');
    var kode_conto = $(this).val();

    $.ajax({
        url: base_url + 'conto/update_kode_conto',
        type: 'post',
        data:{
            id: id,
            kode_conto: kode_conto
        },
        success: function(data){
            if(data == true){
                $('#kode-tersimpan-' + id).text(kode_conto);
            }
        }
    })
});

// hitung fixed carbon
$('#parameter-count-34').click(function(){
    var moisture = parseFloat($('input[data-nama="Moisture"]').val());
    var volatile = parseFloat($('input[data-nama="Volatile Matter"]').val());
    var ash = parseFloat($('input[data-nama="ASH"]').val());

    var total_mva, fixed_carbon;

    if(moisture == '')
    {
        alert('Moisture Tidak Boleh Kosong');
        $('input[data-nama="Moisture"]').focus();
        return false;
    }

    if(volatile == '')
    {
        alert('Volatile Tidak Boleh Kosong');
        $('input[data-nama="Volatile Matter"]').focus();
        return false;
    }

    if(ash == '')
    {
        alert('ASH Tidak Boleh Kosong');
        $('input[data-nama="ASH"]').focus();
        return false;
    }

    total_mva = moisture+volatile+ash;
    fixed_carbon = 100-total_mva;

    $('input[data-nama="Fixed Carbon"]').val(fixed_carbon);

    var id = 34;
    var nilai = fixed_carbon;

    $.ajax({
        url: base_url + 'conto/update_parameter',
        type: 'post',
        data: {
            id: id,
            nilai: nilai
        },
        success: function(data) {
            if(data == true){
                $('#nilai_' + id).text( nilai );
            }
        }
    });


});

