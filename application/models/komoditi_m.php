<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/2/13
 * Time: 12:17 AM
 */
class Komoditi_m extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function get_all()
    {
        $q = $this->db->query("SELECT * FROM komoditi");

        return $q->result();
    }

    public function find($id)
    {
        return $this->db->where('id_komoditi', $id)->get('komoditi')->row();
    }

}
