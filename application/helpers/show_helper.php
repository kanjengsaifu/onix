<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/18/13
 * Time: 6:50 PM
 */

function nama_kimia($str)
{
//    setlocale(LC_CTYPE, 'en_US');
//    $number = array('1','2','3','4','5','6','7','8','9');
//    $corr_number = array("<sub>1</sub>","&sup2;","&sup3;","<sub>4</sub>","<sub>5</sub>","<sub>6</sub>","<sub>7</sub>","<sub>8</sub>","<sub>9</sub>");
//    $cek_number = str_replace($number, $corr_number, $str);

    $number = array('1','2','3','4','5','6','7','8','9');
    $corr_number = array("<sub>1</sub>","<sub>2</sub>","<sub>3</sub>","<sub>4</sub>","<sub>5</sub>","<sub>6</sub>","<sub>7</sub>","<sub>8</sub>","<sub>9</sub>");
    $cek_number = str_replace($number, $corr_number, $str);

    $sign = array('+','-');
    $corr_sign = array("<sup>+</sup>","<sup>-</sup>");
    $cek_sign = str_replace($sign, $corr_sign, $cek_number);


    return $cek_sign;
}

function ada_foto($file)
{
    $CI =& get_instance();
    $CI->load->helper('file');

    $cek_foto = get_file_info('./assets/img/foto_conto/'.$file);

    if(!$cek_foto)
        return FALSE;
    else{
        if(empty($file))
            return FALSE;
        else
            return TRUE;
    }
}

function get_uji_param_deskripsi($id_param, $id_conto)
{
    $CI =& get_instance();
    $CI->load->model('hasil_analisis_m');
    $deskripsi = $CI->hasil_analisis_m->get_uji_param_deskripsi($id_param, $id_conto);


    return $deskripsi;
}

function no_conto($id_conto)
{
    $id_conto_1 = substr($id_conto, 0, 6);
    $id_conto_2 = substr($id_conto, 6, 5);

    $id_conto = strtoupper($id_conto_1).' - '.$id_conto_2;

    return $id_conto;
}

function no_analisis($no_analisis)
{
    $no_analisis = substr($no_analisis, 0, 2).' / '.substr($no_analisis, 2, 3).' / '.substr($no_analisis, 5, 3).' / '.substr($no_analisis, 8, 4);

    return strtoupper($no_analisis);
}

function status_label($status)
{
    $label = "<div class='label label-warning'>proses <i class='glyphicon glyphicon-refresh'></i></div>";
    if($status)
    {
        $label = "<div class='label label-success'>selesai <i class='glyphicon glyphicon-ok'></i></div>";
    }

    return $label;
}

function status_infobox($status)
{
    $infobox = "<div class='alert alert-warning'><div class='info-data'><span class='glyphicon glyphicon-refresh'></span> proses</div>status</div>";
    if($status == 1)
        $infobox = "<div class='alert alert-success'><div class='info-data'><span class='glyphicon glyphicon-ok'></span> selesai</div>status</div>";
    return $infobox;
}

function nama_pemohon($id_pemohon)
{
    $CI =& get_instance();
    $CI->load->model('pemohon_m');
    $CI->load->model('k_penelitian_m');
    $pemohon = $CI->pemohon_m->get_detail_pemohon($id_pemohon);
    $nama_pemohon = $pemohon->nama;


    return $nama_pemohon;
}

function nama_komoditi($id_komoditi)
{
    $id_komoditi = strtoupper($id_komoditi);
    switch ($id_komoditi)
    {
        case 'TU':
            return 'Tata Usaha';
            break;
        case 'BB':
            return 'Batubara';
            break;
        case 'LG':
            return 'Logam';
            break;
        case 'NL':
            return 'Non Logam';
            break;
        case 'PB':
            return 'Panas Bumi';
            break;
    };
}

function nama_login()
{
    $CI =& get_instance();
    $CI->load->model(array('k_penelitian_m','pemohon_m','petugas_m'));
    if($CI->session->userdata('user_type') == '1')
    {
        $id_pemohon = $CI->session->userdata('id_user');
        $nama = $CI->pemohon_m->get_nama_by_id($id_pemohon);
    }
    else
    {
        $id_pegawai = $CI->session->userdata('logged_user');
        $nama = $CI->petugas_m->get_nama_by_user($id_pegawai);
    }

    return $nama;
}

function cek_gambar($id_conto)
{
    $CI =& get_instance();
    $CI->load->library('../controllers/analisis');
    $ada_gambar = $CI->analisis->cek_gambar_conto($id_conto);

    return $ada_gambar;
}

function terbilang($angka) {
    // pastikan kita hanya berususan dengan tipe data numeric
    $angka = (float)$angka;

    // array bilangan
    // sepuluh dan sebelas merupakan special karena awalan 'se'
    $bilangan = array(
        '',
        'satu',
        'dua',
        'tiga',
        'empat',
        'lima',
        'enam',
        'tujuh',
        'delapan',
        'sembilan',
        'sepuluh',
        'sebelas'
    );

    // pencocokan dimulai dari satuan angka terkecil
    if ($angka < 12) {
        // mapping angka ke index array $bilangan
        return $bilangan[$angka];
    } else if ($angka < 20) {
        // bilangan 'belasan'
        // misal 18 maka 18 - 10 = 8
        return $bilangan[$angka - 10] . ' belas';
    } else if ($angka < 100) {
        // bilangan 'puluhan'
        // misal 27 maka 27 / 10 = 2.7 (integer => 2) 'dua'
        // untuk mendapatkan sisa bagi gunakan modulus
        // 27 mod 10 = 7 'tujuh'
        $hasil_bagi = (int)($angka / 10);
        $hasil_mod = $angka % 10;
        return trim(sprintf('%s puluh %s', $bilangan[$hasil_bagi], $bilangan[$hasil_mod]));
    } else if ($angka < 200) {
        // bilangan 'seratusan' (itulah indonesia knp tidak satu ratus saja? :))
        // misal 151 maka 151 = 100 = 51 (hasil berupa 'puluhan')
        // daripada menulis ulang rutin kode puluhan maka gunakan
        // saja fungsi rekursif dengan memanggil fungsi terbilang(51)
        return sprintf('seratus %s', terbilang($angka - 100));
    } else if ($angka < 1000) {
        // bilangan 'ratusan'
        // misal 467 maka 467 / 100 = 4,67 (integer => 4) 'empat'
        // sisanya 467 mod 100 = 67 (berupa puluhan jadi gunakan rekursif terbilang(67))
        $hasil_bagi = (int)($angka / 100);
        $hasil_mod = $angka % 100;
        return trim(sprintf('%s ratus %s', $bilangan[$hasil_bagi], terbilang($hasil_mod)));
    } else if ($angka < 2000) {
        // bilangan 'seribuan'
        // misal 1250 maka 1250 - 1000 = 250 (ratusan)
        // gunakan rekursif terbilang(250)
        return trim(sprintf('seribu %s', terbilang($angka - 1000)));
    } else if ($angka < 1000000) {
        // bilangan 'ribuan' (sampai ratusan ribu
        $hasil_bagi = (int)($angka / 1000); // karena hasilnya bisa ratusan jadi langsung digunakan rekursif
        $hasil_mod = $angka % 1000;
        return sprintf('%s ribu %s', terbilang($hasil_bagi), terbilang($hasil_mod));
    } else if ($angka < 1000000000) {
        // bilangan 'jutaan' (sampai ratusan juta)
        // 'satu puluh' => SALAH
        // 'satu ratus' => SALAH
        // 'satu juta' => BENAR
        // @#$%^ WT*

        // hasil bagi bisa satuan, belasan, ratusan jadi langsung kita gunakan rekursif
        $hasil_bagi = (int)($angka / 1000000);
        $hasil_mod = $angka % 1000000;
        return trim(sprintf('%s juta %s', terbilang($hasil_bagi), terbilang($hasil_mod)));
    } else if ($angka < 1000000000000) {
        // bilangan 'milyaran'
        $hasil_bagi = (int)($angka / 1000000000);
        // karena batas maksimum integer untuk 32bit sistem adalah 2147483647
        // maka kita gunakan fmod agar dapat menghandle angka yang lebih besar
        $hasil_mod = fmod($angka, 1000000000);
        return trim(sprintf('%s milyar %s', terbilang($hasil_bagi), terbilang($hasil_mod)));
    } else if ($angka < 1000000000000000) {
        // bilangan 'triliun'
        $hasil_bagi = $angka / 1000000000000;
        $hasil_mod = fmod($angka, 1000000000000);
        return trim(sprintf('%s triliun %s', terbilang($hasil_bagi), terbilang($hasil_mod)));
    } else {
        return 'Wow...';
    }
}

function WriteHTML($html)
{
    // HTML parser
    $html = str_replace("\n",' ',$html);
    $a = preg_split('/<(.*)>/U',$html,-1,PREG_SPLIT_DELIM_CAPTURE);
    foreach($a as $i=>$e)
    {
        if($i%2==0)
        {
            // Text
            if($this->HREF)
                $this->PutLink($this->HREF,$e);
            else
                $this->Write(5,$e);
        }
        else
        {
            // Tag
            if($e[0]=='/')
                $this->CloseTag(strtoupper(substr($e,1)));
            else
            {
                // Extract attributes
                $a2 = explode(' ',$e);
                $tag = strtoupper(array_shift($a2));
                $attr = array();
                foreach($a2 as $v)
                {
                    if(preg_match('/([^=]*)=["\']?([^"\']*)/',$v,$a3))
                        $attr[strtoupper($a3[1])] = $a3[2];
                }
                $this->OpenTag($tag,$attr);
            }
        }
    }
}