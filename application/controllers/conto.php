<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Conto extends PS_Controller
{
    private $analisis;
    private $conto;

    public function __construct()
    {
        parent::__construct();
        $this->load->model(array(
            'conto_m',
            'analisis_m'
        ));
    }

    /**
     * @param $id_conto
     */
    public function detail($id_conto)
    {
        $conto = $this->conto_m->find($id_conto);
        $analisis = $this->analisis_m->find($conto->id_analisis);
        $this->conto = $conto;
        $this->analisis = $analisis;
        $is_fisika = $this->is_fisika($this->analisis->id_lab) ? TRUE : FALSE;

        if($is_fisika)
        {
            $this->_detail_fisika($id_conto);
        }
        else
        {
            $this->_detail_kimia($id_conto);
        }
    }

    /**
     * Detail Kimia
     */
    private function _detail_kimia()
    {
        $conto = $this->conto;
        $analisis = $this->analisis;
        $analisis_parameter = $this->analisis_m->parameter($analisis->id);
        $conto_parameter = $this->conto_m->parameter($conto->id);

        $this->load->model('parameter_m');
        foreach($analisis_parameter as $key => $row_parameter)
        {
            $parameter = $this->parameter_m->find($row_parameter->id_parameter);
            $nilai = 0;
            $deskripsi = $parameter->deskripsi;

            if(count($conto_parameter) > 0)
            {
                $nilai = $conto_parameter[$key]->nilai;
                $deskripsi = $conto_parameter[$key]->deskripsi;

            }

            $analisis_parameter[$key]->nama = $parameter->nama;
            $analisis_parameter[$key]->nilai = $nilai;
            $analisis_parameter[$key]->deskripsi = $deskripsi;
        }

        $analisis_conto = $this->conto_m->by_analisis($analisis->id);

        $data = array(
            'title'                 => 'Conto Kimia | ' . $conto->id_conto,
            'main_content'          => 'conto/detail_conto_kimia_v',
            'nomor_analisis'        => $analisis->nomor_analisis,
            'conto'                 => $conto,
            'analisis'              => $analisis,
            'analisis_conto'        => $analisis_conto,
            'analisis_parameter'    => $analisis_parameter

        );

        $this->load->view('template', $data);
    }

    /**
     * Detail Fisika
     */
    private function _detail_fisika()
    {
        $conto = $this->conto;
        $analisis = $this->analisis;
        $analisis_type_analisis = $this->analisis_m->type_analisis($conto->id_analisis);
        $conto_type_analisis = $this->conto_m->type_analisis($conto->id);

        $this->load->model('type_analisis_m');
        foreach($analisis_type_analisis as $key => $row_type_analisis)
        {
            $type_analisis = $this->type_analisis_m->find($row_type_analisis->id_type_analisis);
            $analisis_type_analisis[$key]->nama = $type_analisis->nama;
            $analisis_type_analisis[$key]->nilai = $conto_type_analisis[$key]->nilai;
            $analisis_type_analisis[$key]->foto_1 = $conto_type_analisis[$key]->foto_1;
            $analisis_type_analisis[$key]->foto_2 = $conto_type_analisis[$key]->foto_2;
            $analisis_type_analisis[$key]->deskripsi_1 = $conto_type_analisis[$key]->deskripsi_1;
            $analisis_type_analisis[$key]->deskripsi_2 = $conto_type_analisis[$key]->deskripsi_2;
            $analisis_type_analisis[$key]->d_mikroskopis = $conto_type_analisis[$key]->d_mikroskopis;
            $analisis_type_analisis[$key]->komposisi = $conto_type_analisis[$key]->komposisi;
        }

        $analisis_conto = $this->conto_m->by_analisis($analisis->id);

        $data = array(
            'title'                     => 'Conto Fisika | ' . $conto->nomor_conto,
            'main_content'              => 'conto/detail_conto_fisika_v',
            'nomor_analisis'            => $analisis->nomor_analisis,
            'conto'                     => $conto,
            'analisis'                  => $analisis,
            'analisis_conto'            => $analisis_conto,
            'analisis_type_analisis'    => $analisis_type_analisis

        );

        $this->load->view('template', $data);
    }

    /**
     * @param $id_conto
     */
    public function analisis($id_conto)
    {
        $conto = $this->conto_m->find($id_conto);
        $analisis = $this->analisis_m->find($conto->id_analisis);
        $is_fisika = $this->is_fisika($analisis->id_lab) ? TRUE : FALSE;
        if($is_fisika)
        {
            redirect('conto/detail_fisika/' . $id_conto);
        }

        $analisis_parameter = $this->analisis_m->parameter($analisis->id);
        $conto_parameter = $this->conto_m->parameter($conto->id);

        $this->load->model('parameter_m');
        foreach($analisis_parameter as $key => $row_parameter)
        {
            $parameter = $this->parameter_m->find($row_parameter->id_parameter);

            $analisis_parameter[$key]->nama = $parameter->nama;
            $analisis_parameter[$key]->id_parameter_conto = $conto_parameter[$key]->id;
            $analisis_parameter[$key]->nilai = $conto_parameter[$key]->nilai;
            $analisis_parameter[$key]->deskripsi = $conto_parameter[$key]->deskripsi;
        }

        $analisis_conto = $this->conto_m->by_analisis($analisis->id);

        $data = array(
            'title'                 => 'Conto | '.$id_conto,
            'main_content'          => 'conto/form_isi/kimia',
            'nomor_analisis'        => $analisis->nomor_analisis,
            'conto'                 => $conto,
            'analisis'              => $analisis,
            'analisis_conto'        => $analisis_conto,
            'analisis_parameter'    => $analisis_parameter

        );

        $this->load->view('template', $data);
    }

    /**
     * Insert Conto
     */
    public function insert()
    {
        $id_analisis = $this->input->post('id');
        $analisis = $this->analisis_m->find($id_analisis);
        $count_conto = $this->conto_m->count_conto_by_analisis($id_analisis);

        // if count conto in conto parameter is less than jumlah conto in analisis then insert new conto
        if($count_conto < $analisis->jumlah_conto)
        {
            $nomor_conto = !$this->conto_m->new_nomor_conto_by_analisis($id_analisis) ? $analisis->nomor_analisis : $this->conto_m->new_nomor_conto_by_analisis($id_analisis);
            $input = array(
                'nomor_conto'    => $nomor_conto,
                'id_analisis'    => $id_analisis
            );

            $insert = $this->conto_m->insert($input);

            if($this->is_fisika($analisis->id_lab))
            {
                $input = array(
                    'id_conto'          => $insert,
                    'id_type_analisis'  => NULL
                );

                $this->conto_m->insert_detail_fisika($input);
            }
            else
            {
                $analisis_parameter = $this->analisis_m->parameter($id_analisis);
                $this->conto_m->insert_batch_parameter($insert, $analisis_parameter);
            }
        }

        redirect('analisis/detail/' . $id_analisis);
    }

    /**
     *  Update Nilai on conto parameter
     */
    public function update_parameter()
    {
        $this->load->library('form_validation');
        $this->form_validation->set_rules('nilai', 'Nilai', 'required|trim|numeric|xss_clean');

        if($this->form_validation->run())
        {
            $this->conto_m->update_parameter($this->input->post());
            echo 1;
        }
        else
        {
            echo 0;
        }
    }
}
