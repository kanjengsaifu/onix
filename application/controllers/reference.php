<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Reference extends PS_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('reference_m');
    }

    public function index()
    {
        $satuan = $this->reference_m->all('ref_satuan');
        $mineral = $this->reference_m->all('ref_mineral');

        $data = [
            'title'         => 'Satuan',
            'main_content'  => 'satuan/satuan_v',
            'satuan'        => $satuan,
            'mineral'        => $mineral
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
