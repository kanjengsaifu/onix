<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/18/13
 * Time: 7:22 AM
 */
class Parameter_m extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function all()
    {
        return $this->db->order_by('nama', 'ASC')->get('parameter')->result();
    }

    public function find($id_parameter)
    {
        return $this->db->where('id', $id_parameter)->limit(1)->get('parameter')->row();
    }

    public function find_type_analisis_parameter($id)
    {
        return $this->db->select('type_analisis_parameter.*, parameter.nama as nama_parameter, parameter.deskripsi')
            ->join('parameter', 'parameter.id=type_analisis_parameter.id_parameter')
            ->where('type_analisis_parameter.id', $id)
            ->limit(1)
            ->get('type_analisis_parameter')
            ->row();
    }

    public function by_type_analisis($id_type_analisis)
    {
        return $this->db->where('id_type_analisis', $id_type_analisis)->get('parameter')->result();
    }

    public function detail_parameter($id_param)
    {
        $q = $this->db->query("SELECT id_parameter,nama, deskripsi, satuan,id_type,  id_metoda, harga FROM parameter WHERE id_parameter='$id_param' LIMIT 1");

        return $q->row();
    }

    public function update_harga($input)
    {
        $data = array(
            'harga'     => $input['harga']
        );

        return $this->db->where('id_parameter', $input['id_parameter'])->update('parameter', $data);
    }

    public function metoda_digunakan($id_parameter)
    {
        $q = $this->db->query("SELECT * FROM metoda_parameter JOIN metoda ON metoda_parameter.id_metoda = metoda.id_metoda WHERE id_parameter='$id_parameter'");

        return $q->result();
    }

    /**
     * @param $input
     * @return mixed
     */
    public function insert($input)
    {
        $data = array(
            'harga'             => $input['harga'],
            'nama'              => $input['nama'],
            'satuan'            => $input['satuan'],
            'deskripsi'         => $input['deskripsi']
        );

        $this->db->insert('parameter', $data);

        return $this->db->insert_id();
    }

}
