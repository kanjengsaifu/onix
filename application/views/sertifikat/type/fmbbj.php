<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/9/13
 * Time: 9:19 PM
 */
$pdf = $this->pdf;

$pdf->fpdf('P','cm','letter');

$pdf->Open();

$pdf->AliasNbPages();

$pdf->AddPage();

$pdf->SetFont('Arial','B',12);
$pdf->Cell(0,0,'HASIL ANALISIS BERAT JENIS',0,0,'C');
$pdf->Ln(1);

/**
 * Keterangan Analisis
 */
$pdf->SetFont('Arial','B',12);
$pdf->Cell(3,1,'MILIK',1);
$pdf->SetFont('Arial','',12);
$pdf->Cell(6.2,1,nama_pemohon($id_pemohon),1);
$pdf->SetFont('Arial','B',12);
$pdf->Cell(5.5,1,'JUMLAH CONTO',1);
$pdf->SetFont('Arial','',12);
$pdf->Cell(5,1,$jumlah_conto.' Conto',1);
$pdf->Ln(1);
$pdf->SetFont('Arial','B',12);
$pdf->Cell(3,1,'LOKASI',1);
$pdf->SetFont('Arial','',12);
$pdf->Cell(6.2,1,$lokasi,1);
$pdf->SetFont('Arial','B',12);
$pdf->Cell(5.5,1,'PENGUJI',1);
$pdf->SetFont('Arial','',12);
$pdf->Cell(5,1,'LAB. FISIKA MINERAL',1);


$pdf->Ln(2);

/**
 * Listing conto
 */

// header
$pdf->SetFont('Arial','B',12);
$pdf->Cell(3,1,'NO',1,0,'C');
$pdf->Cell(5,1,'NO ANALISIS',1,0,'C');
$pdf->Cell(5,1,'KODE CONTO',1,0,'C');
$pdf->Cell(6.7,1,'SPECIFIC GRAVITY (gr/cm3)',1,0,'C');
// body
$i = 1;
$pdf->Ln();
$pdf->SetFont('Arial','',12);

foreach($list_conto as $conto):
    $detail_conto_fisika = $this->hasil_analisis_m->get_detail_conto_fisika($conto->id);
    $nilai = json_decode($detail_conto_fisika[0]->nilai);
    $pdf->Cell(3,1,$i.'.',1,0,'C',0,'C');
    $pdf->Cell(5,1,$conto->id_conto,1,0,'C');
    $pdf->Cell(5,1,$hasil_analisis->kode_conto.'-'.$i++,1,0,'C');
    $pdf->Cell(6.7,1,$nilai[0],1,0,'C');
    $pdf->Ln();
endforeach;

$pdf->tanda_tangan();

$pdf->output('fmbbj_'.$nomor_analisis, 'I');
