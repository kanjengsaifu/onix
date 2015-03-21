<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/5/13
 * Time: 3:05 PM
 */

$pdf = $this->fpdf;

$pdf->fpdf('P','cm','letter');
$pdf->setTitle('S_' . $analisis->nomor_analisis);

$pdf->Open();

$pdf->AliasNbPages();

$pdf->AddPage();

/*
 * Header
 */
$pdf->Image(base_url(IMAGES.'logo.png'),1.5,1.75,2.75);

$pdf->SetFont('Arial','',10);
$pdf->SetY(1);

$pdf->Line(1,1.5,20.7,1.5);//garis atas
$pdf->Line(1,1.5,1,27);//garis kiri
$pdf->Line(20.7,27,20.7,1.5);//garis kanan
$pdf->Line(1,27,20.7,27);//garis bawah

$pdf->Ln(0.43);

$pdf->SetFont('Arial','',10);
$pdf->SetX(2);
$pdf->Cell(0,0.75,'KEMENTERIAN ENERGI DAN SUMBER DAYA MINERAL REPUBLIK INDONESIA',0,0,'C');

$pdf->Ln();

$pdf->SetFont('Arial','',14);
$pdf->SetX(2);
$pdf->Cell(0,0.5,'BADAN GEOLOGI',0,0,'C');

$pdf->Ln();

$pdf->SetFont('Arial','B',14);
$pdf->SetX(2);
$pdf->Cell(0,0.75,'PUSAT SUMBER DAYA GEOLOGI',0,0,'C');

$pdf->Ln();

$pdf->SetFont('Arial','',9);
$pdf->SetX(2);
$pdf->Cell(0,0.5,'Jl. Soekarno-Hatta No. 444 Bandung 40254',0,0,'C');

$pdf->Ln();

$pdf->SetFont('Arial','',9);

$pdf->SetTextColor(20,20,60);
$pdf->SetX(2);
$pdf->Cell(0,0.5,'Telex 28619A Kawat: DSM BANDUNG Telp. (022) 5202698 Facsimile (022) 5226264',0,0,'C');

$pdf->Ln();

$pdf->Line(1,4.5,20.7,4.5);

$pdf->Ln();

$pdf->Image(base_url(IMAGES.'logo-kan.png'),18,2.3,2.5);

/*
 * END HEADER
 */

$pdf->SetMargins(1.5,1,1.5);

$pdf->SetFont('Arial','B',10);

$pdf->Cell(0,0.75,'PUSAT SUMBER DAYA GEOLOGI',0,0,'C');

$pdf->Ln();

$pdf->SetFont('Arial','I',10);
$pdf->SetTextColor(20,150,220);
$pdf->Cell(0,0.2,'CENTER FOR GEOLOGICAL RESOURCES TESTING LABORATORY',0,0,'C');
$pdf->SetTextColor(0,0,0);
$pdf->Ln(1);

$pdf->SetFont('Arial','',10);
$pdf->SetX(3);
$pdf->Cell(0,0.75,'NO. '. strtoupper($analisis->nomor_analisis),0,0,'L');
$pdf->Cell(0,0.75,'Tanggal/Date : '. tanggal_format_indonesia(now()),0,0,'R');
$pdf->Ln(1);

$pdf->SetFont('Arial','U',14);
$pdf->Cell(0,0.75,'S E R T I F I K A T  A N A L I S I S',0,0,'C');
$pdf->Ln();

$pdf->SetFont('Arial','I',14);
$pdf->SetTextColor(20,150,220);
$pdf->Cell(0,0.50,'(CERTIFICATE OF ANALISIS)',0,3,'C');
$pdf->SetTextColor(0,0,0);
$pdf->Ln();
//Dibuat Untuk
$pdf->SetX(3);
$pdf->SetFont('Arial','U',10);
$pdf->Cell(0,0.75,'Dibuat untuk',0,0,'L');
$pdf->SetX(9);
$pdf->SetFont('Arial','',10);
$pdf->Cell(0,0.75,':',0,0,'L');
$pdf->SetX(10);
$pdf->Cell(0,0.75,$pemohon->nama_sertifikat,0,0,'L');
$pdf->Ln();
$pdf->SetX(3);
$pdf->SetFont('Arial','I',10);
$pdf->SetTextColor(20,150,220);
$pdf->Cell(0,0.25,'Certified for',0,0,'L');
$pdf->SetTextColor(0,0,0);
$pdf->Ln(0.5);
//alamat
$pdf->SetX(3);
$pdf->SetFont('Arial','U',10);
$pdf->Cell(0,0.75,'Alamat',0,0,'L');
$pdf->SetX(9);
$pdf->SetFont('Arial','',10);
$pdf->Cell(0,0.75,':',0,0,'L');
$pdf->SetX(10);
$pdf->Cell(0,0.75,$pemohon->alamat,0,0,'L');
$pdf->Ln();
$pdf->SetX(3);
$pdf->SetFont('Arial','I',10);
$pdf->SetTextColor(20,150,220);
$pdf->Cell(0,0.25,'Address',0,0,'L');
$pdf->SetTextColor(0,0,0);
$pdf->Ln(0.5);
//jenis conto
$pdf->SetX(3);
$pdf->SetFont('Arial','U',10);
$pdf->Cell(0,0.75,'Jenis Conto',0,0,'L');
$pdf->SetX(9);
$pdf->SetFont('Arial','',10);
$pdf->Cell(0,0.75,':',0,0,'L');
$pdf->SetX(10);
$pdf->Cell(0,0.75,$analisis->jenis_conto,0,0,'L');
$pdf->Ln();
$pdf->SetX(3);
$pdf->SetFont('Arial','I',10);
$pdf->SetTextColor(20,150,220);
$pdf->Cell(0,0.25,'Type of Sample',0,0,'L');
$pdf->SetTextColor(0,0,0);
$pdf->Ln(0.5);
//jumlah conto
$pdf->SetX(3);
$pdf->SetFont('Arial','U',10);
$pdf->Cell(0,0.75,'Jumlah Conto',0,0,'L');
$pdf->SetX(9);
$pdf->SetFont('Arial','',10);
$pdf->Cell(0,0.75,':',0,0,'L');
$pdf->SetX(10);
$pdf->Cell(0,0.75,$analisis->jumlah_conto.'  (' . terbilang($analisis->jumlah_conto) . ')',0,0,'L');
$pdf->Ln();
$pdf->SetX(3);
$pdf->SetFont('Arial','I',10);
$pdf->SetTextColor(20,150,220);
$pdf->Cell(0,0.25,'Amount of Sample',0,0,'L');
$pdf->SetTextColor(0,0,0);
$pdf->Ln(0.5);
//asal conto
$pdf->SetX(3);
$pdf->SetFont('Arial','U',10);
$pdf->Cell(0,0.75,'Asal Conto',0,0,'L');
$pdf->SetX(9);
$pdf->SetFont('Arial','',10);
$pdf->Cell(0,0.75,':',0,0,'L');
$pdf->SetX(10);
$pdf->Cell(0,0.75,$analisis->nama_lokasi,0,0,'L');
$pdf->Ln();
$pdf->SetX(3);
$pdf->SetFont('Arial','I',10);
$pdf->SetTextColor(20,150,220);
$pdf->Cell(0,0.25,'Origin of Sample',0,0,'L');
$pdf->SetTextColor(0,0,0);
$pdf->Ln(0.5);
//nomor labolatorium
$pdf->SetX(3);
$pdf->SetFont('Arial','U',10);
$pdf->Cell(0,0.75,'Nomor Laboratorium',0,0,'L');
$pdf->SetX(9);
$pdf->SetFont('Arial','',10);
$pdf->Cell(0,0.75,':',0,0,'L');
$pdf->SetX(10);
$pdf->Cell(0,0.75,$analisis->nomor_analisis,0,0,'L');
$pdf->Ln();
$pdf->SetX(3);
$pdf->SetFont('Arial','I',10);
$pdf->SetTextColor(20,150,220);
$pdf->Cell(0,0.25,'Laboratory Number',0,0,'L');
$pdf->SetTextColor(0,0,0);
$pdf->Ln(0.5);
//Tgl Conto Diterima
$pdf->SetX(3);
$pdf->SetFont('Arial','U',10);
$pdf->Cell(0,0.75,'Tanggal Conto Diterima',0,0,'L');
$pdf->SetX(9);
$pdf->SetFont('Arial','',10);
$pdf->Cell(0,0.75,':',0,0,'L');
$pdf->SetX(10);
$pdf->Cell(0,0.75,tanggal_format_indonesia($analisis->tanggal_terima),0,0,'L');
$pdf->Ln(0.75);
$pdf->SetX(3);
$pdf->SetFont('Arial','I',10);
$pdf->SetTextColor(20,150,220);
$pdf->Cell(0,0.25,'Date of Sample Received',0,0,'L');
$pdf->SetTextColor(0,0,0);
$pdf->Ln(0.5);
//tanggal Conto Dianalisis
$pdf->SetX(3);
$pdf->SetFont('Arial','U',10);
$pdf->Cell(0,0.75,'Tanggal Conto Analisis',0,0,'L');
$pdf->SetX(9);
$pdf->SetFont('Arial','',10);
$pdf->Cell(0,0.75,':',0,0,'L');
$pdf->SetX(10);
$pdf->Cell(0,0.75,tanggal_format_indonesia($analisis->tanggal_daftar),0,0,'L');
$pdf->Ln();
$pdf->SetX(3);
$pdf->SetFont('Arial','I',10);
$pdf->SetTextColor(20,150,220);
$pdf->Cell(0,0.25,'Date of Sample Analysis',0,0,'L');
$pdf->SetTextColor(0,0,0);
$pdf->Ln(1.5);
//footer
$pdf->SetFont('Arial','U',12);
$pdf->Cell(0,0.75,'Hasil Analisis Dilampirkan Pada Halaman Berikut',0,0,'C');
$pdf->Ln();
$pdf->SetFont('Arial','I',11);
$pdf->SetTextColor(20,150,220);
$pdf->Cell(0,0.5,'Result of analisys is attached on the following pages',0,0,'C');
$pdf->SetTextColor(0,0,0);
$pdf->Ln(1);

$pdf->SetFont('Arial','U',9);
$pdf->Cell(0,0.35,'Catatan: ',0,0,'L');
$pdf->SetX(3);
$pdf->SetFont('Arial','',9);
$pdf->Cell(0,0.35,'1. ',0,0,'L');
$pdf->SetFont('Arial','U',9);
$pdf->SetX(3.5);
$pdf->Cell(0,0.35,'Hasil analisis hanya berlaku untuk contoh yang diuji',0,0,'L');
$pdf->Ln();
$pdf->SetFont('Arial','I',9);
$pdf->Cell(0,0.5,'Notes ',0,0,'L');
$pdf->SetX(3.5);
$pdf->SetTextColor(20,150,220);
$pdf->Cell(0,0.5,'Analysis result are valid only for tested sample',0,0,'L');
$pdf->SetTextColor(0,0,0);
$pdf->Ln();
$pdf->SetX(3);
$pdf->SetFont('Arial','',9);
$pdf->Cell(0,0.35,'2. ',0,0,'L');
$pdf->SetFont('Arial','U',9);
$pdf->SetX(3.5);
$pdf->Cell(0,0.35,'Sertifikat tidak boleh diperpanjang tanpa izin dari labolatorium yang berwenang',0,0,'L');
$pdf->Ln();
$pdf->SetX(3.5);
$pdf->SetFont('Arial','I',9);
$pdf->SetTextColor(20,150,220);
$pdf->Cell(0,0.5,'pdf certificate shall not be multiplied without written',0,0,'L');
$pdf->SetTextColor(0,0,0);

/**
 * Page number
 */
//move pionter at the bottom of the page
//set font to Arial, Bold, size 10
$pdf->SetFont( 'Arial', 'B', 10 );
//set font color to gray
$pdf->SetTextColor( 150, 150, 150 );
//write Page No
$pdf->Text( 18.5, 26.5, 'halaman: 1', 0, 0, 'R' );


$pdf->Output();
?>