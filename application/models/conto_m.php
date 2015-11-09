<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Conto_m extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * @param $id
     * @return mixed
     */
    public function find($id)
    {
        return $this->db->where('id', $id)
            ->limit(1)
            ->get('conto')
            ->row();
    }

    public function find_detail_conto_fisika($id)
    {
        return $this->db->where('id', $id)
            ->limit(1)
            ->get('conto_detail_fisika')
            ->row();
    }

    public function detail_fisika($id_conto, $id_type_analisis)
    {
        return $this->db->where('id_conto', $id_conto)
            ->where('id_type_analisis', $id_type_analisis)
            ->limit(1)
            ->get('conto_detail_fisika')
            ->row();
    }

    public function detail_fisika_by_conto($id_conto)
    {
        return $this->db->where('id_conto', $id_conto)
            ->join('type_analisis', 'type_analisis.id=conto_detail_fisika.id_type_analisis')
            ->select('conto_detail_fisika.*, type_analisis.nama as nama_type_analisis, type_analisis.id_type_analisis as kode_type_analisis')
            ->get('conto_detail_fisika')
            ->result();
    }

    /**
     * @param $id_analisis
     * @return mixed
     */
    public function by_analisis($id_analisis)
    {
        return $this->db->where('id_analisis', $id_analisis)->get('conto')->result();
    }

    /**
     * @param $id_lab
     * @return mixed
     */
    public function count_conto_by_laboratorium($id_lab)
    {
        $count = $this->db->select('SUM(jumlah_conto) as jumlah')->where('id_lab', $id_lab)->get('analisis')->row();

        return $count->jumlah;
    }

    /**
     * @param $id_analisis
     * @return int
     */
    public function count_conto_by_analisis($id_analisis)
    {
        $result = $this->db->select('id')->where('id_analisis', $id_analisis)->get('conto')->result();

        return count($result);
    }

    /**
     * @param $id_analisis
     * @return mixed
     */
    public function count_conto_selesai_by_analisis($id_analisis)
    {
        $result = $this->db->select('id')
                            ->where('id_analisis', $id_analisis)
                            ->where('is_selesai', TRUE)
                            ->get('conto')
                            ->result();

        return count($result);
    }

    /**
     * @param $id_analisis
     * @return mixed
     */
    public function count_conto_added_by_analisis($id_analisis)
    {
        $result = $this->db->select('id')
            ->where('id_analisis', $id_analisis)
            ->get('conto')
            ->result();

        return count($result);
    }

    /**
     * @param $id_analisis
     * @return bool
     */
    private function _last_nomor_conto_by_analisis($id_analisis)
    {
        $result = $this->db->where('id_analisis', $id_analisis)
                           ->select('nomor_conto')
                           ->order_by('nomor_conto', 'DESC')
                           ->get('conto')
                           ->row();

        return $result ? $result->nomor_conto : FALSE;
    }

    /**
     * @param $id_analisis
     * @return bool|string
     */
    public function new_nomor_conto_by_analisis($id_analisis)
    {
        $last_nomor_conto = $this->_last_nomor_conto_by_analisis($id_analisis);

        $nomor_conto = FALSE;
        if($last_nomor_conto)
        {
            $last_nomor_conto++;
            $nomor_conto = (string) substr($last_nomor_conto, 0, 6) . str_pad((string) substr($last_nomor_conto, 6, 5), 5, 0, STR_PAD_LEFT);
        }

        return $nomor_conto;
    }

    /**
     * @param $id_conto
     * @return mixed
     */
    public function parameter($id_conto)
    {
        return $this->db->where('id_conto', $id_conto)->get('conto_parameter')->result();
    }

    /**
     * @param $id_conto
     * @return mixed
     */
    public function type_analisis($id_conto)
    {
        return $this->db->select('conto_detail_fisika.*, type_analisis.nama as type_analisis')
            ->join('type_analisis', 'type_analisis.id=conto_detail_fisika.id_type_analisis')
            ->where('id_conto', $id_conto)->get('conto_detail_fisika')->result();
    }

    public function parameter_by_type_analisis($id_conto, $id_type_analisis)
    {
        return $this->db->select('conto_parameter.*, analisis_parameter.satuan, analisis_parameter.satuan, analisis_parameter.id_metoda, analisis_parameter.basis, analisis_parameter.harga, parameter.nama as nama_parameter, parameter.deskripsi')
            ->join('analisis_parameter', 'analisis_parameter.id=conto_parameter.id_analisis_parameter')
            ->join('type_analisis_parameter', 'type_analisis_parameter.id=analisis_parameter.id_type_analisis_parameter')
            ->join('parameter', 'parameter.id=type_analisis_parameter.id_parameter')
            ->where('type_analisis_parameter.id_type_analisis', $id_type_analisis)
            ->where('conto_parameter.id_conto', $id_conto)
            ->get('conto_parameter')
            ->result();
    }

    /**
     * @param $input
     * @return CI_DB_active_record
     */
    public function insert($input)
    {
        $data = array(
            'nomor_conto'           => $input['nomor_conto'],
            'id_analisis'           => $input['id_analisis'],
            'tanggal_proses'        => now(),
            'id_petugas'            => $this->session->userdata('logged_id'),
            'created_date'          => now()
        );

        $this->db->insert('conto', $data);

        return $this->db->insert_id();
    }

    /**
     * @param $input
     * @return CI_DB_active_record
     */
    public function insert_parameter($input)
    {
        $data = array(
            'id_conto'      => $input['id_conto'],
            'id_analisis_parameter'  => $input['id'],
            'nilai'         => 0
        );

        return $this->db->insert('conto_parameter', $data);
    }

    /**
     * @param $id_conto
     * @param $analisis_parameter
     */
    public function insert_batch_parameter($id_conto, $analisis_parameter)
    {
        foreach($analisis_parameter as $row)
        {
            $row = (array) $row;
            $row['id_conto'] = $id_conto;
            $this->insert_parameter($row);
        }
    }

    public function update_parameter($input)
    {
        $data = array(
            'nilai'         => $input['nilai']
        );

        return $this->db->where('id', $input['id'])->update('conto_parameter', $data);
    }

    /**
     * @param $input
     * @return CI_DB_active_record
     */
    public function insert_detail_fisika($input)
    {
        $data = array(
            'id_conto'              => $input['id_conto'],
            'id_type_analisis'      => $input['id_type_analisis'],
            'id_petugas'            => $this->session->userdata('logged_id'),
            'created_date'          => now()
        );

        return $this->db->insert('conto_detail_fisika', $data);
    }

    /**
     * @param $id_conto
     * @param $analisis_type_analisis
     */
    public function insert_batch_type_analisis($id_conto, $analisis_type_analisis)
    {
        foreach($analisis_type_analisis as $row)
        {
            $row = (array) $row;
            $row['id_conto'] = $id_conto;
            $this->insert_detail_fisika($row);
        }
    }

    public function update_nilai_fisika($input)
    {
        $data = [
            'nilai'     => json_encode($input)
        ];

        return $this->db->where('id', $input['id'])->update('conto_detail_fisika', $data);
    }

    public function update_kode_conto($input)
    {
        $data = [
            'kode_conto'    => $input['kode_conto']
        ];

        return $this->db->where('id', $input['id'])->update('conto', $data);
    }

    public function set_selesai($input)
    {
        $data = [
            'is_selesai'    => $input['value']
        ];

        return $this->db->where('id', $input['id'])->update('conto', $data);
    }

}
