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

/*
 * Header
 */
$pdf->Image(base_url(IMAGES.'logo.png'),2,1.5,3);

$pdf->SetFont('Arial','',10);
$pdf->SetY(1);
$pdf->Cell(0,0.5,'',0,0,'R'); //kode formulir

$pdf->Ln(0.43);

$pdf->SetFont('Arial','',10);
$pdf->SetX(6);
$pdf->Cell(0,0.75,'KEMENTRIAN SUMBER DAYA MINERAL REPUBLIK INDONESIA',0,0,'C');

$pdf->Ln();

$pdf->SetFont('Arial','',14);
$pdf->SetX(6);
$pdf->Cell(0,0.5,'BADAN GEOLOGI',0,0,'C');

$pdf->Ln();

$pdf->SetFont('Arial','B',14);
$pdf->SetX(6);
$pdf->Cell(0,0.75,'PUSAT SUMBER DAYA GEOLOGI',0,0,'C');

$pdf->Ln();

$pdf->SetFont('Arial','',9);
$pdf->SetX(6);
$pdf->Cell(0,0.5,'Jalan Soekarno-Hatta No. 444 Bandung 40254',0,0,'C');

$pdf->Ln();

$pdf->SetFont('Arial','',9);

$pdf->SetTextColor(20,20,60);
$pdf->SetX(6);
$pdf->Cell(0,0.5,'Telex 28619A Kawat: DSM BANDUNG Telp. (022) 5202698 Facsimile (022) 5226264',0,0,'C');

$pdf->Ln();

$pdf->Line(1,4.5,20.7,4.5);

$pdf->Ln(1);
/*
 * END HEADER
 */

$pdf->SetFont('Arial','B',12);
$pdf->SetX(2);
$pdf->Cell(0,0,'A N A L I S I S   P E T R O G R A F I',0,0,'C');
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



///*
// * DESKRIPSI PETROGRAFI
// */
//$pdf->Ln(1);
//$pdf->SetFont('Arial','B',12);
//$pdf->Cell(3.1,1,'Deskripsi Petrografi:');
//$pdf->Ln(1);
//$pdf->SetFont('Arial','',9);
//foreach($uji_parameter as $data):
//    $pdf->SetFont('Arial','B',9);
//    $pdf->MultiCell(19.6,0.4,$data->nama.',');
//    $pdf->SetFont('Arial','',9);
//    $pdf->MultiCell(19.6,0.4,$data->deskripsi.'.');
//    $pdf->Ln(0);
//endforeach;
$pdf->Ln();

///*
// * KOMPOSISI
// */
//$pdf->SetFont('Arial','B',12);
//$pdf->Cell(3.1,1,'Komposisi (% volume) :');
//$pdf->SetLeftMargin(6);
//$pdf->SetFont('Arial','',9);
//$t_komposisi = '';
//foreach($uji_parameter as $komposisi):
//    $t_komposisi .= $komposisi->nama.' ('.$komposisi->nilai.'), ';
//endforeach;
//$pdf->MultiCell(14,1,$t_komposisi);
//$pdf->Ln(0);


$pdf->Ln();
$pdf->setX(1);
$pdf->SetFont('Arial','B',12);
$pdf->Cell(3.1,1,'Fotomikrograf :  ');
$pdf->SetFont('Arial','',9);
$pdf->SetLeftMargin(2.4);
$pdf->Ln();

/*
 * Foto
 */
$detail_conto_fisika = $this->hasil_analisis_m->get_detail_conto_fisika($id_conto);

foreach($detail_conto_fisika as $detail):
    $pdf->SetFont('Arial','B',9);
    $pdf->Cell(3.1,1,$detail->type_analisis);
    $pdf->SetFont('Arial','',9);

    $pdf->Ln();

    if(!empty($detail->deskripsi))
        $pdf->Cell(6.1,1,$detail->deskripsi);
    else
        $pdf->Cell(6.1,1,'Tidak Ada deskripsi.');


    if(ada_foto($detail->id.$detail->id_conto)!= FALSE)
        $pdf->Cell(0, 4, $pdf->Image(base_url(IMAGES.'foto_conto/'.$detail->id.$detail->id_conto.'.jpg'), $pdf->GetX(), $pdf->GetY(), 10, 4), 0, 0, 'L', false );
    else
        $pdf->Cell(3.1,1,'Tidak Ada foto.');



    $pdf->Ln();

endforeach;



$pdf->Ln();

/*
 * GARIS PINGGIR
 */
//$pdf->Line(1,8.5,1,$pdf->getY());//garis kiri
//$pdf->Line(20.7,$pdf->getY(),20.7,8.5);//garis kanan

$pdf->tanda_tangan();

$pdf->Output();
/*
 * END PDF
 */
