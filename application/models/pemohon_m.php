<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/18/13
 * Time: 5:03 AM
 */
class Pemohon_m extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function all()
    {
        return $this->db->join('type_pemohon', 'pemohon.id_type_pemohon=type_pemohon.id')
                        ->select('pemohon.*, type_pemohon.nama as type_pemohon')
                        ->get('pemohon')
                        ->result();
    }

    public function find($id_pemohon)
    {
        return $this->db->where('id_pemohon', $id_pemohon)->limit(1)->get('pemohon')->row();
    }

    public function get_all()
    {
        $q = $this->db->query("SELECT pemohon.*, type_pemohon.nama as type_pemohon FROM pemohon JOIN type_pemohon ON pemohon.id_type_pemohon=type_pemohon.id");

        return $q->result();


    }

    public function get_id_by_user($user)
    {
        $data = FALSE;
        $q = $this->db->query("SELECT id_pemohon FROM pemohon WHERE username='$user'");
        if($q->num_rows() > 0)
        {
            $result = $q->row();
            $data = $result->id_pemohon;
        }

        return $data;
    }

    public function cek_login($username, $password)
    {
        $q = $this->db->query("SELECT id_pemohon FROM pemohon WHERE username='$username' AND password='$password'");
        if($q->num_rows() > 0)
            return TRUE;
        else
            return FALSE;
    }


    public function cek_pengirim($id_pengirim)
    {
        $q = $this->db->query("SELECT id_pengirim FROM pengirim WHERE id_pengirim='$id_pengirim'");

        if($q->num_rows() > 0)
            return TRUE;
        else
            return FALSE;
    }

    public function get_id_pemohon($id_pemilik)
    {
        $id_pemohon = FALSE;
        $q = $this->db->query("SELECT id_pemohon FROM pemohon WHERE id_pemilik='$id_pemilik'");
        if($q->num_rows() > 0)
        {
            $result = $q->row();
            $id_pemohon = $result->id_pemohon;
        }

        return $id_pemohon;
    }

    public function get_id_pemilik($id_pemohon)
    {
        $id_pemilik = FALSE;
        $q = $this->db->query("SELECT id_pemilik FROM pemohon WHERE id_pemohon='$id_pemohon'");
        if($q->num_rows() > 0)
        {
            $result = $q->row();
            $id_pemilik = $result->id_pemilik;
        }

        return $id_pemilik;
    }

    public function get_all_type_pemohon()
    {
        return $this->db->get('type_pemohon')->result();
    }

    public function get_pemohon_by_type($id_type_pemohon)
    {
        $q = $this->db->query("SELECT pemohon.* FROM pemohon JOIN type_pemohon ON pemohon.id_type_pemohon=type_pemohon.id WHERE pemohon.id_type_pemohon='$id_type_pemohon'");

        return $q->result();
    }



    /*
     * return id_type_pemohon
     */
    public function get_type_by_id_pemohon($id_pemohon)
    {
        $q = $this->db->query("SELECT type_pemohon.* FROM pemohon JOIN type_pemohon ON type_pemohon.id=pemohon.id_type_pemohon WHERE pemohon.id_pemohon='$id_pemohon'");
        $r = $q->row();

        return $r->id;
    }

    /*
     * $user_type
     * p = perusahaan
     * k = kelompok penelitian
     */
    private function _get_id_pemohon_baru($user_type)
    {
        $q = $this->db->query("SELECT id_pemohon FROM pemohon WHERE SUBSTRING(id_pemohon, 1, 1)='$user_type' ORDER BY id_pemohon DESC LIMIT 1");
        $result = $q->row();
        $id_pemohon = substr($result->id_pemohon, 1, 3);
        $id_pemohon = $user_type.str_pad($id_pemohon+1, 3, 0, STR_PAD_LEFT);

        return $id_pemohon;
    }


    public function get_id_by_id_pemohon($id_pemohon)
    {
        $q = $this->db->query("SELECT id_pemilik FROM pemohon WHERE id_pemohon='$id_pemohon'");
        $result = $q->row();

        return $result->id_pemilik;
    }

    public function insert($input)
    {
        $nama = $input['nama'];
        $username = strtoupper(str_replace(' ', '', substr($nama, 0, 4))).rand(1, 99);
        $key = hash('crc32', $username.date('YmdHis'));
        $password = sha1($key);

        $data = array(
            'id_type_pemohon'   => $input['type_pemohon'],
            'nama'              => $input['nama'],
            'nama_sertifikat'   => $input['nama_sertifikat'],
            'alamat'            => $input['alamat'],
            'deskripsi'         => $input['deskripsi'],
            'username'          => $username,
            'password'          => $password,
            'pass_awal'         => $key,
        );

        $result = $this->db->insert('pemohon', $data);

        return $this->db->insert_id();
    }

    public function update()
    {
        $type_pemohon = $this->input->post('type_pemohon');
        $nama = $this->input->post('nama');
        $nama_sertifikat = $this->input->post('nama_sertifikat');
        $alamat = $this->input->post('alamat');
        $deskripsi = $this->input->post('deskripsi');
        $id = $this->input->post('id');

        $data = array(
            'id_type_pemohon'   => $type_pemohon,
            'nama'              => $nama,
            'nama_sertifikat'   => $nama_sertifikat,
            'alamat'            => $alamat,
            'deskripsi'         => $deskripsi
        );

        $result = $this->db->where('id_pemohon', $id)->update('pemohon', $data);

        if($result == TRUE)
            return TRUE;
        else
            return FALSE;
    }

}
