<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 12/3/13
 * Time: 1:02 PM
 */
class lokasi_m extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function find_provinsi($id_provinsi)
    {
        return $this->db->where('id_provinsi', $id_provinsi)->limit(1)->get('provinsi')->row();
    }

    public function find_kabupaten($id_kabupaten)
    {
        return $this->db->where('id_kabupaten', $id_kabupaten)->limit(1)->get('kabupaten')->row();
    }

    public function detail_by_kabupaten($id_kabupaten, $string_only = FALSE)
    {
        $kabupaten = $this->find_kabupaten($id_kabupaten);
        $provinsi = $this->find_provinsi($kabupaten->id_provinsi);

        $array = array(
            'kabupaten'     => $kabupaten,
            'provinsi'      => $provinsi
        );

        $array = (object) $array;

        return $string_only ? 'Kab. ' . $kabupaten->nama . ', Prov. ' . $provinsi->nama : $array;
    }

    public function all_provinsi()
    {
        return $this->db->order_by('nama', 'ASC')->get('provinsi')->result();
    }

    public function kabupaten_by_provinsi($id_provinsi)
    {
        return $this->db->where('id_provinsi', $id_provinsi)->get('kabupaten')->result();
    }

    public function nama_prov_by_id_kab($id_kabupaten)
    {
        $q = $this->db->query("SELECT provinsi.nama FROM kabupaten,provinsi WHERE id_kabupaten='$id_kabupaten' AND kabupaten.id_provinsi=provinsi.id_provinsi");
        if($q->num_rows() != 0)
        {
            $result = $q->row();
            $nama = $result->nama;
        }
        else
            $nama = FALSE;

        return $nama;
    }

    public function id_prov_by_id_kab($id_kabupaten)
    {
        $q = $this->db->query("SELECT provinsi.id_provinsi FROM kabupaten,provinsi WHERE id_kabupaten='$id_kabupaten' AND kabupaten.id_provinsi=provinsi.id_provinsi");
        if($q->num_rows() != 0)
        {
            $result = $q->row();
            $id = $result->id_provinsi;
        }
        else
            $id = FALSE;

        return $id;
    }

    public function nama_kab($id_kabupaten)
    {
        $q = $this->db->query("SELECT nama FROM kabupaten WHERE id_kabupaten='$id_kabupaten'");
        if($q->num_rows() != 0)
        {
            $result = $q->row();
            $nama = $result->nama;
        }
        else
            $nama = FALSE;

        return $nama;
    }

}
