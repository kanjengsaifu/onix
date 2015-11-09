<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Conto extends PS_Controller
{
    var $analisis;
    var $conto;
    var $type_analisis_nilai = array('fmbbj', 'fmbdk');
    var $type_analisis_deskripsi = array('fmbab', 'fmbmb', 'fmbmn', 'fmbpb');
    var $id_type_analisis;


    public function __construct()
    {
        parent::__construct();
        $this->load->model(array(
            'conto_m',
            'analisis_m',
            'metoda_m'
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

        $this->load->model(['parameter_m', 'type_analisis_m']);
        $analisis_type_analisis = $this->analisis_m->type_analisis($analisis->id);

        foreach($analisis_type_analisis as $key => $row_type_analisis)
        {
            $type_analisis = $this->type_analisis_m->find($row_type_analisis->id_type_analisis);
            $parameter = $this->conto_m->parameter_by_type_analisis($conto->id, $type_analisis->id);
            $analisis_type_analisis[$key]->nama = $type_analisis->nama;
            $analisis_type_analisis[$key]->parameter = $parameter;

        }

        $data = array(
            'title'                 => 'Conto Kimia | ' . $conto->nomor_conto,
            'main_content'          => 'conto/detail_conto_kimia_v',
            'nomor_analisis'        => $analisis->nomor_analisis,
            'conto'                 => $conto,
            'analisis'              => $analisis,
            'analisis_type_analisis'=> $analisis_type_analisis

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
        $conto_detail_fisika = $this->conto_m->type_analisis($conto->id);

        $this->load->model('type_analisis_m');
        foreach($conto_detail_fisika as $key => $row_type_analisis)
        {
            $type_analisis = $this->type_analisis_m->find($row_type_analisis->id_type_analisis);
            $conto_detail_fisika[$key]->nama = $type_analisis->nama;
        }

        $analisis_conto = $this->conto_m->by_analisis($analisis->id);

        $data = array(
            'title'                     => 'Conto Fisika | ' . $conto->nomor_conto,
            'main_content'              => 'conto/detail_conto_fisika_v',
            'nomor_analisis'            => $analisis->nomor_analisis,
            'conto'                     => $conto,
            'analisis'                  => $analisis,
            'analisis_conto'            => $analisis_conto,
            'conto_detail_fisika'       => $conto_detail_fisika

        );

        $this->load->view('template', $data);
    }

    public function update_kode_conto()
    {
        $this->conto_m->update_kode_conto($this->input->post());
        echo 1;
    }

    /**
     * @param $id_conto
     * @param bool $id_conto_detail_fisika
     */
    public function analisis($id_conto, $id_conto_detail_fisika = FALSE)
    {
        $conto = $this->conto_m->find($id_conto);
        $analisis = $this->analisis_m->find($conto->id_analisis);
        $is_fisika = $this->is_fisika($analisis->id_lab) ? TRUE : FALSE;

        $this->conto = $conto;
        $this->analisis = $analisis;

        if($is_fisika)
        {
            $this->_analisis_fisika($id_conto_detail_fisika);
        }
        else
        {
            $this->_analisis_kimia($id_conto);
        }
    }

    private function _analisis_fisika($id_detail_conto_fisika)
    {
        $this->load->model(['type_analisis_m', 'reference_m']);
        $conto_detail_fisika = $this->conto_m->find_detail_conto_fisika($id_detail_conto_fisika);
        $type_analisis = $this->type_analisis_m->find($conto_detail_fisika->id_type_analisis);

        if (!file_exists(APPPATH."views/conto/form_isi/fisika/$type_analisis->id_type_analisis.php"))
        {
            redirect('conto/detail/' . $this->conto->id);
            exit;
        }

        $minerals = $this->reference_m->all('mineral');

        $nilai = (array) json_decode($conto_detail_fisika->nilai);
        $is_empty_nilai = empty($nilai) ? TRUE : FALSE;

        $data = array(
            'title'                 => 'Conto | '.$this->conto->id,
            'main_content'          => 'conto/form_isi/fisika',
            'nomor_analisis'        => $this->analisis->nomor_analisis,
            'analisis'              => $this->analisis,
            'conto'                 => $this->conto,
            'conto_detail_fisika'   => $conto_detail_fisika,
            'type_analisis'         => $type_analisis,
            'minerals'              => $minerals,
            'nilai'                 => $nilai,
            'is_empty_nilai'        => $is_empty_nilai
        );

        $this->load->view('template', $data);
    }
    private function _analisis_kimia($id_conto)
    {
        $conto = $this->conto;
        $analisis = $this->analisis;

        $analisis_parameter = $this->analisis_m->parameter($analisis->id);
        $conto_parameter = $this->conto_m->parameter($conto->id);

        $this->load->model('parameter_m');
        foreach($analisis_parameter as $key => $row_parameter)
        {
            $parameter = $this->parameter_m->find_type_analisis_parameter($row_parameter->id_type_analisis_parameter);

            $analisis_parameter[$key]->nama = $parameter->nama_parameter;
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
    public function insert($id_analisis)
    {
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
                $analisis_type_analisis = $this->analisis_m->type_analisis($id_analisis);
                $this->conto_m->insert_batch_type_analisis($insert, $analisis_type_analisis);
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

    public function update_nilai_fisika()
    {
        $this->conto_m->update_nilai_fisika($this->input->post());
        redirect('conto/analisis/' . $this->input->post('id_conto') . '/' . $this->input->post('id'));
    }

    public function set_selesai()
    {
        $input = $this->input->post();
        $input['value'] = TRUE;
        $this->conto_m->set_selesai($input);

        redirect('conto/detail/' . $this->input->post('id'));
    }

    public function set_unselesai()
    {
        $input = $this->input->post();
        $input['value'] = FALSE;
        $this->conto_m->set_selesai($input);

        redirect('conto/detail/' . $this->input->post('id'));
    }

    /**
     * Create all conto by much conto
     */
    public function insert_batch()
    {
        $id_analisis = $this->input->post('id');
        $analisis = $this->analisis_m->find($id_analisis);

        for($i=1; $i<=$analisis->jumlah_conto; $i++)
        {
            $nomor_conto = !$this->conto_m->new_nomor_conto_by_analisis($id_analisis) ? $analisis->nomor_analisis : $this->conto_m->new_nomor_conto_by_analisis($id_analisis);
            $input = array(
                'nomor_conto'    => $nomor_conto,
                'id_analisis'    => $id_analisis
            );

            $insert = $this->conto_m->insert($input);

            if($this->is_fisika($analisis->id_lab))
            {
                $analisis_type_analisis = $this->analisis_m->type_analisis($id_analisis);
                $this->conto_m->insert_batch_type_analisis($insert, $analisis_type_analisis);
            }
            else
            {
                $analisis_parameter = $this->analisis_m->parameter($id_analisis);
                $this->conto_m->insert_batch_parameter($insert, $analisis_parameter);
            }
        }

        redirect('permohonan/conto/'.$id_analisis);
    }
}
