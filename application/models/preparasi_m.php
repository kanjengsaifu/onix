<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Preparasi_m extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function all()
    {
        return $this->db->get('preparasi')->result();
    }

    public function find($id)
    {
        return $this->db->where('id', $id)->limit(1)->get('preparasi')->row();
    }

    public function by_petugas()
    {
        return $this->db->select('preparasi.*, analisis.nomor_analisis')
                        ->where('preparasi.id_petugas', $this->session->userdata('logged_id'))
                        ->where('preparasi.status', 2)
                        ->join('analisis', 'analisis.id=preparasi.id_analisis')
                        ->get('preparasi')
                        ->result();
    }

    /**
     * 0: pending
     * 1: terima
     * 2: proses
     * 3: selesai
     *
     * @param $input
     * @return CI_DB_active_record
     *
     */
    public function insert($input)
    {
        $data = array(
            'id_analisis'       => $input['id_analisis'],
            'status'            => 0,
            'created_date'      => now()
        );

        return $this->db->insert('preparasi', $data);
    }

    public function update($input)
    {
        $data = array(
            'jumlah_conto'      => $input['jumlah_conto']
        );

        return $this->db->where('id', $input['id'])->update('preparasi', $data);
    }

    public function update_to_terima($id)
    {
        $data = array(
            'id_petugas'    => $this->session->userdata('logged_id'),
            'status'        => '1',
            'tanggal_masuk' => now()
        );

        return $this->db->where('id', $id)->update('preparasi', $data);
    }

    public function update_to_proses($id)
    {
        $data = array(
            'id_petugas'    => $this->session->userdata('logged_id'),
            'status'        => '2',
            'tanggal_mulai' => now()
        );

        return $this->db->where('id', $id)->update('preparasi', $data);
    }

    public function update_to_selesai($id)
    {
        $data = array(
            'id_petugas'    => $this->session->userdata('logged_id'),
            'status'        => '3',
            'tanggal_selesai' => now()
        );

        return $this->db->where('id', $id)->update('preparasi', $data);
    }

    public function update_status($input)
    {
        switch($input['status'])
        {
            case 1:
                $field_tanggal = 'tanggal_masuk';
                break;
            case 2:
                $field_tanggal = 'tanggal_mulai';
                break;
            case 3:
                $field_tanggal = 'tanggal_selesai';
                break;
        }

        $data = array(
            'id_petugas'    => $this->session->userdata('logged_id'),
            'status'        => $input['status'],
            $field_tanggal  => now()
        );

        return $this->db->where('id', $input['id'])->update('preparasi', $data);
    }

}
