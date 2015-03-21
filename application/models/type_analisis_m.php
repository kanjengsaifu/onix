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

    public function find($id_type_analisis)
    {
        return $this->db->where('id_type_analisis', $id_type_analisis)->limit(1)->get("type_analisis")->row();
    }

    public function find_by_id_type($id_type)
    {
        return $this->db->where('id_type_analisis', $id_type)->limit(1)->get("type_analisis")->row();
    }

    public function by_lab($id_lab)
    {
        return $this->db->where('id_lab', $id_lab)->get('type_analisis')->result();
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

}
