<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/18/13
 * Time: 9:04 AM
 */
class Analisis_m extends CI_Model
{
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

    public function by_month($month)
    {
        return $this->db->where('MONTH(created_date)', $month)->order_by('created_date', 'DESC')->get('analisis')->result();
    }

    /**
     * @param $id_lab
     * @return bool
     */
    private function _is_fisika($id_lab)
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

    public function find_by_nomor_analisis($nomor_analisis)
    {
        return $this->db->where('nomor_analisis', $nomor_analisis)
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
            'lokasi'                => $input['lokasi'],
            'tanggal_terima'        => $input['tanggal_terima'],
            'tanggal_daftar'        => now(),
            'tanggal_analisis'      => now(),
            'tanggal_publish'       => now(),
            'nomor_sertifikat'      => '',
            'id_petugas'            => $this->session->userdata('logged_id'),
            'id_lab'                => $input['id_lab'],
            'biaya'                 => $input['biaya'],
            'id_pemohon'            => $input['id_pemohon'],
            'estimasi_time'         => $this->session->userdata('estimasi_time'),
            'estimasi_time_delay'   => $this->session->userdata('estimasi_time_delay'),
            'estimasi_date'         => $this->session->userdata('estimasi_date'),
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
    public function insert_type_analisis_parameter($input)
    {
        $data = array(
            'id_analisis'                       => $input['id_analisis'],
            'id_type_analisis_parameter'        => $input['id_type_analisis_parameter'],
            'harga'                             => $input['harga']
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
            'id_type_analisis'           => $input['id_type_analisis'],
            'harga'                      => $input['harga'],
            'is_prepared'                => 0,
            'selesai_preparasi'          => null,
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
        return $this->db->select('analisis_parameter.*')
            ->where('id_analisis', $id_analisis)
            ->get('analisis_parameter')
            ->result();
    }

    public function type_analisis_parameter($id_analisis)
    {
        return $this->db->select('type_analisis.*')
            ->where('id_analisis', $id_analisis)
            ->join('type_analisis_parameter', 'type_analisis_parameter.id = type_analisis_parameter.id_type_analisis_parameter')
            ->join('type_analisis', 'type_analisis.id = type_analisis_parameter.id_type_analisis')
            ->group_by('type_analisis.id')
            ->get('analisis_parameter')
            ->result();
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

    public function parameter_by_type_analisis($id_analisis, $id_type_analisis)
    {
        return $this->db->select('analisis_parameter.*, type_analisis_parameter.*, parameter.nama as nama_parameter, parameter.deskripsi')
            ->join('type_analisis_parameter', 'type_analisis_parameter.id=analisis_parameter.id_type_analisis_parameter')
            ->join('parameter', 'parameter.id=type_analisis_parameter.id_parameter')
            ->where('type_analisis_parameter.id_type_analisis', $id_type_analisis)
            ->where('analisis_parameter.id_analisis', $id_analisis)
            ->get('analisis_parameter')
            ->result();
    }

    /**
     * @param $input
     * @return CI_DB_active_record
     */
    public function update_parameter($input)
    {
        $data = array(
            'satuan'        => $input['satuan'] == '' ? null : $input['satuan'],
            'id_metoda'     => $input['id_metoda'] == '' ? null : $input['id_metoda'],
            'basis'         => $input['basis'] == '' ? null : $input['basis'],
            'harga'         => $input['harga']
        );

        return $this->db->where('id', $input['id'])->update('analisis_parameter', $data);
    }

    public function update_tracking($input)
    {
        $data = [
            'id_analisis_tracking'      => $input[1]
        ];

        return $this->db->where('id', $input[0])->update('analisis', $data);
    }

    public function set_selesai($input)
    {
        $data = [
            'is_selesai'    => $input['value']
        ];

        return $this->db->where('id', $input['id'])->update('analisis', $data);
    }

    public function update_analisis_type_analisis_selesai_preparasi($input)
    {
        $data = [
            'selesai_preparasi'     => $input['selesai_preparasi'],
            'is_prepared'          => $input['is_prepared']
        ];

        return $this->db->where('id', $input['id'])->update('analisis_type_analisis', $data);
    }

    public function is_selesai($id_lab, $is_selesai = 1)
    {
        return $this->db->where('id_lab', $id_lab)->where('is_selesai', $is_selesai)->get('analisis')->result();
    }
}
