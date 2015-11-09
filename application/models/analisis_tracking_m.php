<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Analisis_tracking_m extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function find($id)
    {
        return $this->db->where('id', $id)->limit(1)->get('analisis_tracking')->row();
    }

    public function by_analisis_and_kegiatan($id_analisis, $id_kegiatan)
    {
        return $this->db->where('id_analisis', $id_analisis)
            ->where('id_kegiatan', $id_kegiatan)
            ->get('analisis_tracking')
            ->row();
    }
}
