<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Parameter extends PS_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model(array('parameter_m', 'type_analisis_m'));
    }

    public function index()
    {
        $parameter = $this->parameter_m->all();

        $data = [
            'title'         => 'Parameter',
            'main_content'  => 'parameter/parameter_v',
            'parameter'     => $parameter
        ];

        $this->load->view('template', $data);
    }

    public function detail($id_parameter)
    {
        $parameter = $this->parameter_m->find($id_parameter);

        if(!$parameter)
        {
            redirect('parameter');
        }

        $this->load->model('metoda_m');

        // initialize
        $metoda = $this->metoda_m->all();
        $parameter->metoda_parameter = $this->metoda_m->by_parameter($id_parameter);
        $parameter->metoda_parameter_array = shrink($parameter->metoda_parameter, 'id_metoda');

        $data = array(
            'title'         => 'Parameter',
            'main_content'  => 'parameter/detail_parameter_v',
            'parameter'     => $parameter,
            'metoda'        => $metoda
        );

        $this->load->view('template', $data);
    }

    public function create()
    {
        $this->load->library('form_validation');

        if($this->form_validation->run() == FALSE)
        {
            $data = array(
                'title'         => 'Parameter',
                'main_content'  => 'parameter/t_parameter_v',
            );

            $this->load->view('template', $data);
        }
        else
        {
            $insert = $this->parameter_m->insert($this->input->post());
            redirect('parameter/detail/' . $insert);
        }
    }

    public function update_harga()
    {
        $this->load->library('form_validation');
        $this->form_validation->set_rules('harga', 'Harga Parameter', 'required|trim|integer|xss_clean');
        $this->form_validation->set_rules('id_parameter', 'ID Parameter', 'required|trim|xss_clean');

        if($this->form_validation->run())
        {
            $this->parameter_m->update_harga($this->input->post());
            set_flashdata('Berhasil Update harga Parameter', 'success', 'fa fa-check');
        }

        redirect('parameter/detail/'.$this->input->post('id_parameter'));
    }

    public function update_metoda()
    {
        $this->load->model('metoda_m');
        $this->load->library('form_validation');

        $this->form_validation->set_rules('id_parameter', 'ID Parameter', 'required|trim|xss_clean');

        if($this->form_validation->run())
        {
            $this->metoda_m->update_metoda_parameter($this->input->post());
            redirect('parameter/detail/'.$this->input->post('id_parameter'));
        }
        else
        {
            $this->detail($this->input->post('id_parameter'));
        }



    }
}
