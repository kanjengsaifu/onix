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
        $satuan = $this->reference_m->all('satuan');
        $mineral = $this->reference_m->all('mineral');

        $data = [
            'title'         => 'Reference',
            'main_content'  => 'reference/reference_v',
            'satuan'        => $satuan,
            'mineral'        => $mineral
        ];

        $this->load->view('template', $data);
    }

    public function create($table)
    {
        $this->load->library('form_validation');

        $this->form_validation->set_rules(
                    'deskripsi',
                    'Deskripsi',
                    'required|trim|xss_clean|is_unique[ref_'.$table.'.deskripsi]'
        );

        if($this->form_validation->run() != FALSE)
        {
            $insert = $this->reference_m->insert($table, $this->input->post());

            redirect('reference');
        }
        else
        {
            $this->index();
        }
    }

    public function detail($table, $id)
    {
        $this->load->library('form_validation');
        $reference = $this->reference_m->find_by_id($table, $id);

        $data = [
            'title'         => 'Reference',
            'main_content'  => 'reference/detail_reference_v',
            'reference'     => $reference,
            'table'         => $table
        ];

        $this->load->view('template', $data);
    }

    public function update()
    {
        $this->load->library('form_validation');

        $this->form_validation->set_rules(
            'deskripsi',
            'Deskripsi',
            'required|trim|xss_clean|is_unique[ref_'.$this->input->post('table').'.deskripsi]'
        );

        if($this->form_validation->run() != FALSE)
        {
            $this->reference_m->update($this->input->post('table'), $this->input->post());
            redirect('reference');
        }
        else
        {
            $this->detail($this->input->post('table'), $this->input->post('id'));
        }
    }
}
