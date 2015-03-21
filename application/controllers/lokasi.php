<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Lokasi extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('lokasi_m');
    }

    public function index()
    {

    }

    public function kabupaten_by_provinsi($id_provinsi)
    {
        $lokasi = $this->lokasi_m->kabupaten_by_provinsi($id_provinsi);

        if(count($lokasi) == 0)
        {
            $lokasi = FALSE;
        }

        echo json_encode($lokasi);
    }
}
