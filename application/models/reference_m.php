<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class reference_m extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function all($table)
    {
        return $this->db->order_by('deskripsi', 'ASC')->get('ref_' . $table)->result();
    }

    public function find_by_table_id($table, $id)
    {
        $q = (array) $this->db->select("deskripsi as $table")->where('id', $id)->limit(1)->get('ref_' . $table)->row();

        return  $q ? $q[$table] : '' ;
    }

    public function find_by_id($table, $id)
    {
        return $this->db->where('id', $id)->limit(1)->get('ref_' . $table)->row();
    }

    public function find($table, $deskripsi)
    {
        return $this->db->where('deskripsi', $deskripsi)->limit(1)->get('ref_' . $table)->row();
    }

    public function insert($table, $deskripsi)
    {
        $data = array(
            'deskripsi'       => $deskripsi['deskripsi']
        );

        return $this->db->insert('ref_'.$table, $data);
    }

    public function update($table, $input)
    {
        $data = array(
            'deskripsi'       => $input['deskripsi']
        );

        return $this->db->where('id', $input['id'])->update('ref_'.$table, $data);
    }

}
