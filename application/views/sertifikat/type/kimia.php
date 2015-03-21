<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/10/13
 * Time: 10:31 AM
 */

$pdf = $this->pdf;
$parameter = $this->hasil_analisis_m->pakai_satuan($id_analisis);

$orientation = 'P';
if(count($parameter) > 5)
    $orientation = 'L';

if(strtoupper($id_lab) == 'KBB')
{
    $orientation = 'P';
    $list_conto = $this->hasil_analisis_m->get_conto_by_no_analisis($id_analisis);
    if(count($list_conto) > 5)
        $orientation = 'L';
}

$pdf->fpdf($orientation,'cm','letter');

$pdf->Open();

$pdf->AliasNbPages();


/*
 * UJI PARAMETER
 */
$i = 1;

$pdf->Ln();
$split = array_chunk($list_conto, 2);
//var_dump($list_conto);
//$jumlah_array = count($split);
//$no=0;
//foreach($split as $data):


// jika id lab KBB maka tambel kBB
if(strtoupper($id_lab) == 'KBB')
{
    $pdf->tabel_kimia_batubara($list_conto, $id_analisis, $nomor_analisis, $jumlah_conto, $jenis_conto, $lokasi, $id_pemohon, $kode_conto);
}
else
    $pdf->tabel_kimia($list_conto, $id_analisis, $nomor_analisis, $jumlah_conto, $jenis_conto, $lokasi, $id_pemohon, $kode_conto);










//    $no++;
//    if($no == $jumlah_array)
        $pdf->tanda_tangan();
//endforeach;


$pdf->output('kimia_'.$nomor_analisis, 'I');
