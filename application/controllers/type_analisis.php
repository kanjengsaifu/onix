<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 11/23/13
 * Time: 9:58 AM
 */
class Type_analisis extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $model = array(
            'type_analisis_m',
            'parameter_m',
            'metoda_m'
        );
        $this->load->model($model);
    }

    public function index()
    {
        $type_analisis  = $this->type_analisis_m->all();
        $data = array(
            'title'         => 'Type Analisis',
            'main_content'  => 'type_analisis/type_analisis_v',
            'type_analisis' => $type_analisis
        );

        $this->load->view('template', $data);
    }

    public function detail($id_type_analisis)
    {
        $this->load->model('lab_m');

        // initialize
        $type_analisis = $this->type_analisis_m->find($id_type_analisis);
        $parameter = $this->parameter_m->by_type_analisis($type_analisis->id_type);
        $lab = $this->lab_m->find($type_analisis->id_lab);
        $type_analisis->laboratorium = $lab;

        $data = array(
            'title'         => $type_analisis->nama,
            'main_content'  => 'type_analisis/detail_type_analisis_v',
            'parameter'     => $parameter,
            'type_analisis' => $type_analisis,
            'lab'           => $lab
        );

        $this->load->view('template', $data);
    }

    public function update_harga()
    {
        $this->load->library('form_validation');

        $this->form_validation->set_rules('harga', 'Harga Type Analisis', 'required|trim|integer|xss_clean');
        $this->form_validation->set_rules('id_type_analisis', 'ID Type Analisis', 'required|trim|xss_clean');

        if($this->form_validation->run())
        {
            $this->type_analisis_m->update_harga($this->input->post());
            set_flashdata('Berhasil Update Harga Type Analisis', 'success', 'fa fa-check');
        }
        else
        {
            set_flashdata(validation_errors());
        }

        redirect('type_analisis/detail/'.$this->input->post('id_type_analisis'));
    }



    function jumlah_harga()
    {
        $harga_param_minimal = 0;
        $parameter_dipakai = $this->input->post('param');
        $jumlah = $this->input->post('jumlah') == '' ? 0 : $this->input->post('jumlah');

        $harga_param = 0;

        if(empty($parameter_dipakai))
        {
            $harga_param = 0;
        }
        else
        {
//            foreach($parameter_dipakai as $param)
//            {
//                $detail_param = $this->parameter_m->detail_parameter($param);
//                $harga_param = $harga_param + $detail_param->harga;
//
//            }

            if(count($parameter_dipakai) <= 4)
            {
                $harga_param_minimal = rupiah(600000*$jumlah);
            }
            else
            {
                // parameter tidak di hitung
                $jumlah_param = count($parameter_dipakai);
                for($p = 0; $p <= ($jumlah_param - 5); $p++)
                {
                    $detail_param = $this->parameter_m->detail_parameter($parameter_dipakai[$p]);
                    $harga_param = $harga_param + $detail_param->harga;
                }

                $harga_param_minimal = 600000*$jumlah;

                //jika harga lebih kecil dari jumlah harga parameter minimal maka har
//                $harga_param_minimal = $harga_param + $harga_param_minimal;

                $total = ($harga_param*$jumlah) + $harga_param_minimal;

                $harga_param_minimal = $total;

                $harga_param_minimal = rupiah($harga_param_minimal);

            }

        }

        echo json_encode(array('harga' => $harga_param_minimal));
    }

    public function metoda_parameter($id_parameter)
    {
        $parameter = $this->parameter_m->detail_parameter($id_parameter);
        $id_lab = substr($id_parameter,0,3);

        $metoda = $this->metoda_m->metoda_by_lab($id_lab);
        $message = '';


        $this->form_validation->set_rules('metoda', 'Metoda', 'required');

        if($this->form_validation->run() !== FALSE)
        {
            $metoda = $this->input->post('metoda');
            $this->parameter_m->simpan_metoda($id_parameter, $metoda);
            redirect('parameter/type_analisis/'.$parameter->id_type);
        }
        else
        {

            // jika metoda sudah digunakan default checklis
            $metoda_digunakan = $this->parameter_m->metoda_digunakan($id_parameter);
            $metoda_parameter = array(); // hanya idnya saja
            foreach($metoda_digunakan as $metoda_row):
                array_push($metoda_parameter, $metoda_row->id_metoda);
            endforeach;

            $data = array(
                'title'         => 'Ubah Metoda',
                'main_content'  => 'metoda_parameter_v',
                'id_parameter'     => $parameter->id_parameter,
                'nama'          => $parameter->nama,
                'id_type'       => $parameter->id_type,
                'metoda'        => $metoda,
                'metoda_digunakan'       => $metoda_parameter
            );

            $this->load->view('template', $data);
        }

    }

}
