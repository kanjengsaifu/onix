<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Lokasi extends Admin_controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('lokasi_m');
    }

    public function index()
    {
        $provinsi = $this->lokasi_m->all_provinsi();
        $kabupaten = $this->lokasi_m->all_kabupaten();

        foreach($kabupaten as $key => $row)
        {
            $detail_provinsi = $this->lokasi_m->find_provinsi($row->id_provinsi);
            $kabupaten[$key]->provinsi = $detail_provinsi->nama;
        }

        $data = [
            'title'             => 'Lokasi',
            'main_content'      => 'lokasi/lokasi_v',
            'provinsi'          => $provinsi,
            'kabupaten'         => $kabupaten
        ];

        $this->load->view('template', $data);
    }

    public function insert_provinsi()
    {
        $this->load->library('form_validation');

        if($this->form_validation->run())
        {
            $this->lokasi_m->insert_provinsi($this->input->post());
            redirect('lokasi');
        }
        else
        {
            $js = array(
            );

            $data = array(
                'title'         => 'Daftar',
                'main_content'  => 'lokasi/t_provinsi_v',
                'js'            => $js,
            );

            $this->load->view('template', $data);
        }
    }

    public function insert_kabupaten()
    {
        $this->load->library('form_validation');

        if($this->form_validation->run())
        {
            $this->lokasi_m->insert_kabupaten($this->input->post());
            redirect('lokasi');
        }
        else
        {
            $js = array(
            );

            $provinsi = $this->lokasi_m->all_provinsi();

            $data = array(
                'title'         => 'Daftar',
                'main_content'  => 'lokasi/t_kabupaten_v',
                'js'            => $js,
                'provinsi'      => $provinsi
            );

            $this->load->view('template', $data);
        }
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

    public function detail_provinsi($id)
    {
        $this->load->library('form_validation');

        $provinsi = $this->lokasi_m->find_provinsi($id);

        $kabupaten = $this->lokasi_m->kabupaten_by_provinsi($id);

        $data = [
            'title'         => $provinsi->nama,
            'main_content'  => 'lokasi/detail_provinsi_v',
            'provinsi'      => $provinsi,
            'kabupaten'     => $kabupaten
        ];

        $this->load->view('template', $data);
    }

    public function detail_kabupaten($id)
    {
        $this->load->library('form_validation');

        $kabupaten = $this->lokasi_m->find_kabupaten($id);

        $provinsi = $this->lokasi_m->all_provinsi($id);

        $data = [
            'title'         => $kabupaten->nama,
            'main_content'  => 'lokasi/detail_kabupaten_v',
            'provinsi'      => $provinsi,
            'kabupaten'     => $kabupaten
        ];

        $this->load->view('template', $data);
    }

    public function update_provinsi()
    {
        $this->load->library('form_validation');

        $id = $this->input->post('id');

        if($this->form_validation->run() != FALSE)
        {
            $this->lokasi_m->update_provinsi($this->input->post());
            redirect('lokasi/detail_provinsi/' . $id );
        }
        else
        {
            $this->detail_provinsi($id);
        }
    }

    public function update_kabupaten()
    {
        $this->load->library('form_validation');

        $id = $this->input->post('id');

        if($this->form_validation->run() != FALSE)
        {
            $this->lokasi_m->update_kabupaten($this->input->post());
            redirect('lokasi/detail_kabupaten/' . $id );
        }
        else
        {
            $this->detail_kabupaten($id);
        }
    }
}
