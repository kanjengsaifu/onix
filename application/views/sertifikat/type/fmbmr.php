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

$pdf->SetFont('Arial','B',12);
$pdf->Cell(26.8,0,'ANALISIS KOMPOSISI MASERAL DAN REFLEKTAN',0,0,'C');
$pdf->Ln(.5);
$pdf->Cell(0,0,strtoupper($lokasi.', '.$provinsi),0,0,'C');



$pdf->Ln(2);

/**
 * Listing conto
 */

// header
$pdf->SetFont('Arial','B',9);
$pdf->Cell(2,4,'NO',1,0,'C');
$pdf->Cell(2.5,4,'NO. CONTO',1,0,'C');
$pdf->Cell(2.5,4,'LITOLOGI',1,0,'C');
$pdf->multiCell(2.5,1,'MEAN REFLEKTAN VIRINIT(% Rv Random)',1,'C');
$pdf->setY(8);
$pdf->setX(10.5);
$pdf->Cell(2.5,4,'KISARAN (%)',1,0,'C');
$pdf->Cell(3.2,4,'STANDAR DEVIASI',1,0,'C');
$pdf->Cell(1.2,4,'N',1,0,'C');
$pdf->Cell(4.8,1,'KOMP. MASERAL (%)',1,0,'C');
$pdf->Cell(4.8,1,'MATERIAL MINERAL (%)',1,0,'C');
$pdf->Ln();
$pdf->setX(17.4);
$pdf->Cell(1.6,3,'V',1,0,'C');
$pdf->Cell(1.6,3,'I',1,0,'C');
$pdf->Cell(1.6,3,'L',1,0,'C');
$pdf->Cell(1.6,3,'CLAY',1,0,'C');
$pdf->Cell(1.6,3,'OX B',1,0,'C');
$pdf->Cell(1.6,3,'PY',1,0,'C');

// body
$i = 1;
$pdf->Ln();
$pdf->SetFont('Arial','',12);

foreach($list_conto as $conto):
    $detail_conto_fisika = $this->hasil_analisis_m->get_detail_conto_fisika($conto->id);
    $nilai = json_decode($detail_conto_fisika[0]->nilai);
    $pdf->Cell(2,1,$i.'. ',1,0,'C');
    $pdf->Cell(2.5,1,$hasil_analisis->kode_conto.'-'.$i++,1,0,'C');
    $pdf->Cell(2.5,1,$nilai[0],1,0,'C');
    $pdf->Cell(2.5,1,$nilai[1],1,0,'C');
    $pdf->Cell(2.5,1,$nilai[2],1,0,'C');
    $pdf->Cell(3.2,1,$nilai[3],1,0,'C');
    $pdf->Cell(1.2,1,$nilai[4],1,0,'C');
    $pdf->Cell(1.6,1,$nilai[5],1,0,'C');
    $pdf->Cell(1.6,1,$nilai[6],1,0,'C');
    $pdf->Cell(1.6,1,$nilai[7],1,0,'C');
    $pdf->Cell(1.6,1,$nilai[8],1,0,'C');
    $pdf->Cell(1.6,1,$nilai[9],1,0,'C');
    $pdf->Cell(1.6,1,$nilai[10],1,0,'C');
    $pdf->Ln();
endforeach;

/*
 * KOMENTAR
 */
$detail_conto_fisika = $this->hasil_analisis_m->get_detail_conto_fisika($list_conto[0]->id);
$pdf->Ln();
$pdf->SetFont('Arial','B',9);
$pdf->Cell(3.1,1,'KOMENTAR:');
$pdf->Ln(1);
$pdf->SetFont('Arial','',9);
$pdf->MultiCell(19.6,0.4,$detail_conto_fisika[0]->d_mikroskopis);

$pdf->tanda_tangan();

$pdf->output('fmbuf_'.$nomor_analisis, 'I');
