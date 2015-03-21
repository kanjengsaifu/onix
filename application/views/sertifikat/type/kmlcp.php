<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/10/13
 * Time: 10:31 AM
 */

$pdf = $this->pdf;

$orientation = 'P';
if(count($parameter) > 5)
    $orientation = 'L';

$pdf->fpdf($orientation,'cm','letter');

$pdf->Open();

$pdf->AliasNbPages();


/*
 * UJI PARAMETER
 */
$i = 1;

$pdf->Ln();
$split = array_chunk($list_conto, 6);
$jumlah_array = count($split);
$no=0;
foreach($split as $data):
    $pdf->tabel_kimia($data, $id_analisis, $nomor_analisis, $jumlah_conto, $jenis_conto, $lokasi, $id_pemohon);
    $no++;
    if($no == $jumlah_array)
        $pdf->tanda_tangan();
endforeach;


$pdf->output('kmlcp_'.$nomor_analisis, 'I');
