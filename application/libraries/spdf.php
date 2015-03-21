<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/9/13
 * Time: 9:35 PM
 */

$CI =& get_instance();
$CI->load->library('fpdf');

class Spdf extends FPDF
{
    public function header()
    {
        $this->Image(base_url(IMAGES.'logo.png'),2,1.5,3);

        $this->SetFont('Arial','',10);
        $this->SetY(1);
        $this->Cell(0,0.5,'',0,0,'R'); //kode formulir

        $this->Ln(0.43);

        $this->SetFont('Arial','',10);
        $this->SetX(6);
        $this->Cell(0,0.75,'KEMENTRIAN SUMBER DAYA MINERAL REPUBLIK INDONESIA',0,0,'C');

        $this->Ln();

        $this->SetFont('Arial','',14);
        $this->SetX(6);
        $this->Cell(0,0.5,'BADAN GEOLOGI',0,0,'C');

        $this->Ln();

        $this->SetFont('Arial','B',14);
        $this->SetX(6);
        $this->Cell(0,0.75,'PUSAT SUMBER DAYA GEOLOGI',0,0,'C');

        $this->Ln();

        $this->SetFont('Arial','',9);
        $this->SetX(6);
        $this->Cell(0,0.5,'Jalan Soekarno-Hatta No. 444 Bandung 40254',0,0,'C');

        $this->Ln();

        $this->SetFont('Arial','',9);

        $this->SetTextColor(20,20,60);
        $this->SetX(6);
        $this->Cell(0,0.5,'Telex 28619A Kawat: DSM BANDUNG Telp. (022) 5202698 Facsimile (022) 5226264',0,0,'C');

        $this->Ln();

        $this->Line(1,4.5,20.7,4.5);

        $this->Ln();


        $this->SetFont('Arial','B',12);
        $this->SetX(2);
        $this->Cell(0,0,'LABORATORIUM PUSAT SUMBER DAYA GEOLOGI',0,0,'C');
        $this->Ln(0.6);
        $this->SetFont('Arial','B',12);
        $this->SetX(2);
        $this->Cell(0,0,'ANALISIS MINERAL BUTIR',0,0,'C');
        $this->Ln(1);
    }

}
