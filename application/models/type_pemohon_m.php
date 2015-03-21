<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Type_pemohon_m extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function find($id_type_pemohon)
    {
        return $this->db->select('nama')->where('id', $id_type_pemohon)->limit(1)->get('type_pemohon')->row();
    }

}
