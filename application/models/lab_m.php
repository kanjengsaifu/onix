<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/18/13
 * Time: 6:54 AM
 */
class Lab_m extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function all()
    {
        return $this->db->get('laboratorium')->result();
    }

    public function get_all()
    {
        $q = $this->db->query("SELECT id_lab,nama FROM laboratorium");

        return $q->result();
    }

    public function find($id_lab)
    {
        return $this->db->where('id_lab', strtolower($id_lab))->limit(1)->get('laboratorium')->row();
    }

    public function get_nama($id_lab)
    {
        $q = $this->db->query("SELECT nama FROM laboratorium WHERE id_lab='$id_lab'");
        if($q->num_rows() > 0)
        {
            $result = $q->row();
            return $result->nama;
        }
        else
            return FALSE;
    }

    public function get_lab_by_id($id_lab)
    {
        $q = $this->db->query("SELECT id_lab,nama FROM laboratorium WHERE id_lab='$id_lab'");
        if($q->num_rows() > 0)
            return $q->row();
        else
            return FALSE;
    }

    /**
     * @param $id_komoditi
     * @return mixed
     */
    public function by_komoditi($id_komoditi)
    {
        return $this->db->where('id_komoditi', $id_komoditi)->get('laboratorium')->result();
    }

    /**
     * @param $id_lab
     * @return bool
     */
    public function get_id_komoditi($id_lab)
    {
        $q = $this->db->query("SELECT id_komoditi FROM laboratorium WHERE id_lab='$id_lab'");
        if($q->num_rows() > 0)
        {
            $result = $q->row();
            return $result->id_komoditi;
        }
        else
            return FALSE;
    }

}
