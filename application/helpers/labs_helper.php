<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/28/13
 * Time: 8:47 PM
 */

function nilai($id_conto, $id_parameter, $nilai_only=FALSE, $satuan=NULL)
{
    $CI =& get_instance();
    $CI->load->model('hasil_analisis_m');
    $nilai = $CI->hasil_analisis_m->get_nilai($id_conto, $id_parameter, $satuan);

    $nilai_db = !$nilai ? '-' : $nilai->nilai;
    $satuan_db = !$nilai ? '-' : $nilai->satuan;
    $nilai = array($nilai_db, $satuan_db);


    $nilai = $nilai[0] == '' ? array(0,'') : $nilai;

    if($nilai_only == TRUE)
        $nilai = $nilai[0];

    return $nilai;
}