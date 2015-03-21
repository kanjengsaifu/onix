<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/26/13
 * Time: 10:07 AM
 */
class Permohonan_m extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }


    public function get_by_type($id_type)
    {
        $q = $this->db->query("SELECT is_selesai, id_analisis, jenis_contoh, tanggal_terima, id_pemohon, biaya, id_lab, lokasi FROM hasil_analisis WHERE SUBSTRING(id_pemohon,1,1)='$id_type' ORDER BY created_at DESC");

        return $q->result();
    }

    public function get_by_pemohon($id_pemohon)
    {
        $q = $this->db->query("SELECT is_selesai, id_analisis, jenis_contoh, tanggal_terima, id_pemohon, biaya, id_lab, lokasi, is_selesai FROM hasil_analisis WHERE id_pemohon='$id_pemohon' ORDER BY created_at DESC");

        return $q->result();
    }

}
