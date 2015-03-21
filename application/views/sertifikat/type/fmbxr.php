<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/9/13
 * Time: 9:19 PM
 */
$pdf = $this->pdf;

$pdf->fpdf('L','cm','letter');

$pdf->Open();

$pdf->AliasNbPages();

$pdf->AddPage();

$pdf->SetFont('Arial','U',12);
$pdf->Cell(0,0,'ANALISA SOURCE ROCK ANALYZER',0,0,'C');
$pdf->SetFont('Arial','B',12);
$pdf->Ln(.5);
$pdf->Cell(0,0,strtoupper($lokasi.', '.$provinsi),0,0,'C');



$pdf->Ln(1);

/**
 * Listing conto
 */

// header
$pdf->SetFont('Arial','B',9);
$pdf->Cell(2,1,'NO',1,0,'C');
$pdf->Cell(5,1,'NO. LAB',1,0,'C');
$pdf->Cell(2.5,1,'KODE CONTO',1,0,'C');
$pdf->Cell(10,1,'NAMA MINERAL',1,0,'C');

// body
$i = 1;
$pdf->Ln();
$pdf->SetFont('Arial','',12);
foreach($list_conto as $conto):
    $detail_conto_fisika = $this->hasil_analisis_m->get_detail_conto_fisika($conto->id);
    $nilai = json_decode($detail_conto_fisika[0]->nilai);
    $pdf->Cell(2,1,$i.'. ', 1, 0, 'C');
    $pdf->Cell(5,1,$conto->id_conto, 1);
    $pdf->Cell(2.5,1,$hasil_analisis->kode_conto.'-'.$i++, 1, 0, 'C');
    $pdf->Cell(10,1,'- '.$nilai[0], 1);
    $pdf->Ln();
endforeach;




$pdf->tanda_tangan();

$pdf->output('fmbsr_'.$nomor_analisis, 'I');
