<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/9/13
 * Time: 6:55 PM
 */

function titik($array ,$value)
{
    $last = end(array_keys($array));
    return $last[0];
}

$pdf = $this->pdf;

$pdf->fpdf('P','cm','letter');

$pdf->Open();

$pdf->AliasNbPages();

$pdf->AddPage();

$pdf->SetFont('Arial','B',12);
$pdf->SetX(2);
$pdf->Cell(0,0,'IDENTIFIKASI MINERAL',0,0,'C');
$pdf->Ln(1);

/*
 * KETERANGAN
 */
$pdf->SetFont('Arial','B',9);
$pdf->Cell(3.1,1,'No. Conto',1);
$pdf->SetFont('Arial','',9);
$pdf->Cell(2.6,1,no_conto($conto->id_conto),1);
$pdf->SetFont('Arial','B',9);
$pdf->Cell(2.5,1,'Pemilik',1);
$pdf->SetFont('Arial','',9);
$pdf->Cell(6,1,nama_pemohon($id_pemohon),1);
$pdf->SetFont('Arial','B',9);
$pdf->Cell(2.5,1,'Pemeriksa',1);
$pdf->SetFont('Arial','',9);
$pdf->Cell(3,1,'PSDG',1);
$pdf->Ln(1);
$pdf->SetFont('Arial','B',9);
$pdf->Cell(3.1,1,'Lokasi Daerah',1);
$pdf->SetFont('Arial','',9);
$pdf->Cell(4,1,$lokasi,1);
$pdf->SetFont('Arial','B',9);
$pdf->Cell(2.5,1,'Nama Batuan',1);
$pdf->SetFont('Arial','',9);
$pdf->Cell(4.6,1,$jenis_conto,1);
$pdf->SetFont('Arial','B',9);
$pdf->Cell(2.5,1,'Tanggal',1);
$pdf->SetFont('Arial','',9);
$pdf->Cell(3,1,tanggal_format_indonesia(date('Y-m-d')),1);

/*
 * detail conto fisika
 */

$detail_conto_fisika = $this->hasil_analisis_m->get_detail_conto_fisika($id_conto, 'FMBIM');
/*
 * DESKRIPSI PETROGRAFI
 */
$pdf->Ln(1);
$pdf->SetFont('Arial','B',12);
$pdf->Cell(3.1,1,'Deskripsi Petrografi:');
$pdf->Ln(1);
$pdf->SetFont('Arial','',9);
$pdf->MultiCell(19.6,0.4,$detail_conto_fisika[0]->d_mikroskopis.'.');
$pdf->Ln(0);
$pdf->Ln();

/*
 * KOMPOSISI
 */
$pdf->SetFont('Arial','B',12);
$pdf->Cell(3.1,1,'Komposisi (% volume) :');
$pdf->SetFont('Arial','',9);
$pdf->Ln(1);
$pdf->MultiCell(14,0.3,$detail_conto_fisika[0]->komposisi);
$pdf->Ln(0);


$pdf->Ln();
$pdf->setX(1);
$pdf->SetFont('Arial','B',12);
$pdf->Cell(3.1,1,'Fotomikrograf :  ');
$pdf->SetFont('Arial','',9);
$pdf->SetLeftMargin(2.4);
$pdf->Ln();


/*
 * Foto 1
 */
if(ada_foto($detail_conto_fisika[0]->foto_1)!= FALSE)
{
    $pdf->Cell( 0, 5.2, $pdf->Image(base_url(IMAGES.'foto_conto/'.$detail_conto_fisika[0]->foto_1), $pdf->GetX(), $pdf->GetY(), 8, 5), 0, 0, 'L', false );
}

/*
 * Foto 2
 */

if(ada_foto($detail_conto_fisika[0]->foto_2)!= FALSE)
{
    $pdf->Cell( 0, 5.2, $pdf->Image(base_url(IMAGES.'foto_conto/'.$detail_conto_fisika[0]->foto_2), $pdf->GetX()-9, $pdf->GetY(), 8, 5), 0, 0, 'L', false );
}

$pdf->ln(3);
/**
 * Deskripsi
 */
$pdf->setY($pdf->GetY()+2.2);
if(ada_foto($detail_conto_fisika[0]->foto_1)!= FALSE)
{
    $pdf->MultiCell(8,0.3,$detail_conto_fisika[0]->deskripsi_1);
}

if(ada_foto($detail_conto_fisika[0]->foto_2)!= FALSE)
{
    $pdf->setY($pdf->GetY()-1.5);
    $pdf->setX($pdf->GetX()+9.2);
    $pdf->MultiCell(8,0.3,$detail_conto_fisika[0]->deskripsi_2);
}

$pdf->Ln(1);

$pdf->Line(1,$pdf->getY(),20.7,$pdf->getY());
/*
 * GARIS PINGGIR
 */
$pdf->Line(1,8.5,1,$pdf->getY());//garis kiri
$pdf->Line(20.7,$pdf->getY(),20.7,8.5);//garis kanan

//$pdf->tanda_tangan();

$pdf->Output();
/*
 * END PDF
 */
