<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 9/23/14
 * Time: 7:07 PM
 */

class Metoda_m extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function all()
    {
        return $this->db->order_by('nama', 'ASC')->get("metoda")->result();
    }

    public function find($id_metoda)
    {
        return $this->db->where('id_metoda', $id_metoda)->limit(1)->get('metoda')->row();
    }
    public function by_parameter($id_parameter)
    {
        return $this->db->where('id_parameter', $id_parameter)
                        ->join('metoda', 'metoda.id_metoda=metoda_parameter.id_metoda')
                        ->select('metoda.id_metoda, metoda.nama')
                        ->get('metoda_parameter')
                        ->result();
    }

    public function by_lab($id_lab ='fmb')
    {
        return $this->db->where('id_laboratorium', $id_lab)->order_by('nama', 'ASC')->get('metoda')->result();
    }

    public function metoda_knl()
    {
        $q = $this->db->query("SELECT * FROM metoda WHERE id_metoda='1' OR id_metoda='5' OR id_metoda='6' OR id_metoda='7'");

        return $q->result();
    }

    public function update_metoda_parameter($input)
    {
        $this->delete_metoda_parameter($input['id_parameter']);

        foreach($this->input->post('metoda') as $metoda)
        {
            $this->insert_metoda_parameter($metoda, $input['id_parameter']);
        }
    }

    public function insert_metoda_parameter($id_metoda, $id_parameter)
    {
        $data = array(
            'id_metoda'     => $id_metoda,
            'id_parameter'  => $id_parameter
        );

        return $this->db->insert('metoda_parameter', $data);
    }

    public function delete_metoda_parameter($id_parameter)
    {
        return $this->db->where('id_parameter', $id_parameter)->delete('metoda_parameter');
    }


} 