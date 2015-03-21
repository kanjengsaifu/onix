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
$pdf->Cell(2.5,1,'KODE CONTO',1,0,'C');
$pdf->Cell(2.5,1,'S1 (mg/g)',1,0,'C');
$pdf->Cell(2.5,1,'S2 (mg/g)',1,0,'C');
$pdf->Cell(2.5,1,'S3 (mg/g)',1,0,'C');
$pdf->Cell(2.5,1,'TOC (%)',1,0,'C');
$pdf->Cell(2.5,1,'T max (%)',1,0,'C');
$pdf->Cell(2.5,1,'HI',1,0,'C');
$pdf->Cell(2.5,1,'OI',1,0,'C');

// body
$i = 1;
$pdf->Ln();
$pdf->SetFont('Arial','',12);
foreach($list_conto as $conto_fisika):
    $detail_conto_fisika = $this->hasil_analisis_m->get_detail_conto_fisika($conto_fisika->id);
    $nilai = json_decode($detail_conto_fisika[0]->nilai);
    $pdf->Cell(2,1,$i.'. ', 1, 0, 'C');
    $pdf->Cell(2.5,1,$hasil_analisis->kode_conto.'-'.$i++, 1);
    $pdf->Cell(2.5,1,$nilai[0][0], 1);
    $pdf->Cell(2.5,1,$nilai[0][1], 1);
    $pdf->Cell(2.5,1,$nilai[0][2], 1);
    $pdf->Cell(2.5,1,$nilai[1], 1);
    $pdf->Cell(2.5,1,$nilai[2], 1);
    $pdf->Cell(2.5,1,$nilai[3], 1);
    $pdf->Cell(2.5,1,$nilai[4], 1);

    $pdf->Ln();
endforeach;

$pdf->Ln();
$pdf->SetFont('Arial','B',9);
$pdf->Cell(2.5,1,'Komentar: ',0,0);
$pdf->Ln(0.5);
$pdf->SetFont('Arial','',9);
$pdf->multiCell(10,1,$conto->deskripsi,0,0);





$pdf->tanda_tangan();

$pdf->output('fmbsr_'.$nomor_analisis, 'I');
