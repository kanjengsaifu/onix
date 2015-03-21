<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/18/13
 * Time: 5:26 PM
 */
class k_penelitian_m extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function get_nama($id)
    {
        $q = $this->db->query("SELECT nama FROM k_penelitian WHERE id_kp='$id'");
        $result = $q->row();

        return $result->nama;
    }

    public function get_nama_by_id_pemohon($id)
    {
        $q = $this->db->query("SELECT nama FROM k_penelitian WHERE id_pemohon='$id'");
        $result = $q->row();

        return $result->nama;
    }

    public function get_detail_kp($id_kp)
    {
        $q = $this->db->query("SELECT * FROM k_penelitian WHERE id_kp='$id_kp'");
        $result = FALSE;
        if($q->num_rows() > 0)
        {
            $result = $q->row();
        }

        return $result;
    }

    public function cek_id($id)
    {
        $q = $this->db->query("SELECT id_kp FROM k_penelitian WHERE id_kp=?", array($id));

        if($q->num_rows > 0)
            return TRUE;
        else
            return FALSE;
    }

    public function get_all()
    {
        $q = $this->db->query("SELECT id_kp, nama, id_pemohon FROM k_penelitian ORDER BY id_pemohon ASC");

        return $q->result();
    }

    public function simpan()
    {
        $this->load->model('pemohon_m');
        $simpan_pemohon = $this->pemohon_m->simpan();
        if($simpan_pemohon)
        {
            $id = $this->input->post('id');
            $nama = $this->input->post('nama');
            $id_pemohon = $this->pemohon_m->get_id_pemohon($id);

            $data = array(
                $id,
                $id_pemohon,
                $nama
            );

            $q = $this->db->query("INSERT INTO k_penelitian VALUES(?,?,?)", $data);
            if($q)
                return TRUE;
            else
                return FALSE;
            }
        else
            return FALSE;
    }

    public function ubah()
    {
        $id_kp = $this->input->post('id_kp');
        $id_kp_lama = $this->input->post('id_kp_lama');
        $nama = $this->input->post('nama');

        $data = array(
            $id_kp,
            $nama,
            $id_kp_lama
        );

        $data2 = array(
            $id_kp,
            $id_kp_lama
        );

        $q1= $this->db->query("UPDATE k_penelitian SET id_kp=?, nama=? WHERE id_kp=?", $data);
        if($q1 != FALSE )
        {
            $q2 = $this->db->query("UPDATE pemohon SET id_pemilik=? WHERE id_pemilik=?", $data2);
            if($q2 != FALSE)
                return TRUE;
            else
                return FALSE;
        }
        else
            return FALSE;
    }

    public function hapus($id_kp)
    {
        $q = $this->db->query("DELETE FROM pegawai WHERE id_pegawai=?", array($id_kp));

        if($q != FALSE)
            return TRUE;
        else
            return FALSE;
    }

}
