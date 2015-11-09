<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/18/13
 * Time: 7:20 AM
 */
class Type_analisis_m extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function all()
    {
        return $this->db->get("type_analisis")->result();
    }

    public function find($id)
    {
        return $this->db->where('id', $id)->limit(1)->get("type_analisis")->row();
    }

    public function find_by_id_type($id_type)
    {
        return $this->db->where('id_type_analisis', $id_type)->limit(1)->get("type_analisis")->row();
    }

    public function insert($input)
    {
        $data = [
            'id_type_analisis'      => strtolower($input['id_type_analisis']),
            'nama'                  => $input['nama'],
            'id_lab'                => $input['id_lab'],
            'deskripsi'             => $input['deskripsi'],
            'harga'                 => $input['harga'],
            'created_date'          => now()
        ];

        $this->db->insert('type_analisis', $data);

        return $this->db->insert_id();
    }

    public function parameter($id_type_analisis)
    {
        return $this->db->select('type_analisis_parameter.*, parameter.nama as nama_parameter')
            ->join('parameter', 'type_analisis_parameter.id_parameter=parameter.id')
            ->where('id_type_analisis', $id_type_analisis)
            ->get('type_analisis_parameter')
            ->result();
    }

    public function by_lab($id_lab)
    {
        return $this->db->where('id_lab', $id_lab)->order_by('nama', 'ASC')->get('type_analisis')->result();
    }

    public function detail_type_analisis($id_type)
    {
        $q = $this->db->query("SELECT id_type, nama, harga, id_lab FROM type_analisis WHERE id_type='$id_type'");

        return $q->row();
    }

    public function get_type_and_param_by_lab($id_lab)
    {
        $this->load->model('parameter_m');

        $result = array();

        $type_analisis = $this->get_type_by_lab($id_lab);
        foreach($type_analisis as $row)
        {
            $data = array(
                'id_type'   => $row->id_type,
                'nama'      =>  $row->nama,
                'parameter' =>  $this->parameter_m->get_param_by_type($row->id_type)
            );

            array_push($result, $data);
        }

        return $result;
    }

    public function update_harga($input)
    {
        $data = array(
            'harga'     => $input['harga']
        );

        return $this->db->where('id_type_analisis', $input['id_type_analisis'])->update('type_analisis', $data);
    }

    public function get_nama($id_type_analisis)
    {
        $q = $this->db->query("SELECT nama FROM type_analisis WHERE id_type='$id_type_analisis'");
        $r = $q->row();
        $nama = !$r ? FALSE : $r->nama;

        return $nama;
    }

    public function insert_parameter($input)
    {
        $data = [
            'id_parameter'      => $input['id_parameter'],
            'harga'             => $input['harga'],
            'satuan'            => $input['satuan'],
            'id_type_analisis'  => $input['id_type_analisis']
        ];

        return $this->db->insert('type_analisis_parameter', $data);
    }

    public function delete_type_analisis_parameter($id)
    {
        return $this->db->where('id', $id)->delete('type_analisis_parameter');
    }

}
