<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/5/13
 * Time: 4:29 PM
 */

$CI =& get_instance();
$CI->load->library('fpdf');

class PDF extends FPDF {

    var $widths;
    var $aligns;

    function SetWidths($w)
    {
        //Set the array of column widths
        $this->widths=$w;
    }

    function SetAligns($a)
    {
        //Set the array of column alignments
        $this->aligns=$a;
    }

    function Row($data)
    {
        //Calculate the height of the row
        $nb=0;
        for($i=0;$i<count($data);$i++)
            $nb=max($nb, $this->NbLines($this->widths[$i], $data[$i]));
        $h=0.5*$nb;
        //Issue a page break first if needed
        $this->CheckPageBreak($h);
        //Draw the cells of the row
        for($i=0;$i<count($data);$i++)
        {
            $w=$this->widths[$i];
            $a=isset($this->aligns[$i]) ? $this->aligns[$i] : 'L';
            //Save the current position
            $x=$this->GetX();
            $y=$this->GetY();
            //Draw the border
            $this->Rect($x, $y, $w, $h);
            //Print the text
            $this->MultiCell($w, 0.5, $data[$i], 0, $a);
            //Put the position to the right of the cell
            $this->SetXY($x+$w, $y);
        }
        //Go to the next line
        $this->Ln($h);
    }

    function CheckPageBreak($h)
    {
        //If the height h would cause an overflow, add a new page immediately
        if($this->GetY()+$h>$this->PageBreakTrigger)
            $this->AddPage($this->CurOrientation);
    }

    function NbLines($w, $txt)
    {
        //Computes the number of lines a MultiCell of width w will take
        $cw=&$this->CurrentFont['cw'];
        if($w==0)
            $w=$this->w-$this->rMargin-$this->x;
        $wmax=($w-2*$this->cMargin)*1000/$this->FontSize;
        $s=str_replace("\r", '', $txt);
        $nb=strlen($s);
        if($nb>0 and $s[$nb-1]=="\n")
            $nb--;
        $sep=-1;
        $i=0;
        $j=0;
        $l=0;
        $nl=1;
        while($i<$nb)
        {
            $c=$s[$i];
            if($c=="\n")
            {
                $i++;
                $sep=-1;
                $j=$i;
                $l=0;
                $nl++;
                continue;
            }
            if($c==' ')
                $sep=$i;
            $l+=$cw[$c];
            if($l>$wmax)
            {
                if($sep==-1)
                {
                    if($i==$j)
                        $i++;
                }
                else
                    $i=$sep+1;
                $sep=-1;
                $j=$i;
                $l=0;
                $nl++;
            }
            else
                $i++;
        }
        return $nl;
    }


//    function Header() {
//        $this->Image('logo.jpg',2,1.5,3);
//
//        $this->SetFont('Arial','',10);
//        $this->SetY(1);
//        $this->Cell(0,0.5,'<<KODE FORMULIR>>',0,0,'R');
//
//        $this->Line(1,1.5,20.7,1.5);//garis atas
//        $this->Line(1,1.5,1,27);//garis kiri
//        $this->Line(20.7,27,20.7,1.5);//garis kanan
//        $this->Line(1,27,20.7,27);//garis bawah
//
//        $this->Ln(0.43);
//
//        $this->SetFont('Arial','',10);
//        $this->SetX(6);
//        $this->Cell(0,0.75,'KEMENTRIAN SUMBER DAYA MINERAL REPUBLIK INDONESIA',0,0,'C');
//
//        $this->Ln();
//
//        $this->SetFont('Arial','',14);
//        $this->SetX(6);
//        $this->Cell(0,0.5,'BADAN GEOLOGI',0,0,'C');
//
//        $this->Ln();
//
//        $this->SetFont('Arial','B',14);
//        $this->SetX(6);
//        $this->Cell(0,0.75,'PUSAT SUMBER DAYA GEOLOGI',0,0,'C');
//
//        $this->Ln();
//
//        $this->SetFont('Arial','',9);
//        $this->SetX(6);
//        $this->Cell(0,0.5,'Jalan Soekarno-Hatta No. 444 Bandung 40254',0,0,'C');
//
//        $this->Ln();
//
//        $this->SetFont('Arial','',9);
//
//        $this->SetTextColor(20,20,60);
//        $this->SetX(6);
//        $this->Cell(0,0.5,'Telex 28619A Kawat: DSM BANDUNG Telp. (022) 5202698 Facsimile (022) 5226264',0,0,'C');
//
//        $this->Ln();
//
//        $this->Line(1,4.5,20.7,4.5);
//
//
//
//        $this->Ln();
//    }

    function Header()
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

        // jika L panjangin jika p pendekin; $this->orientation;
        if($this->CurOrientation == 'P')
            $this->Line(1,4.5,20.7,4.5);
        else
            $this->Line(1,4.5,27,4.5);

        $this->Ln();


        $this->SetFont('Arial','B',12);
        $this->SetX(2);
        $this->Cell(0,0,'LABORATORIUM PUSAT SUMBER DAYA GEOLOGI',0,0,'C');
        $this->Ln(0.6);
    }

    function Footer()
    {
        //move pionter at the bottom of the page
        $this->SetY( -7 );

        //set font to Arial, Bold, size 10
        $this->SetFont( 'Arial', 'B', 10 );

        //set font color to gray
        $this->SetTextColor( 150, 150, 150 );

        //write Page No
        $page = $this->pageNo() + 1;
        $this->Cell( 0, 11, 'halaman: ' . $page, 0, 0, 'R' );
    }

    function tabel_fmbab($list_conto)
    {
        $CI =& get_instance();
        $CI->load->model('parameter_m');
        $this->addpage();
        $this->cell(3.1,1,'KODE CONTO',1,0,'C');
        $i = 0;
        foreach($list_conto as $data=>$val):
            $this->cell(2.8,1,no_conto($val->id_conto),1,0,'C');
        endforeach;

        $this->ln();
        $this->cell(3.1,1,'BERAT KONS (gr)',1,0,'C');
        foreach($list_conto as $data=>$val):
            $this->cell(2.8,1,$val->berat,1,0,'C');
        endforeach;
        $this->ln();
        $this->cell(19.9,1,'Komposisi Mineral (%)',0,0,'C');
        $this->ln();

        $parameter = $CI->parameter_m->get_param_by_type('fmbab');
        foreach($parameter as $param):
            $this->cell(3.1,1,$param->nama,1,0,'C');
                foreach($list_conto as $nilai):
                    $this->cell(2.8,1,nilai($nilai->id_conto, $param->id_parameter),1,0,'C');
                endforeach;
            $this->ln();
        endforeach;

    }

    function tabel_fmbmb($list_conto)
    {
        $CI =& get_instance();
        $CI->load->model('parameter_m');
        $this->addpage();
        $this->cell(3.1,1,'KODE CONTO',1,0,'C');
        $i = 0;
        foreach($list_conto as $data=>$val):
            $this->cell(2.8,1,no_conto($val->id_conto),1,0,'C');
        endforeach;

        $this->ln();
        $this->cell(3.1,1,'BERAT KONS (gr)',1,0,'C');
        foreach($list_conto as $data=>$val):
            $this->cell(2.8,1,$val->berat,1,0,'C');
        endforeach;
        $this->ln();
        $this->cell(19.9,1,'Komposisi Mineral (%)',0,0,'C');
        $this->ln();

        $parameter = $CI->parameter_m->get_param_by_type('fmbab');
        foreach($parameter as $param):
            $this->cell(3.1,1,$param->nama,1,0,'C');
            foreach($list_conto as $nilai):
                $this->cell(2.8,1,nilai($nilai->id_conto, $param->id_parameter),1,0,'C');
            endforeach;
            $this->ln();
        endforeach;

    }

    function tabel_fmbbj($list_conto)
    {
        $CI =& get_instance();
        $CI->load->model('parameter_m');
        $this->addpage();
        $this->cell(3.1,1,'KODE CONTO',1,0,'C');
        $i = 0;
        foreach($list_conto as $data=>$val):
            $this->cell(2.8,1,no_conto($val->id_conto),1,0,'C');
        endforeach;

        $this->ln();
        $this->cell(3.1,1,'BERAT KONS (gr)',1,0,'C');
        foreach($list_conto as $data=>$val):
            $this->cell(2.8,1,$val->berat,1,0,'C');
        endforeach;
        $this->ln();
        $this->cell(19.9,1,'Komposisi Mineral (%)',0,0,'C');
        $this->ln();

        $parameter = $CI->parameter_m->get_param_by_type('fmbbj');
        foreach($parameter as $param):
            $this->cell(3.1,1,$param->nama,1,0,'C');
            foreach($list_conto as $nilai):
                $this->cell(2.8,1,nilai($nilai->id_conto, $param->id_parameter),1,0,'C');
            endforeach;
            $this->ln();
        endforeach;

    }

    function tabel_kmikm($list_conto, $no_analisis, $jumlah_conto, $jenis_conto, $lokasi, $id_pemohon)
    {
        $CI =& get_instance();
        $CI->load->model('hasil_analisis_m');
        $this->addpage();
        $this->SetFont('Arial','B',12);
        $this->Cell(0,0,'HASIL ANALISIS KIMIA',0,0,'C');
        $this->Ln(1);
        /*
         * Keterangan
         */
        $this->SetX(3);
        $this->SetFont('Arial','B',9);
        $this->Cell(6.1,0.5,'NOMOR ANALISIS KIMIA');
        $this->Cell(2.6,0.5,': '.no_analisis($no_analisis));
        $this->ln();
        $this->SetX(3);
        $this->Cell(6.1,0.5,'CONTO YANG DIANALISIS');
        $this->Cell(2.6,0.5,': '.$jumlah_conto.' Conto '.$jenis_conto);
        $this->ln();
        $this->SetX(3);
        $this->Cell(6.1,0.5,'LOKASI');
        $this->Cell(2.6,0.5,': '.$lokasi);
        $this->ln();
        $this->SetX(3);
        $this->Cell(6.1,0.5,'ANALISIS UNTUK');
        $this->Cell(2.6,0.5,': '.nama_pemohon($id_pemohon));
        $this->ln(1);
        /*
         * END KETERANGAN
         */

        $this->cell(3.1,1,'KODE CONTO',1,0,'C');
        $i = 0;
        foreach($list_conto as $data=>$val):
            $this->cell(2.8,1,no_conto($val->id_conto),1,0,'C');
        endforeach;
        $this->ln();
        $parameter = $CI->hasil_analisis_m->get_param_by_id_conto($val->id_conto);
        foreach($parameter as $param):
            $satuan = iconv('UTF-8', 'windows-1252', $param->satuan);
            $this->cell(3.1,1,$param->nama.' '.$satuan,1,0,'C');
            foreach($list_conto as $nilai):
                $this->SetFont('Arial','',9);
                $this->cell(2.8,1,nilai($nilai->id_conto, $param->id_parameter),1,0,'C');
                $this->SetFont('Arial','B',9);
            endforeach;
            $this->ln();
        endforeach;

    }

    function tabel_kpbak($list_conto, $no_analisis, $jumlah_conto, $jenis_conto, $lokasi, $id_pemohon, $kode_conto='KC')
    {
        $CI =& get_instance();
        $CI->load->model('hasil_analisis_m');
        $this->addpage();
        $this->SetFont('Arial','B',12);
        $this->Cell(0,0,'HASIL ANALISIS KIMIA',0,0,'C');
        $this->Ln(1);
        /*
         * Keterangan
         */
        $this->SetX(3);
        $this->SetFont('Arial','B',9);
        $this->Cell(6.1,0.5,'NOMOR ANALISIS KIMIA');
        $this->Cell(2.6,0.5,': '.no_analisis($no_analisis));
        $this->ln();
        $this->SetX(3);
        $this->Cell(6.1,0.5,'CONTO YANG DIANALISIS');
        $this->Cell(2.6,0.5,': '.$jumlah_conto.' Conto '.$jenis_conto);
        $this->ln();
        $this->SetX(3);
        $this->Cell(6.1,0.5,'LOKASI');
        $this->Cell(2.6,0.5,': '.$lokasi);
        $this->ln();
        $this->SetX(3);
        $this->Cell(6.1,0.5,'ANALISIS UNTUK');
        $this->Cell(2.6,0.5,': '.nama_pemohon($id_pemohon));
        $this->ln(1);
        /*
         * END KETERANGAN
         */

        $this->cell(3.1,1,'KODE CONTO',1,0,'C');
        $i = 1;
        foreach($list_conto as $data=>$val):
            $this->cell(2.8,1,$kode_conto.' - '.str_pad($i++, 3, 0, STR_PAD_LEFT),1,0,'C');
        endforeach;
        $this->ln();
        $parameter = $CI->hasil_analisis_m->get_param_by_id_conto($val->id_conto);
        foreach($parameter as $param):
            setlocale(LC_CTYPE, 'en_US');
            $nama = $param->nama;

            // singkatan
            if($nama == 'Drilling Mud Test (Viskositas Relatif)' || $nama == 'Drilling Mud Test (CEC, Ca &Mg)' )
                $nama = 'DMT';

            $cek_sign_fix = iconv("UTF-8", "windows-1252", $nama);
            $this->cell(3.1,1, $cek_sign_fix.' '.$param->satuan,1,0,'C');
            foreach($list_conto as $nilai):
                $nilai_uji_parameter = nilai($nilai->id_conto, $param->id_parameter);
                $this->SetFont('Arial','',9);
                $this->cell(2.8,1,$nilai_uji_parameter[0].' '.$nilai_uji_parameter[1],1,0,'C');
                $this->SetFont('Arial','B',9);
            endforeach;
            $this->ln();
        endforeach;

    }

    function tabel_kbbap($list_conto, $no_analisis, $jumlah_conto, $jenis_conto, $lokasi, $id_pemohon)
    {
        $CI =& get_instance();
        $CI->load->model('hasil_analisis_m');
        $this->addpage();
        $this->SetFont('Arial','B',12);
        $this->Cell(0,0,'HASIL ANALISIS KIMIA',0,0,'C');
        $this->Ln(1);
        /*
         * Keterangan
         */
        $this->SetX(3);
        $this->SetFont('Arial','B',9);
        $this->Cell(6.1,0.5,'NOMOR ANALISIS KIMIA');
        $this->Cell(2.6,0.5,': '.no_analisis($no_analisis));
        $this->ln();
        $this->SetX(3);
        $this->Cell(6.1,0.5,'CONTO YANG DIANALISIS');
        $this->Cell(2.6,0.5,': '.$jumlah_conto.' Conto '.$jenis_conto);
        $this->ln();
        $this->SetX(3);
        $this->Cell(6.1,0.5,'LOKASI');
        $this->Cell(2.6,0.5,': '.$lokasi);
        $this->ln();
        $this->SetX(3);
        $this->Cell(6.1,0.5,'ANALISIS UNTUK');
        $this->Cell(2.6,0.5,': '.nama_pemohon($id_pemohon));
        $this->ln(1);
        /*
         * END KETERANGAN
         */

        $this->cell(3.1,1,'KODE CONTO',1,0,'C');
        $i = 0;
        foreach($list_conto as $data=>$val):
            $this->cell(2.8,1,no_conto($val->id_conto),1,0,'C');
        endforeach;
        $this->ln();
        $parameter = $CI->hasil_analisis_m->get_param_by_id_conto($val->id_conto);
        foreach($parameter as $param):
            $this->cell(3.1,1,$param->nama.' '.$param->satuan,1,0,'C');
            foreach($list_conto as $nilai):
                $this->SetFont('Arial','',9);
                $this->cell(2.8,1,nilai($nilai->id_conto, $param->id_parameter),1,0,'C');
                $this->SetFont('Arial','B',9);
            endforeach;
            $this->ln();
        endforeach;
    }

    function tabel_kimia_batubara($list_conto, $id, $nomor_analisis, $jumlah_conto, $jenis_conto, $lokasi, $id_pemohon, $kode_conto='KC')
    {
        $CI =& get_instance();
        $CI->load->model('hasil_analisis_m');
        $this->addpage();
        $this->SetFont('Arial','B',12);
        $this->Cell(0,0,'HASIL ANALISIS KIMIA',0,0,'C');
        $this->Ln(1);
        /*
         * Keterangan
         */
        $this->SetX(3);
        $this->SetFont('Arial','B',9);
        $this->Cell(6.1,0.5,'NOMOR ANALISIS');
        $this->Cell(2.6,0.5,': '.$nomor_analisis);
        $this->ln();
        $this->SetX(3);
        $this->Cell(6.1,0.5,'CONTO YANG DIANALISIS');
        $this->Cell(2.6,0.5,': '.$jumlah_conto.' Conto '.$jenis_conto);
        $this->ln();
        $this->SetX(3);
        $this->Cell(6.1,0.5,'LOKASI');
        $this->Cell(2.6,0.5,': '.$lokasi);
        $this->ln();
        $this->SetX(3);
        $this->Cell(6.1,0.5,'ANALISIS UNTUK');
        $this->Cell(2.6,0.5,': '.nama_pemohon($id_pemohon));
        $this->ln(1);
        /*
         * END KETERANGAN
         */

//        $this->cell(3.1,1,'KODE CONTO',1,0,'C');
        $i = 1;
//        foreach($list_conto as $data=>$val):
//            $this->cell(2.8,1,$kode_conto.' - '.str_pad($i++, 3, 0, STR_PAD_LEFT),1,0,'C');
//        endforeach;


        $th = array('ANALYSIS');
        $wth = array(3.1);
        $ath = array('C');

        $parameter_nonsatuan = array(
            'KMKGB01', //ph
            'KMKGB02', //gb
            'KMBAK01', //ph
            'KPBTH02', //ph
        );

        $list_conto = $CI->hasil_analisis_m->get_conto_by_no_analisis($id);

        $c = 1;
        // Analysis
        $this->SetFont('Arial','B',9,'C');
        $this->cell(4,1,'ANALYSIS',1,0,'C');
        $this->cell(1.3,1,'UNIT',1,0,'C');
        $this->cell(1.3,1,'BASIS',1,0,'C');
        foreach($list_conto as $conto):
            // tampilkan jika parameter ada satuan
            // dan parameter bukan bagian dari parameter tanpa satuan
            $this->cell(3,1, $kode_conto.' - '.str_pad($c++, 3, 0, STR_PAD_LEFT),1,0,'C');
        endforeach;

        $this->ln();
        // kolom conto
        $metoda_dipakai = array();


        // free moisture
        $this->SetFont('Arial','',9);
        $this->cell(4,1,'FREE MOISTURE',1,0);
        $this->cell(1.3,1,'%',1,0,'C');
        $this->cell(1.3,1,'ar',1,0,'C');
        foreach($list_conto as $conto):
            $this->cell(3,1,nilai($conto->id, 's', TRUE, '%'),1,0,'C');
        endforeach;
        $this->ln();

        // total moisture
        $this->SetFont('Arial','',9);
        $this->cell(4,1,'TOTAL MOISTURE',1,0);
        $this->cell(1.3,1,'%',1,0,'C');
        $this->cell(1.3,1,'ar',1,0,'C');
        foreach($list_conto as $conto):
            $this->cell(3,1,nilai($conto->id, 'v', TRUE, '%'),1,0,'C');
        endforeach;

        $this->ln();
        // type digunakan
        $type_analisis = $CI->hasil_analisis_m->pakai_type_analisis($id, FALSE, TRUE);
        foreach($type_analisis as $type):
            // nama type analisis
            $this->SetFont('Arial','B',9);
            // hilangkan kata analisis
            $this->cell(4,1,strtoupper(str_replace('Analisis', '', $type->type_analisis_nama)),1,0);
            $this->cell(1.3,1,'',1,0,'C');
            $this->cell(1.3,1,'',1,0,'C');
            foreach($list_conto as $conto):
                // kosongkan
                $this->cell(3,1,'',1,0,'C');
            endforeach;
            $this->ln();

            // list parameter by type
            $parameter = $CI->hasil_analisis_m->parameter_by_type($id, $type->id_type);
            foreach($parameter as $param):
                $this->SetFont('Arial','',9);
                $this->cell(4,1,strtoupper($param->nama),1,0);
                $this->cell(1.3,1,'%',1,0,'C');
                $this->cell(1.3,1,$param->basis,1,0,'C');
                foreach($list_conto as $conto):
                    $this->cell(3,1,nilai($conto->id, $param->id_parameter, TRUE, '%'),1,0,'C');
                endforeach;
                $this->ln();
            endforeach;
        endforeach;


        // catatan
        $this->SetFont('Arial','BU',8);
        $this->cell(4,0.5,"Catatan:",0,0);
        $this->SetFont('Arial','',8);
        $this->ln();
        $this->cell(4,0.3,"adb  = air dried basys                 ar   = air received",0,0);
        $this->ln();
        $this->cell(4,0.3,"daf   = dry ash free                      *    = belum terakreditasi",0,0);
        $this->ln();

    }

    function tabel_kimia($list_conto, $id, $nomor_analisis, $jumlah_conto, $jenis_conto, $lokasi, $id_pemohon, $kode_conto='KC')
    {
        $CI =& get_instance();
        $CI->load->model('hasil_analisis_m');
        $this->addpage();
        $this->SetFont('Arial','B',12);
        $this->Cell(0,0,'HASIL ANALISIS KIMIA',0,0,'C');
        $this->Ln(1);
        /*
         * Keterangan
         */
        $this->SetX(3);
        $this->SetFont('Arial','B',9);
        $this->Cell(6.1,0.5,'NOMOR ANALISIS');
        $this->Cell(2.6,0.5,': '.$nomor_analisis);
        $this->ln();
        $this->SetX(3);
        $this->Cell(6.1,0.5,'CONTO YANG DIANALISIS');
        $this->Cell(2.6,0.5,': '.$jumlah_conto.' Conto '.$jenis_conto);
        $this->ln();
        $this->SetX(3);
        $this->Cell(6.1,0.5,'LOKASI');
        $this->Cell(2.6,0.5,': '.$lokasi);
        $this->ln();
        $this->SetX(3);
        $this->Cell(6.1,0.5,'ANALISIS UNTUK');
        $this->Cell(2.6,0.5,': '.nama_pemohon($id_pemohon));
        $this->ln(1);
        /*
         * END KETERANGAN
         */

//        $this->cell(3.1,1,'KODE CONTO',1,0,'C');
        $i = 1;
//        foreach($list_conto as $data=>$val):
//            $this->cell(2.8,1,$kode_conto.' - '.str_pad($i++, 3, 0, STR_PAD_LEFT),1,0,'C');
//        endforeach;

        $parameter = $CI->hasil_analisis_m->pakai_satuan($id);
        $th = array('KODE CONTO');
        $wth = array(3.1);
        $ath = array('C');

        $parameter_nonsatuan = array(
            'KMKGB01', //ph
            'KMKGB02', //gb
            'KMBAK01', //ph
            'KPBTH02', //ph
        );

        // kolom parameter
        foreach($parameter as $param):
            $nama = $param->nama;

            // singkatan
            if($nama == 'Drilling Mud Test (Viskositas Relatif)' OR $nama == 'Drilling Mud Test (CEC, Ca &Mg)' OR $nama == 'Drilling Mud Test (Viskositas Absolut)' )
                $nama = 'DMT';
            elseif($nama == 'Methylene Blue Test' )
                $nama = 'MBT';

            // parameter dipakai
            // tampilkan jika parameter ada satuan dan parameter bukan bagian dari parameter tanpa satuan
            if(!empty($param->satuan) OR in_array(strtoupper($param->id_parameter), $parameter_nonsatuan))
            {
                if(empty($param->satuan))
                    $satuan = '';
                else
                    $satuan = "
                (".$param->satuan.")";

                $cek_sign_fix = iconv("UTF-8", "windows-1252", $nama);

                $satuan = iconv("UTF-8", "windows-1252", $satuan);
                $cek_sign_fix = $cek_sign_fix.$satuan;

                array_push($th, $cek_sign_fix);

                // width th
                array_push($wth, 1.5);
                array_push($ath, 'C');
            }
        endforeach;


        $this->SetWidths($wth);
        $this->SetAligns($ath);
        $this->Row($th);
        // end kolom parameter

        // kolom conto
        $metoda_dipakai = array();
        $list_conto = $CI->hasil_analisis_m->get_conto_by_no_analisis($id);
        foreach($list_conto as $conto):
            $this->cell(3.1,1, $kode_conto.' - '.str_pad($i++, 3, 0, STR_PAD_LEFT),1,0,'C');
            foreach($parameter as $param):
                // tampilkan jika parameter ada satuan
                // dan parameter bukan bagian dari parameter tanpa satuan
                if(!empty($param->satuan) OR in_array(strtoupper($param->id_parameter), $parameter_nonsatuan))
                {
                    $nilai = nilai($conto->id, $param->id_parameter, FALSE, $param->satuan);
                    $this->SetFont('Arial','',9);
                    $this->cell(1.5,1,$nilai[0],1,0,'C');
                    $this->SetFont('Arial','B',9);
                }
                // ambil 5 karakter dari id parameter karena merupakan id type analisis
                array_push($metoda_dipakai, substr($param->id_parameter,0,5));
            endforeach;
            $this->ln();
        endforeach;
        // end kolom conto

        // type analisis jika type = kml
        if(substr($id, 5, 3) == 'kml'):
            $metoda_dipakai_unique = array_unique($metoda_dipakai);
            foreach($metoda_dipakai_unique as $key => $metoda):
                $nama_metoda = $CI->type_analisis_m->get_nama($metoda);
                $this->SetFont('Arial','B',8);

                // width metoda
                $w_m = 3.5;
                // jika fmbse size = 5
                if($metoda == 'FMBSE')
                    $w_m = 6;

                $this->cell($w_m,0.5,$nama_metoda.":",0,0,'');
                $uji_parameter_by_metode = $CI->hasil_analisis_m->get_uji_param_by_type_analisis($metoda);
                $this->SetFont('Arial','',8);
                foreach($uji_parameter_by_metode as $uji_param):
                    $this->cell(0.8,0.5,implode(",", $uji_param),0,0);
                endforeach;
                $this->ln();
            endforeach;
        endif;

        // catatan
        $this->SetFont('Arial','BU',8);
        $this->cell(4,0.5,"Catatan:",0,0);
        $this->SetFont('Arial','',8);
        $this->ln();
        $this->cell(4,0.5,"1 %                         = 10.000 ppm",0,0);
        $this->ln();
        $this->cell(4,0.5,"1 ppm (gr/ton)         = 1000 ppb",0,0);

    }

    function tanda_tangan()
    {
        $x = 14;
        if($this->CurOrientation == 'L')
        {
            if(($this->getY()) > 14){
                $this->addpage();
                $this->Ln(3);
            }
            $x = 20;
        }

        $this->Ln();
        $this->Ln();

        if(($this->getY()) > 23){
            $this->addpage();
            $this->Ln(3);
        }


        $this->SetFont('Arial','',9);
        $this->SetX($x);
        $tugas = "KEPALA SUB BIDANG LABORATORIUM";
        $nama = "Moehamad Awaludin, ST.,MT";
        $nip = "197510112005021001";
        if(!empty($_GET['nip']) && !empty($_GET['atas_nama']))
        {
            $tugas = '';
            $nama = $_GET['atas_nama'];
            $nip = $_GET['nip'];
        }
        $this->Cell(0,0.75,$tugas,0,0,'L');
        $this->Ln();
        $this->Ln();
        $this->Ln();
        $this->SetX($x+0.7);
        $this->SetFont('Arial','BI',9);
        $this->Cell(0,0.75,$nama,0,0,'L');
        $this->Ln();
        $this->SetX($x+1);
        $this->SetFont('Arial','',9);
        $this->Cell(0,0.75,"NIP. ".$nip,0,0,'L');
    }

}