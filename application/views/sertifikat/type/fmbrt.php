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
$pdf->Cell(0,0,'HASIL ANALISIS RETORT',0,0,'C');
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
$pdf->SetFont('Arial','B',9);
$pdf->Cell(2,2,'NO',1,0,'C');
$pdf->Cell(4.3,2,'NOMOR ANALISIS',1,0,'C');
$pdf->Cell(4,2,'KODE CONTO',1,0,'C');
$pdf->Cell(4,1,'KANDUNGAN (L/Ton)',1,0,'C');
$pdf->Cell(5.4,1,'SPECIFIC GRAVITY ',1,0,'C');
$pdf->ln();
$pdf->setX(11.3);
$pdf->Cell(2,1,'AIR',1,0,'C');
$pdf->Cell(2,1,'MINYAK',1,0,'C');
$pdf->Cell(3.4,1,'BATUAN (gr/mg3)',1,0,'C');
$pdf->Cell(2,1,'MINYAK',1,0,'C');
// body
$i = 1;
$pdf->Ln();
$pdf->SetFont('Arial','',12);

foreach($list_conto as $conto):
    $detail_conto_fisika = $this->hasil_analisis_m->get_detail_conto_fisika($conto->id);
    $nilai = json_decode($detail_conto_fisika[0]->nilai);
    $pdf->Cell(2,1,$i,1,0,'C');
    $pdf->Cell(4.3,1,$hasil_analisis->kode_conto.'-'.$i++,1,0,'C');
    $pdf->Cell(4,1,'METODA UJI',1,0,'C');
    $pdf->Cell(2,1,empty($nilai->k_air)?'-':$nilai->k_air,1,0,'C');
    $pdf->Cell(2,1,empty($nilai->k_minyak)?'-':$nilai->k_minyak,1,0,'C');
    $pdf->Cell(3.4,1,empty($nilai->sg_batuan)?'-':$nilai->sg_batuan,1,0,'C');
    $pdf->Cell(2,1,empty($nilai->sg_minyak)?'-':$nilai->sg_minyak,1,0,'C');
    $pdf->Ln();
endforeach;

$pdf->tanda_tangan();

$pdf->output('fmbuf_'.$nomor_analisis, 'I');
