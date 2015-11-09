<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Tracking_m extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function insert($input)
    {
        $data = [
            'id_analisis'                       => $input['id_analisis'],
            'id_kegiatan'                       => $input['id_kegiatan'],
            'id_petugas'                        => $this->session->userdata('logged_id'),
            'created_date'                      => now()
        ];

        $this->db->insert('analisis_tracking', $data);

        return $this->db->insert_id();
    }

    public function isset_tracking($id_analisis, $id_kegiatan)
    {
        return $this->db->where('id_analisis', $id_analisis)
            ->where('id_kegiatan', $id_kegiatan)
            ->get('analisis_tracking')
            ->row();
    }

}
