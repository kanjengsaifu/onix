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
$pdf->Cell(0,0,'ANALISIS MINERAL BUTIR (AYAK)',0,0,'C');
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

$detail_conto_fisika = $this->hasil_analisis_m->get_detail_conto_fisika($id_conto, 'FMBMA');
/*
 * DESKRIPSI PETROGRAFI
 */
$pdf->Ln(1);
$pdf->SetFont('Arial','B',12);
$pdf->Cell(3.1,1,'I. ANALISA AYAK / BESAR BUTIR');
$pdf->Ln(1);
$pdf->SetFont('Arial','',9);
$pdf->SetFont('Arial','',9);
$pdf->multiCell(2.5,0.4,'UKURAN FRAKSI (mikro-m)', 1);
$pdf->setY(9.5);
$pdf->setX(3.5);
$pdf->Cell(2.4,1.2,'+425',1,0,'C');
$pdf->Cell(2.4,1.2,'-425+300',1,0,'C');
$pdf->Cell(2.4,1.2,'-300+180',1,0,'C');
$pdf->Cell(2.4,1.2,'-180+150',1,0,'C');
$pdf->Cell(2.4,1.2,'-150+106',1,0,'C');
$pdf->Cell(2.4,1.2,'-106+75',1,0,'C');
$pdf->Cell(2.4,1.2,'<75',1,0,'C');
$pdf->Ln();
$pdf->Cell(2.5,1.2,'% FRAKSI',1,0,'C');
$pdf->Cell(2.4,1.2,'16.130',1,0,'C');
$pdf->Cell(2.4,1.2,'23.617',1,0,'C');
$pdf->Cell(2.4,1.2,'36.426',1,0,'C');
$pdf->Cell(2.4,1.2,'10.775',1,0,'C');
$pdf->Cell(2.4,1.2,'9.391',1,0,'C');
$pdf->Cell(2.4,1.2,'3.027',1,0,'C');
$pdf->Cell(2.4,1.2,'0.635',1,0,'C');
$pdf->Ln();

$pdf->setX(1);
$pdf->SetFont('Arial','B',12);
$pdf->Cell(3.1,1,'II. DIAGRAM BALOK SEBARAN BESAR BUTIR :  ');
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


$pdf->ln(3);
/**
 * Deskripsi
 */
$pdf->setY($pdf->GetY()+2.2);
if(ada_foto($detail_conto_fisika[0]->foto_1)!= FALSE)
{
    $pdf->MultiCell(8,0.3,$detail_conto_fisika[0]->deskripsi_1);
}

$pdf->Ln(1);


/*
 * KOMPOSISI
 */
$pdf->setX(1);
$pdf->SetFont('Arial','B',12);
$pdf->Cell(3.1,1,'III. KOMPOSISI MINERAL :  ');
$pdf->SetFont('Arial','',9);
$pdf->SetLeftMargin(2.4);
$pdf->Ln();
$pdf->MultiCell(20,0.3,$detail_conto_fisika[0]->komposisi);
$pdf->Ln(0);




$pdf->Output();
/*
 * END PDF
 */
