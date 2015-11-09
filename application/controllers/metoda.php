<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Metoda extends PS_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model(['metoda_m', 'lab_m']);
    }

    public function index()
    {
        $metoda = $this->metoda_m->all();

        foreach($metoda as $key => $row)
        {
            $lab = $this->lab_m->find($row->id_laboratorium);

            $metoda[$key]->lab = $lab->nama;
        }

        $data = [
            'title'         => 'Metoda',
            'main_content'  => 'metoda/metoda_v',
            'metoda'        => $metoda
        ];

        $this->load->view('template', $data);
    }

    public function create()
    {
        $this->load->library('form_validation');

        $lab = $this->lab_m->all();

        if($this->form_validation->run() != FALSE)
        {
            $insert = $this->metoda_m->insert($this->input->post());

            redirect('metoda/detail/' . $insert);
        }
        else
        {
            $data = [
                'title'         => 'Metoda',
                'main_content'  => 'metoda/t_metoda_v',
                'lab'           => $lab
            ];

            $this->load->view('template', $data);
        }
    }

    public function detail($id)
    {
        $this->load->library('form_validation');
        $metoda = $this->metoda_m->find($id);
        $lab = $this->lab_m->all();

        $data = [
            'title'         => 'Metoda',
            'main_content'  => 'metoda/detail_metoda_v',
            'metoda'        => $metoda,
            'lab'           => $lab
        ];

        $this->load->view('template', $data);
    }

    public function update()
    {
        $this->load->library('form_validation');

        if($this->form_validation->run('metoda/create') != FALSE)
        {
            $this->metoda_m->update($this->input->post());
            redirect('metoda/detail/' . $this->input->post('id'));
        }
        else
        {
            $this->detail($this->input->post('id'));
        }
    }
}
