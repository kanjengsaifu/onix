<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/18/13
 * Time: 9:04 AM
 */
class Analisis_m extends CI_Model
{

    private $hasil_analisis;

    private function _no_urut_analisis($no_analisis)
    {
        return substr($no_analisis, 2, 3);
    }

    private function _id_komoditi_analisis($no_analisis)
    {
        return substr($no_analisis, 0, 2);
    }

    private function _id_lab_analisis($no_analisis)
    {
        return substr($no_analisis, 5, 3);
    }

    public function set_hasil_analisis($analisis)
    {
        $this->analisis = $analisis;
    }

    public function get_status($id_analisis)
    {
        $q = $this->db->query("SELECT is_selesai FROM analisis WHERE id_analisis='$id_analisis' LIMIT 1");

        $status = FALSE;
        if($q->num_rows > 0)
        {
            $result = $q->row();
            $status = $result->is_selesai;
        }

        return $status;
    }

    public function get_all()
    {
        $q = $this->db->query("SELECT id_analisis,laboratorium.nama,biaya FROM analisis, laboratorium WHERE analisis.id_lab = laboratorium.id_lab ORDER BY created_at DESC");

        return $q->result();
    }

    public function get_nomor_analisis($id_analisis)
    {
        $q = $this->db->query("SELECT nomor_analisis FROM analisis WHERE id_analisis='$id_analisis'");
        $r = $q->row();

        if($q->num_rows() == 0)
            $v = FALSE;
        else
            $v = $r->nomor_analisis;

        return $v;
    }

    public function get_detail_analisis($no_analisis)
    {
//        $q = $this->db->query("SELECT is_selesai, jenis_contoh, jumlah_contoh, lokasi, tanggal_terima, tanggal_daftar, id_lab, id_pemohon, provinsi.nama as nama_lokasi FROM analisis JOIN provinsi ON analisis.lokasi = provinsi.id_provinsi WHERE id_analisis='$no_analisis'");
        $q = $this->db->query("SELECT id_analisis, analisis.id as id, nomor_analisis, kode_conto, biaya, is_selesai, jenis_contoh, jumlah_contoh, lokasi, tanggal_terima, tanggal_daftar, id_lab, analisis.id_pemohon, kabupaten.nama as nama_lokasi, pemohon.nama_sertifikat as nama_pemohon, alamat, type_pemohon.id as id_type_pemohon, type_pemohon.nama as type_pemohon FROM analisis JOIN kabupaten ON analisis.lokasi = kabupaten.id_kabupaten JOIN pemohon ON pemohon.id_pemohon=analisis.id_pemohon JOIN type_pemohon ON pemohon.id_type_pemohon=type_pemohon.id WHERE id_analisis='$no_analisis'");
        return $q->row();
    }

    public function get_detail_conto($id)
    {
        $q = $this->db->query("SELECT * FROM conto WHERE id='$id'");
        return $q->row();
    }


    public function get_uji_param_deskripsi($id_param, $id_conto)
    {
        $q = $this->db->query("SELECT deskripsi FROM uji_parameter WHERE id_conto='$id_conto' AND id_parameter='$id_param' LIMIT 1");

        $status = FALSE;
        if($q->num_rows > 0)
        {
            $result = $q->row();
            $status = $result->deskripsi;
        }

        return $status;
    }

    public function get_conto_by_no_analisis($no_analisis)
    {
        $q = $this->db->query("SELECT * FROM conto WHERE id_analisis='$no_analisis'");

        $result = $q->result();

        return $result;
    }

    public function get_last_no_urut($id_komoditi)
    {
        $q = $this->db->query("SELECT id_analisis FROM analisis WHERE SUBSTRING(id_analisis,1,2)='$id_komoditi' ORDER BY id_analisis DESC LIMIT 1");

        if($q->num_rows > 0)
        {
            $analisis = $q->row();
            $id_analisis = $analisis->id_analisis;
            $no_urut = substr($id_analisis, 2, 3)+1;
        }
        else
            $no_urut = 001;

        return str_pad($no_urut, 3, '0', STR_PAD_LEFT);
    }

    public function get_harga($id_analisis)
    {
        $harga = 0;
        $harga_type = 0;
        $harga_param = 0;

        $this->load->model(array('type_analisis_m', 'parameter_m'));

        $jumlah_conto = $this->get_jumlah_conto($id_analisis);

        $pakai_type = $this->pakai_type_analisis($id_analisis);
        // khusus kimia
        $parameter_dipakai = $this->pakai_parameter($id_analisis);


        if($parameter_dipakai != FALSE):
            foreach($parameter_dipakai as $param)
            {
                $detail_param = $this->parameter_m->detail_parameter($param->id_parameter);
                $harga_param = $harga_param + $detail_param->harga;
            }
        endif;


        foreach($pakai_type as $type)
        {
            $detail_type = $this->type_analisis_m->detail_type_analisis($type->id_type);
            $harga_type = $harga_type + $detail_type->harga;
        }


        $is_fisika = substr($id_analisis, 5, 1) == 'f' ? TRUE : FALSE;
        if($is_fisika)
            $harga = $harga_type * $jumlah_conto;
        else
            $harga = $harga_param * $jumlah_conto;

        return $harga;
    }

    public function cek_uji_param($id_conto, $id_parameter)
    {
        $q = $this->db->query("SELECT id_parameter FROM uji_parameter WHERE id_conto=? AND id_parameter=?", array($id_conto, $id_parameter));
        $result = $q->row();

        if($result != FALSE)
            return TRUE;
        else
            return FALSE;
    }

    public function get_jumlah_conto($no_analisis)
    {
        $q = $this->db->query("SELECT jumlah_contoh FROM analisis WHERE id_analisis='$no_analisis'");

        $result = $q->row();
        $jumlah_contoh = $result->jumlah_contoh;
        return $jumlah_contoh;
    }

    public function get_nilai($id_conto, $id_parameter, $satuan=null)
    {
        if($satuan == NULL)
            $q = $this->db->query("SELECT nilai FROM uji_parameter WHERE id_conto='$id_conto' AND id_parameter='$id_parameter' AND satuan IS NULL");
        else
            $q = $this->db->query("SELECT nilai,satuan FROM uji_parameter WHERE id_conto='$id_conto' AND id_parameter='$id_parameter' AND satuan='$satuan'");

        $result = $q->row();

        if($result != FALSE)
            $nilai = $result;
        else
            $nilai = FALSE;


        return $nilai;
    }

    public function cek_ada_uji($id_conto, $id_parameter)
    {
        $q = $this->db->query("SELECT id_parameter FROM uji_parameter WHERE id_conto='$id_conto' AND id_parameter='$id_parameter'");
        $result = $q->num_rows();

        if($result > 0)
            return TRUE;
        else
            return FALSE;
    }

    public function pakai_type_analisis($no_analisis, $from_uji=FALSE, $from_id_lab = FALSE)
    {
        if($from_uji == TRUE)
            $q = $this->db->query("SELECT SUBSTR(id_parameter,1,5) as id_type FROM uji_parameter,conto WHERE conto.id_analisis='$no_analisis' AND uji_parameter.id_conto=conto.id LIMIT 1");
        elseif($from_id_lab == TRUE)
            $q = $this->db->query("SELECT DISTINCT SUBSTR(id_parameter,1,5) as id_type, type_analisis.nama as type_analisis_nama FROM uji_parameter,conto,type_analisis WHERE type_analisis.id_type=SUBSTRING(uji_parameter.id_parameter,1,5) AND conto.id_analisis='$no_analisis' AND uji_parameter.id_conto=conto.id");
        else
            $q = $this->db->query("SELECT analisis_type_analisis.id_type, type_analisis.nama FROM analisis_type_analisis, type_analisis WHERE id_analisis='$no_analisis' AND analisis_type_analisis.id_type=type_analisis.id_type");

        $result = $q->result();
        return $result;
    }

    public function get_uji_param_by_type_analisis($type_analisis)
    {
        $q = $this->db->query("SELECT DISTINCT parameter.nama FROM uji_parameter JOIN parameter ON parameter.id_parameter=uji_parameter.id_parameter WHERE parameter.id_type='$type_analisis'");
        $r = $q->result_array();

        return $r;
    }

    public function get_detail_conto_fisika($id_conto, $id_type_analisis = FALSE)
    {
        if($id_type_analisis == FALSE)
            $q = $this->db->query("SELECT detail_conto_fisika.*, type_analisis.nama as type_analisis, type_analisis.id_type as is_type_analisis FROM detail_conto_fisika JOIN type_analisis ON type_analisis.id_type=detail_conto_fisika.id_type_analisis WHERE id_conto='$id_conto'");
        else
            $q = $this->db->query("SELECT detail_conto_fisika.*, type_analisis.nama as type_analisis, type_analisis.id_type as is_type_analisis FROM detail_conto_fisika JOIN type_analisis ON type_analisis.id_type=detail_conto_fisika.id_type_analisis WHERE id_conto='$id_conto' AND detail_conto_fisika.id_type_analisis='$id_type_analisis'");

        return $q->result();
    }

    public function get_row_detail_conto_fisika($id_detail_conto, $id_type_analisis=FALSE)
    {
        if($id_type_analisis == FALSE)
            $q = $this->db->query("SELECT detail_conto_fisika.*, type_analisis.nama as type_analisis, type_analisis.id_type as is_type_analisis FROM detail_conto_fisika JOIN type_analisis ON type_analisis.id_type=detail_conto_fisika.id_type_analisis WHERE id='$id_detail_conto'");
        else
            $q = $this->db->query("SELECT detail_conto_fisika.*, type_analisis.nama as type_analisis, type_analisis.id_type as is_type_analisis FROM detail_conto_fisika JOIN type_analisis ON type_analisis.id_type=detail_conto_fisika.id_type_analisis WHERE id='$id_detail_conto' AND detail_conto_fisika.id_type_analisis='$id_type_analisis'");
        return $q->row();
    }

    public function pakai_parameter($id_analisis)
    {
        $q = $this->db->query("SELECT id FROM conto WHERE id_analisis='$id_analisis' LIMIT 1");

        if($q->num_rows() != 0)
        {
            $result_conto = $q->row();
            $id_conto = $result_conto->id;

            $parameter = $this->get_param_by_id_conto($id_conto);
        }
        else
            $parameter = FALSE;

        return $parameter;
    }


    public function pakai_parameter_satuan($id_analisis, $satuan = null)
    {
        $q = $this->db->query("SELECT id_conto FROM conto WHERE id_analisis='$id_analisis' LIMIT 1");

        if($q->num_rows != 0)
        {
            $result_conto = $q->row();
            $id_conto = $result_conto->id_conto;

            $parameter = $this->get_param_by_id_conto($id_conto);
        }
        else
            $parameter = FALSE;

        return $parameter;
    }

    public function pakai_satuan($id_analisis)
    {
        // pilih semua conto sesuai dengan id_analisis
        $q = $this->db->query("SELECT DISTINCT uji_parameter.satuan, uji_parameter.id_parameter, parameter.nama FROM conto JOIN uji_parameter ON conto.id=uji_parameter.id_conto JOIN parameter ON uji_parameter.id_parameter=parameter.id_parameter WHERE id_analisis='$id_analisis' ORDER BY parameter.nama, satuan");
        $r = $q->result();

        return $r;
    }

    public function pakai_basis($id_analisis)
    {
        // pilih semua conto sesuai dengan id_analisis
        $q = $this->db->query("SELECT uji_parameter.id_parameter, parameter.nama, uji_parameter.id_metoda as basis FROM conto JOIN uji_parameter ON conto.id=uji_parameter.id_conto JOIN parameter ON uji_parameter.id_parameter=parameter.id_parameter WHERE id_analisis='$id_analisis' ORDER BY parameter.nama, uji_parameter.satuan");
        $r = $q->result();

        return $r;
    }

    public function parameter_by_type($id_analisis, $id_type)
    {
        // pilih semua conto sesuai dengan id_analisis
        $q = $this->db->query("SELECT uji_parameter.id_parameter, parameter.nama, uji_parameter.id_metoda as basis FROM conto JOIN uji_parameter ON conto.id=uji_parameter.id_conto JOIN parameter ON uji_parameter.id_parameter=parameter.id_parameter WHERE id_analisis='$id_analisis' AND SUBSTRING(uji_parameter.id_parameter, 1,5)='$id_type' ORDER BY parameter.nama, uji_parameter.satuan");
        $r = $q->result();

        return $r;
    }

    /*
     * Untuk mengammbil jumlah contoh pada setiap tahun
     * misal tahun 2014 ada 400 contoh jadi contoh baru yang akan di return
     * dan per lab
     * adalah 401
     */
    public function get_last_no_conto($id_lab)
    {
        $tahun = date('Y');

        // ambil jumlah contoh per tahun yang diinputkan
        $q = $this->db->query("SELECT SUM(jumlah_contoh) as jumlah FROM analisis WHERE YEAR(tanggal_daftar)='$tahun' AND id_lab='$id_lab'");
        $r = $q->result();
        $jumlah_conto = $r[0]->jumlah;

        if($jumlah_conto == 0)
            $jumlah_conto = 1;
        else
            $jumlah_conto = $jumlah_conto+1;

        return str_pad((string)$jumlah_conto, 5, 0, STR_PAD_LEFT);
    }

    public function get_no_analisis_baru($type_pemohon = 00, $id_lab)
    {
        $tahun = date('Y');

        $jumlah_conto = $this->get_last_no_conto($id_lab);

        return $tahun.str_pad($type_pemohon,2,0,STR_PAD_LEFT).$jumlah_conto;
    }

    /*
     * Jika jumlah conto teranalisis lebih besar atau sama dengan jumlah conto pada field analisis akan return TRUE
     * jadi tidak bisa masuk
     */
    public function cek_jumlah_conto($no_analisis)
    {
        $jumlah_conto = $this->get_jumlah_conto($no_analisis);

        $q_p_jumlah = $this->db->query("SELECT id_conto FROM conto WHERE id_analisis='$no_analisis'");

        if($q_p_jumlah->num_rows() >= $jumlah_conto)
            return TRUE;
        else
            return FALSE;
    }

    /*
     * Cek Selesai Analisis
     */

    public function cek_selesai($no_analisis)
    {
        if($this->cek_jumlah_conto($no_analisis) == TRUE)
        {
            $conto = $this->get_proses_by_id_analisis($no_analisis);

            foreach($conto as $data)
            {
                if($data->is_selesai == 0)
                    return FALSE;
            }

            return TRUE;
        }
        else
            return FALSE;
    }

    public function tambah_conto($id_analisis)
    {
        $q_proses = $this->db->query("SELECT id FROM conto WHERE id_analisis='$id_analisis' LIMIT 1");
        $result_conto = $q_proses->row();

        $id = $result_conto->id;

        $param = $this->get_param_by_id_conto($id, FALSE, TRUE);

        $data_param = array();
        foreach($param as $val)
        {
            array_push($data_param, array($val->id_parameter, $val->id_metoda));
        }

        $simpan = $this->simpan_proses_analisis($id_analisis, $data_param);
        if($simpan == TRUE)
            return TRUE;
        else
            return FALSE;
    }

    public function tambah_conto_fisika($id_analisis)
    {
        $nama_batuan = $this->input->post('nama_batuan');
        $berat = $this->input->post('berat');

        $no_urut_conto = $this->get_new_proses_analisis($id_analisis);
        $nomor_analisis = $this->get_nomor_analisis($id_analisis);


        $id_conto = substr($nomor_analisis, 0, 6).str_pad($no_urut_conto,5,'0',STR_PAD_LEFT);

        $data = array(
            $id_conto,
            $id_analisis,
            $nama_batuan,
            $berat
        );

        $q = $this->db->query("INSERT INTO conto VALUES(null, ?,?,null,?,?,0,null)", $data);
        $id = $this->db->insert_id();

        // tambah detail conto fisika
        $type_analisis = $this->pakai_type_analisis($id_analisis);

        foreach($type_analisis as $row):
            $id_type_analisis = $row->id_type;
            $this->db->query("INSERT INTO detail_conto_fisika(id_conto, id_type_analisis) VALUES('$id','$id_type_analisis')");
        endforeach;

        if($q)
            return TRUE;
        else
            return FALSE;
    }

    public function simpan_permohonan()
    {
        $id_lab = $this->input->post('id_lab');
        $id_komoditi = $this->input->post('id_komoditi');
        $no_urut = $this->get_last_no_urut($id_komoditi);
        $ttahun = date('my');
        $id_pemohon = $this->input->post('id_pemohon');
        $jenis_contoh = $this->input->post('contoh');
        $jumlah = $this->input->post('jumlah');
        $lokasi = $this->input->post('lokasi');
        $kode_conto = $this->input->post('kode_conto');
        $id_pegawai = $this->session->userdata('id_pegawai');
        $biaya = substr($id_pemohon, 0, 1) == 'k' ? 0 : $this->input->post('biaya');
        $preparasi = $this->input->post('preparasi') == FALSE ? FALSE : TRUE;
        $tanggal_terima = $this->input->post('tanggal_terima');
        $tanggal_daftar = date('Y-m-d');

        // ambil type_pemohon dari dari id_pemohon
        $type_pemohon = $this->pemohon_m->get_type_by_id_pemohon($id_pemohon);

        $tahun = date('Y');

        $id_analisis = $id_komoditi.$no_urut.$id_lab.$ttahun;

        // 0000*tahun 00*type_pemohon 00000*no_urut_conto
        $nomor_analisis = $this->get_no_analisis_baru($type_pemohon, $id_lab);

        $data = array(
            $id_analisis, $nomor_analisis, $jenis_contoh, $jumlah, $kode_conto, $lokasi, $tanggal_terima, $tanggal_daftar, $id_pegawai, $id_lab, $biaya, $id_pemohon, $preparasi
        );

        $q_simpan_hasil = $this->db->query("INSERT INTO analisis VALUES(null, ?,?,?,?,?,?,STR_TO_DATE(?, '%d-%m-%Y'),?,?,?,?,?,?,0,null)", $data);

        $parameter = $this->input->post('param');
        $metoda = $this->input->post('metoda');

        $metoda_terpilih = '';
        $param_temp = array();
        $param = array();

        // jika kbb karena ada fungsi memasukan basis
        if(strtoupper($id_lab) == 'KBB')
        {
            foreach($parameter as $row_param)
            {
                $metoda_terpilih = '';
                // jika basis parameter terpilih tidak kosong
                if(!empty($_POST['basis_'.$row_param]))
                {
                    // basis jika di kbb
                    $metoda_terpilih = $_POST['basis_'.$row_param];
                }
                $param_temp = array($row_param, $metoda_terpilih);
                array_push($param, $param_temp);
            }
        }
        else
        {
            foreach($parameter as $row_param)
            {
                foreach($metoda as $row_metoda)
                {
                    $metoda_temp = explode('-', $row_metoda);
                    if($metoda_temp[0] == $row_param)
                        $metoda_terpilih = $metoda_temp[1];
                }
                $param_temp = array($row_param, $metoda_terpilih);
                array_push($param, $param_temp);
            }
        }

        if($q_simpan_hasil)
        {
            if($id_lab == 'fmb' OR $id_lab == 'fbb')
                $this->simpan_fisika($id_analisis, $parameter);
            else
                $this->simpan_kimia($id_analisis, $param);

            return TRUE;
        }
        else
            return FALSE;
    }

    /*
     * Simpan analisis Fisika
     * simpan type analisis
     */

    public function simpan_fisika($no_analisis, $type_analisis)
    {
        foreach($type_analisis as $type):
            $q_simpan_proses = $this->simpan_type_analisis($no_analisis, $type);
            if($q_simpan_proses == FALSE)
                return FALSE;
        endforeach;

        return TRUE;
    }

    public function simpan_type_analisis($no_analisis, $type_analisis)
    {
        $data = array(
            $no_analisis,
            $type_analisis
        );
        $q = $this->db->query("INSERT INTO pakai_type_analisis VALUES(?,?)",$data);

        if($q)
            return TRUE;
        else
            return FALSE;

    }

    public function simpan_proses_analisis($id_analisis, $parameter, $nama_batuan=null, $berat=0, $deskripsi=null)
    {

        $no_urut_conto = $this->get_new_proses_analisis($id_analisis);
        $nomor_analisis = $this->get_nomor_analisis($id_analisis);

        $id_conto = substr($nomor_analisis, 0, 6).str_pad($no_urut_conto,5,'0',STR_PAD_LEFT);
        $data = array(
            $id_conto,
            $id_analisis,
            $nama_batuan,
            $berat,
            $deskripsi
        );

        $q_simpan = $this->db->query("INSERT INTO conto VALUES(null, ?,?,null,?,?,0,?)", $data);

        $id = $this->db->insert_id();
        if($q_simpan)
        {
            foreach($parameter as $row):
                $this->simpan_uji_parameter($id, $row);
            endforeach;

            return TRUE;
        }
        else
            return FALSE;
    }

    /**
     * @param $id_conto
     * @param $parameter
     * @param int $nilai
     * @param null $satuan
     * @param null $deskripsi
     * @return bool
     */

    public function simpan_uji_parameter($id_conto, $parameter, $nilai=0, $satuan=null, $deskripsi=null)
    {
        $data = array($id_conto, $parameter[0], $nilai, $satuan, $parameter[1], $deskripsi);
        $simpan = $this->db->query('INSERT INTO uji_parameter VALUES(null,?,?,?,?,?,?)', $data);
        if($simpan)
            return TRUE;
        else
            return FALSE;
    }

    public function hapus_uji_param($id_proses_analisis, $id_parameter)
    {
        $data = array($id_proses_analisis, $id_parameter);
        $hapus = $this->db->query('DELETE FROM uji_parameter WHERE id_conto=? AND id_parameter=?', $data);
        if($hapus)
            return TRUE;
        else
            return FALSE;
    }

    public function get_new_proses_analisis($id_analisis)
    {
        $q = $this->db->query("SELECT id_conto FROM conto WHERE id_analisis='$id_analisis' ORDER BY id_conto DESC LIMIT 1");
        if($q->num_rows() != 0)
        {
            $r1 = $q->row();
            $nomor = substr($r1->id_conto,6,5);
            $nomor = $nomor + 1;
        }
        else
        {
            // ambil nomor analisis
            $nomor = $this->get_nomor_analisis($id_analisis);
            $nomor = substr($nomor,6,5);
//            // cek apakah terdapat id_conto yang sama dengan hasil analisis.nomor_analisis ?
//            $q2 = $this->db->query("SELECT id_conto FROM conto WHERE id_conto='$nomor_analisis' LIMIT 1");
//            // jika ada
//            if($q2->num_rows() != 0)
//            {
//                $r2 = $q2->row();
//                $nomor = substr($r2->id_conto,6,5);
//            }
//            // jika tidak ada kembalikan nilai 00000
//            else
//                $nomor = 00000;
        }

        return $nomor;
    }

    public function get_metode_dipakai($id)
    {
//        $q = $this->db->query("SELECT id_metoda")
    }

    public function get_param_by_id_conto($id_conto, $type_analisis=FALSE, $param_only=FALSE)
    {
        $kimia = array(
            'KNLFS',
            'KNLKM',
            'KPBAK',
            'KPBGS',
            'KPBIA',
            'KPBTH',
            'KPBUT'
        );

        if($type_analisis != FALSE)
        {
            // semua kimia dan panas bumi
            if(in_array(strtoupper($type_analisis), $kimia))
                $q = $this->db->query("SELECT parameter.id_parameter, parameter.nama, conto_parameter.satuan, nilai, conto_parameter.deskripsi, conto_parameter.id_metoda ,metoda.nama as metoda FROM conto_parameter, parameter, metoda WHERE conto_parameter.id_parameter=parameter.id_parameter AND metoda.id_metoda=conto_parameter.id_metoda AND id_conto=? AND id_type=?", array($id_conto, $type_analisis));
            else
                $q = $this->db->query("SELECT parameter.id_parameter, parameter.nama, conto_parameter.satuan, nilai, conto_parameter.deskripsi FROM conto_parameter, parameter WHERE conto_parameter.id_parameter=parameter.id_parameter AND id_conto=? AND id_type=?", array($id_conto, $type_analisis));
        }
        else
        {
            if($param_only == FALSE){
                // semua kimia dan panas bumi
                if(in_array(strtoupper($type_analisis), $kimia))
                {
                    $q = $this->db->query("SELECT parameter.id_parameter, parameter.nama, conto_parameter.satuan, nilai, conto_parameter.deskripsi,  conto_parameter.id_metoda , metoda.nama as metoda FROM conto_parameter, parameter, metoda WHERE conto_parameter.id_parameter=parameter.id_parameter AND metoda.id_metoda=conto_parameter.id_metoda AND id_conto=?", array($id_conto));
                }
                else
                {
                    $q = $this->db->query("SELECT parameter.id_parameter, parameter.nama, conto_parameter.satuan, nilai, conto_parameter.deskripsi FROM conto_parameter, parameter WHERE conto_parameter.id_parameter=parameter.id_parameter AND id_conto=?", array($id_conto));
                }
            }else{
                $q = $this->db->query("SELECT DISTINCT id_parameter, id_metoda FROM conto_parameter WHERE id_conto = '$id_conto'");
            }
        }

        return $q->result();
    }

    // mengambil detail uji parameter
    public function get_detail_uji_parameter_by_conto($id_conto)
    {
        $q = $this->db->query("SELECT * FROM uji_parameter WHERE id_conto='$id_conto'");

        return $q->result();
    }

    public function simpan_kimia($nomor_analisis, $parameter)
    {
        $simpan_proses = $this->simpan_proses_analisis($nomor_analisis, $parameter);
        if($simpan_proses == TRUE)
            return TRUE;
        else
            return FALSE;
    }

    public function get_proses_by_id_analisis($id_analisis)
    {
        $q = $this->db->query("SELECT conto.* FROM conto WHERE id_analisis='$id_analisis'");

        return $q->result();
    }

    /*
     * Simpan Nilai Lab
     */

    public function simpan_nilai()
    {
        $id_conto = $this->input->post('id');
        $id_param = $this->input->post('param');
        $nilai = $this->input->post('nilai');
        $satuan = $this->input->post('satuan');

        $satuan = !empty($satuan) ? $satuan : null;

        $cek_ada_uji = $this->cek_ada_uji($id_conto, $id_param);
        $data = array(
            $nilai,
            $satuan,
            $id_param,
            $id_conto
        );


        if($cek_ada_uji == TRUE)
            $q = $this->db->query('UPDATE uji_parameter SET nilai=?, satuan=? WHERE id_parameter=? AND id_conto=?', $data);
        else
            $q = $this->simpan_uji_parameter($id_conto, $id_param, $nilai);

        if($q)
            return TRUE;
        else
            return FALSE;
    }

    public function simpan_nilai_fisika()
    {
        $id_detail = $this->input->post('id_detail');
        $id_type_analisis = strtoupper($this->input->post('id_type_analisis'));
        $nilai = $this->input->post('nilai');

        $nilai_format = array();

        // Jika berat jenis dan derajat kemagnetan
        if($id_type_analisis == 'FMBBJ' OR $id_type_analisis == 'FMBDK'):
            $nilai_format = array($nilai[0]);
        // jika analisis retort
        elseif($id_type_analisis == 'FMBRT'):
            $nilai_format = array(
                'k_air'     => $nilai[0],
                'k_minyak'  => $nilai[1],
                'sg_batuan'  => $nilai[2],
                'sg_minyak'  => $nilai[3],
            );
        // jika kuat tekan dan berat jenis
        elseif($id_type_analisis == 'FMBUF'):
            $nilai_format = array(
                $nilai[0],
                $nilai[1]
            );
        // jika kuat XRD bulk
        elseif($id_type_analisis == 'FMBXR'):
            $nilai_format = array(
                $nilai
            );
        // jika kuat XRD bulk
        elseif($id_type_analisis == 'FMBSR'):
            $nilai_format = array(
                array(
                    $nilai[0],
                    $nilai[1],
                    $nilai[2]
                ),
                $nilai[3],
                $nilai[4],
                $nilai[5],
                $nilai[6]
            );
        // jika maseral
        elseif($id_type_analisis == 'FMBMR'):
            $nilai_format = array(
                    $nilai[0],
                    $nilai[1],
                    $nilai[2],
                    $nilai[3],
                    $nilai[4],
                    $nilai[5],
                    $nilai[6],
                    $nilai[7],
                    $nilai[8],
                    $nilai[9],
                    $nilai[10]
            );
        // jika MRA
        elseif($id_type_analisis == 'FMBMR'):
            $nilai_format = array(
                $nilai[0],
                $nilai[1],
                $nilai[2],
                $nilai[3],
                $nilai[4],
                $nilai[5]
            );
        // jika MRA
        elseif($id_type_analisis == 'FMBSE'):
            $nilai_format = array(
                $nilai[0],
                $nilai[1],
                $nilai[2],
                $nilai[3],
                $nilai[4],
                $nilai[5]
            );
        endif;

        $data = array(
            json_encode($nilai_format),
            $id_detail
        );

        $q = $this->db->query("UPDATE detail_conto_fisika SET nilai=? WHERE id=?", $data);

        if(!$q)
            return FALSE;
        else
            return TRUE;
    }

    public function simpan_catatan()
    {
        $id_proses_analisis = $this->input->post('id');
        $id_param = $this->input->post('param');
        $nilai = $this->input->post('catatan');


        $data = array(
            $nilai,
            $id_param,
            $id_proses_analisis
        );

        $q = $this->db->query('UPDATE uji_parameter SET deskripsi=? WHERE id_parameter=? AND id_conto=?', $data);

        if($q)
            return TRUE;
        else
            return FALSE;
    }

    public function simpan_deskripsi_conto()
    {
        $id_conto = $this->input->post('id_conto');
        $deskripsi = $this->input->post('deskripsi');


        $data = array(
            $deskripsi,
            $id_conto
        );

        $q = $this->db->query('UPDATE conto SET deskripsi=? WHERE id=?', $data);

        if($q)
            return TRUE;
        else
            return FALSE;
    }

    public function simpan_nama_batuan()
    {
        $id_conto = $this->input->post('id');
        $nama = $this->input->post('nama');


        $data = array(
            $nama,
            $id_conto
        );

        $q = $this->db->query('UPDATE conto SET nama_batuan=? WHERE id_conto=?', $data);

        if($q)
            return TRUE;
        else
            return FALSE;
    }

    public function simpan_berat()
    {
        $id_conto = $this->input->post('id');
        $berat = $this->input->post('berat');


        $data = array(
            $berat,
            $id_conto
        );

        $q = $this->db->query('UPDATE conto SET berat=? WHERE id_conto=?', $data);

        if($q)
            return TRUE;
        else
            return FALSE;
    }

    public function simpan_fotomikrograf($id_detail_conto_fisika, $filename, $no_foto=1)
    {
        $no_foto = $no_foto == 2 ? 'foto_2' : 'foto_1';
        $data = array(
            $filename,
            $id_detail_conto_fisika
        );

        $q = $this->db->query("UPDATE detail_conto_fisika SET $no_foto=? WHERE id=?", $data);

        return mysql_error();
    }


    public function simpan_deskripsi_fotomikrograf()
    {
        $id_conto = $this->input->post('id_proses');
        $ftm = $this->input->post('fotomikrograf');
        $no_deskripsi = $this->input->post('no_deskripsi');

        $no_deskripsi = $no_deskripsi == 2 ? 'deskripsi_2' : 'deskripsi_1';

        $data = array(
            $ftm,
            $id_conto
        );

        $q = $this->db->query("UPDATE detail_conto_fisika SET $no_deskripsi=? WHERE id=?", $data);

        if($q)
            return TRUE;
        else
            return FALSE;
    }

    public function simpan_mikroskopis()
    {
        $id_conto = $this->input->post('id_proses');
        $deskripsi = $this->input->post('deskripsi');


        $data = array(
            $deskripsi,
            $id_conto
        );

        $q = $this->db->query("UPDATE detail_conto_fisika SET d_mikroskopis=? WHERE id=?", $data);

        if($q)
            return TRUE;
        else
            return FALSE;
    }

    public function simpan_komposisi()
    {
        $id_conto = $this->input->post('id_proses');
        $komposisi = $this->input->post('komposisi');


        $data = array(
            $komposisi,
            $id_conto
        );

        $q = $this->db->query("UPDATE detail_conto_fisika SET komposisi=? WHERE id=?", $data);

        if($q)
            return TRUE;
        else
            return FALSE;
    }

    public function selesai_analisis($id_analisis, $reproses=FALSE)
    {
        if($reproses == TRUE)
            $data = 0;
        else
            $data = 1;

        $q = $this->db->query("UPDATE analisis SET is_selesai='$data' WHERE id_analisis='$id_analisis'");
        if($q)
            return TRUE;
        else
            return FALSE;
    }

    public function selesai_analisis_conto($id, $reproses=FALSE)
    {
        if($reproses == TRUE)
            $data = 0;
        else
            $data = 1;

        $q = $this->db->query("UPDATE conto SET is_selesai='$data' WHERE id='$id'");

        if($q)
            return TRUE;
        else
            return FALSE;
    }

    public function get_komentar_sra($id_analisis)
    {
        $q = $this->db->query("SELECT id, deskripsi FROM conto WHERE id_analisis='$id_analisis' ORDER BY id ASC LIMIT 1");

        $r = $q->row();

        return $r;

    }

    /*
     * End Simpan Nilai Lab
     */

    /**
     * @return mixed
     */
    public function all()
    {
        return $this->db->join('pemohon', 'analisis.id_pemohon = pemohon.id_pemohon')
            ->join('laboratorium', 'analisis.id_lab = laboratorium.id_lab')
            ->select('analisis.*, pemohon.nama as nama_pemohon, laboratorium.nama as lab')
            ->order_by('created_date', 'DESC')
            ->get('analisis')
            ->result();
    }

    /**
     * @param $id_lab
     * @return mixed
     */
    public function by_laboratorium($id_lab)
    {
        return $this->db->where('id_lab', $id_lab)->order_by('created_date', 'DESC')->get('analisis')->result();
    }

    /**
     * @param $id_lab
     * @return bool
     */
    private function is_fisika($id_lab)
    {
        return substr($id_lab, 0, 1) == 'f' ? TRUE : FALSE;
    }

    /**
     * @param $id_pemohon
     * @return mixed
     */
    public function by_id_pemohon($id_pemohon)
    {
        return $this->db->where('id_pemohon', $id_pemohon)->order_by('tanggal_daftar', 'DESC')->get('analisis')->result();
    }

    /**
     * @param $id_type_pemohon
     * @return string
     */
    private function _last_sequence_nomor_analisis_by_type_pemohon($id_type_pemohon)
    {
        $result = $this->db->where( 'SUBSTRING(nomor_analisis, 1, 6) = ' . date('Y') . $id_type_pemohon )->limit(1)->order_by('nomor_analisis', 'DESC')->get('analisis')->row();

        $sequence = 1;

        if($result)
        {
            $sequence = substr($result->nomor_analisis, 6, 5);
            $sequence += $result->jumlah_conto;
        }

        return str_pad((string) $sequence, 5, 0, STR_PAD_LEFT);
    }

    /**
     * @param $type_pemohon
     * @return string
     */
    public function new_nomor_analisis_by_type_pemohon($type_pemohon)
    {
        $last_sequence_nomor_conto = $this->_last_sequence_nomor_analisis_by_type_pemohon($type_pemohon);

        return date('Y') . $type_pemohon . str_pad((string) $last_sequence_nomor_conto, 5, 0, STR_PAD_LEFT);
    }

    /**
     * @param $id
     * @return mixed
     */
    public function find($id)
    {
        return $this->db->where('id', $id)
                        ->limit(1)
                        ->get('analisis')
                        ->row();
    }

    /**
     * @param $input
     * @return bool
     */
    public function insert($input)
    {
        $data = array(
            'nomor_analisis'        => $input['nomor_analisis'],
            'jenis_conto'           => $input['jenis_conto'],
            'jumlah_conto'          => $input['jumlah_conto'],
            'kode_conto'            => $input['kode_conto'],
            'lokasi'                => $input['lokasi'],
            'tanggal_terima'        => $input['tanggal_terima'],
            'tanggal_daftar'        => now(),
            'id_petugas'            => $this->session->userdata('logged_id'),
            'id_lab'                => $input['id_lab'],
            'biaya'                 => $input['biaya'],
            'id_pemohon'            => $input['id_pemohon'],
            'preparasi'             => $input['preparasi'],
            'created_date'          => now()
        );

        $insert = $this->db->insert('analisis', $data);

        $id_analisis = $insert ? $this->db->insert_id() : FALSE;

        return $id_analisis;
    }

    /**
     * @param $input
     * @return mixed
     */
    public function insert_parameter($input)
    {
        $data = array(
            'id_analisis'       => $input['id_analisis'],
            'id_parameter'      => $input['id_parameter'],
            'basis'             => $input['basis'],
            'id_metoda'         => $input['id_metoda'],
            'harga'             => $input['harga']
        );

        return $this->db->insert('analisis_parameter', $data);
    }

    /**
     * @param $input
     * @return mixed
     */
    public function insert_type_analisis($input)
    {
        $data = array(
            'id_analisis'                => $input['id_analisis'],
            'id_type_analisis'           => $input['id_parameter'],
            'harga'                      => $input['harga']
        );

        return $this->db->insert('analisis_type_analisis', $data);
    }

    /**
     * @param $input
     * @return CI_DB_active_record
     */
    public function update($input)
    {
        $data = array(
            'lokasi'            => $input['lokasi'],
            'tanggal_terima'    => $input['tanggal_terima'],
            'jenis_conto'       => $input['jenis_conto'],
            'kode_conto'        => $input['kode_conto']
        );

        return $this->db->where('id', $input['id'])->update('analisis', $data);
    }

    /**
     * @param $id_analisis
     * @return mixed
     */
    public function parameter($id_analisis)
    {
        return $this->db->where('id_analisis', $id_analisis)->get('analisis_parameter')->result();
    }

    /**
     * @param $id_analisis_parameter
     * @return mixed
     */
    public function find_parameter($id_analisis_parameter)
    {
        return $this->db->where('id', $id_analisis_parameter)->get('analisis_parameter')->row();
    }

    /**
     * @param $id_analisis
     * @return mixed
     */
    public function type_analisis($id_analisis)
    {
        return $this->db->where('id_analisis', $id_analisis)->get('analisis_type_analisis')->result();
    }

    /**
     * @param $input
     * @return CI_DB_active_record
     */
    public function update_parameter($input)
    {
        $data = array(
            'satuan'        => $input['satuan'],
            'id_metoda'     => $input['id_metoda'],
            'basis'         => $input['basis'],
            'harga'         => $input['harga']
        );

        return $this->db->where('id', $input['id'])->update('analisis_parameter', $data);
    }
}
