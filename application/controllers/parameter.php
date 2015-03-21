<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Parameter extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model(array('parameter_m', 'type_analisis_m'));
    }

    public function detail($id_parameter)
    {
        $parameter = $this->parameter_m->find($id_parameter);

        if(!$parameter)
            redirect('type_analisis');

        $this->load->model('metoda_m');

        // initialize
        $id_lab = substr($parameter->id_parameter, 0, 3);
        $metoda = $this->metoda_m->by_lab($id_lab);
        $type_analisis = $this->type_analisis_m->find_by_id_type($parameter->id_type_analisis);
        $parameter->metoda_parameter = $this->metoda_m->by_parameter($id_parameter);
        $parameter->metoda_parameter_array = object_to_array_id_only($parameter->metoda_parameter, 'id_metoda');

        $data = array(
            'title'         => 'Parameter',
            'main_content'  => 'parameter/detail_parameter_v',
            'parameter'     => $parameter,
            'metoda'        => $metoda,
            'type_analisis' => $type_analisis
        );

        $this->load->view('template', $data);
    }

    public function tambah_parameter($id_type)
    {
        $this->load->library('form_validation');

        if($this->form_validation->run('parameter/tambah') == FALSE)
        {
            $type_analisis = $this->type_analisis_m->find($id_type);
            $data = array(
                'title'         => 'Parameter',
                'main_content'  => 'parameter/t_parameter_v',
                'type_analisis' => $type_analisis
            );

            $this->load->view('template', $data);
        }
        else
        {
            $this->parameter_m->insert($this->input->post());
            redirect('type_analisis/detail/'.$this->input->post('id_type_analisis'));
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

        $this->form_validation->set_rules('metoda', 'Metoda', 'required');
        $this->form_validation->set_rules('id_parameter', 'ID Parameter', 'required|trim|xss_clean');

        if($this->form_validation->run())
        {
            $this->metoda_m->update_metoda_parameter($this->input->post());
            set_flashdata('Berhasil Update Harga Parameter', 'success', 'fa fa-check');
        }
        else
        {
            set_flashdata(validation_errors());
        }

        redirect('parameter/detail/'.$this->input->post('id_parameter'));

    }
}
