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
$pdf->Cell(0,0,'HASIL SEM(Scanning Electron Microscopy) & EDS',0,0,'C');
$pdf->Ln(1);

/*
 * KETERANGAN
 */
$pdf->SetFont('Arial','B',12);
$pdf->Cell(3.1,1,'No. Conto :');
$pdf->Cell(2.6,1,no_conto($conto->id_conto), 0, 0,'C');
$pdf->ln();
$pdf->Cell(3.1,1,'Lokasi: ');
$pdf->Cell(5.6,1,$lokasi.', '.$provinsi, 0, 0,'C');



/*
 * detail conto fisika
 */

$detail_conto_fisika = $this->hasil_analisis_m->get_detail_conto_fisika($id_conto, 'FMBSE');
/*
 * Foto 1
 */
if(ada_foto($detail_conto_fisika[0]->foto_1)!= FALSE)
{
    $pdf->Cell( 0, 5.2, $pdf->Image(base_url(IMAGES.'foto_conto/'.$detail_conto_fisika[0]->foto_1), 2, 10, 8, 5), 0, 0, 'L', false );
    $pdf->MultiCell(8,0.3,$detail_conto_fisika[0]->deskripsi_1);
}


/*
 * Foto 2
 */
if(ada_foto($detail_conto_fisika[0]->foto_2)!= FALSE)
{
    $pdf->Cell( 0, 5.2, $pdf->Image(base_url(IMAGES.'foto_conto/'.$detail_conto_fisika[0]->foto_2), 2, 18, 8, 5), 0, 0, 'L', false );
    $pdf->MultiCell(8,0.3,$detail_conto_fisika[0]->deskripsi_2);
}

$pdf->ln(3);

/**
 * Elemento
 */
$nilai = json_decode($detail_conto_fisika[0]->nilai);

$pdf->setY(10);
$pdf->setX(11);
$pdf->SetFont('Arial','B',12);
$pdf->Cell(3,1,'Element',1,0,'C');
$pdf->Cell(3,1,'Wt%',1,0,'C');
$pdf->Cell(3,1,'At%',1,0,'C');
$pdf->ln();
$pdf->setY(11);
$pdf->setX(11);
$pdf->Cell(3,1,'OK',1,0,'C');
$pdf->SetFont('Arial','',12);
$pdf->Cell(3,1,$nilai[0],1,0,'C');
$pdf->Cell(3,1,$nilai[2],1,0,'C');
$pdf->ln();
$pdf->setY(12);
$pdf->setX(11);
$pdf->Cell(3,1,'MgK',1,0,'C');
$pdf->SetFont('Arial','',12);
$pdf->Cell(3,1,$nilai[2],1,0,'C');
$pdf->Cell(3,1,$nilai[3],1,0,'C');
$pdf->ln();
$pdf->setY(13);
$pdf->setX(11);
$pdf->SetFont('Arial','B',12);
$pdf->Cell(3,1,'Matrix',1,0,'C');
$pdf->SetFont('Arial','',12);
$pdf->Cell(3,1,$nilai[4],1,0,'C');
$pdf->Cell(3,1,$nilai[5],1,0,'C');



$pdf->Ln(1);


//$pdf->tanda_tangan();

$pdf->Output();
/*
 * END PDF
 */
