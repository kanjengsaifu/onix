<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/18/13
 * Time: 5:59 AM
 */
class Permohonan extends Admin_controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model(
            array(
                'parameter_m',
                'pemohon_m',
                'analisis_m',
                'lab_m',
                'type_analisis_m',
                'lokasi_m',
                'metoda_m',
                'type_pemohon_m',
                'permohonan_m'
            )
        );
    }

    /**
     * get value from basis or metoda where there is parameter on it
     * @param array $parameter_option
     * @param array $parameter_input
     * @return array|bool|null
     */
    private function _parameter_option($parameter_option = array(), $parameter_input = array())
    {
        $parameter_option_array = array();

        if(!is_array($parameter_option))
        {
            return FALSE;
        }

        foreach($parameter_option as $row)
        {
            $explode = explode('|', $row);

            if(in_array($explode[0], $parameter_input))
            {
                $parameter_option_array[] = $row;
            }
        }

        return count($parameter_option_array) == 0 ? NULL : $parameter_option_array;
    }

    /**
     * @param $parameter
     * @return array
     */
    private function _set_parameter_array($parameter)
    {
        $parameter_array = array();

        foreach($parameter as $key => $row)
        {
            $parameter = $this->parameter_m->find_type_analisis_parameter($row);
            $type_analisis = $this->type_analisis_m->find($parameter->id_type_analisis);
            $array = array(
                'id_type_analisis_parameter'        => $parameter->id,
                'nama'                              => $parameter->nama_parameter,
                'id_type_analisis'                  => $type_analisis->id,
                'type_analisis'                     => $type_analisis->nama,
                'harga'                             => $parameter->harga,
                'harga_after'                       => $parameter->harga,
                'metoda'                            => null,
                'basis'                             => null
            );

            $parameter_array[] = $array;
        }


        return $parameter_array;
    }

    /**
     * @param $parameter
     * @return array
     */
    private function _set_type_analisis_array($parameter)
    {
        $type_analisis_array = array();

        foreach($parameter as $row)
        {
            $type_analisis = $this->type_analisis_m->find($row);
            $array = array(
                'id_type_analisis'  => $type_analisis->id,
                'nama'              => $type_analisis->nama,
                'harga'             => $type_analisis->harga,
                'harga_after'       => $type_analisis->harga
            );

            $type_analisis_array[] = $array;
        }

        return $type_analisis_array;
    }

    /**
     *  Adding to Session Permohonan
     */
    private function _set_session_permohonan()
    {
        $data = array(
            'id_pemohon'                => $this->session->userdata('pemohon')->id_pemohon,
            'type_pemohon'              => $this->session->userdata('pemohon')->id_type_pemohon,
            'id_lab'                    => $this->input->post('id_lab'),
            'id_komoditi'               => $this->input->post('id_komoditi'),
            'tanggal_terima'            => $this->input->post('tanggal_terima'),
            'jenis_conto'               => $this->input->post('jenis_contoh'),
            'jumlah_conto'              => $this->input->post('jumlah_contoh'),
            'provinsi'                  => $this->input->post('provinsi'),
            'lokasi'                    => $this->input->post('lokasi'),
            'preparasi'                 => $this->input->post('preparasi'),
        );

        if($this->is_fisika($data['id_lab']))
        {
            $parameter_array = $this->_set_type_analisis_array($this->input->post('param'));
        }
        else
        {
            $parameter_array = $this->_set_parameter_array($this->input->post('param'));
        }

        $data['parameter'] = $parameter_array;

        $nama_lokasi = $this->lokasi_m->detail_by_kabupaten($this->input->post('lokasi'), TRUE);
        $data['nama_lokasi']   = $nama_lokasi;

        $data = (object) $data;

        $this->session->set_userdata('permohonan', $data);
    }

    /**
     * if value is FALSE redirect to base
     * @param $value
     */
    private function _check_value($value)
    {
        if($value == FALSE)
        {
            redirect(base_url());
            exit;
        }
    }

    /**
     *  Permohonan
     */
    public function index()
    {
        $permohonan = $this->analisis_m->all();
        $permohonan_bulan_ini = $this->analisis_m->by_month(date('m'));
        $transaksi_bulan_ini = 0;

        foreach($permohonan_bulan_ini as $row)
        {
            $transaksi_bulan_ini += $row->biaya;
        }

        $data = array(
            'title'         => 'Permohonan',
            'main_content'  => 'permohonan/permohonan_v',
            'permohonan'    => $permohonan,
            'permohonan_bulan_ini'   => $permohonan_bulan_ini,
            'transaksi_bulan_ini'   => $transaksi_bulan_ini
        );

        $this->load->view('template',$data);
    }

    /**
     * @param $id_lab
     */
    public function daftar($id_lab)
    {
        $this->load->library('form_validation');

        if($this->form_validation->run('permohonan/tambah'))
        {
            $this->_set_session_permohonan();
            redirect('permohonan/preview');
        }
        else
        {
            $this->load->model('analisis_m');

            $lab = $this->lab_m->find($id_lab);
            $this->_check_value($lab);
            $is_fisika = $this->is_fisika($id_lab);

            $this->session->set_userdata('lab_pemohon', $id_lab);
            if(!$this->session->userdata('pemohon'))
            {
                redirect('permohonan/pemohon');
            }

            $pemohon = $this->session->userdata('pemohon');
            $provinsi = $this->lokasi_m->all_provinsi();
            $type_pemohon = $this->pemohon_m->get_all_type_pemohon();
            $page = 'daftar_permohonan_v';

            $type_analisis = $this->type_analisis_m->by_lab($id_lab);

            foreach($type_analisis as $key => $row_type_analisis)
            {
                $parameter = $this->type_analisis_m->parameter($row_type_analisis->id);
                $type_analisis[$key]->parameter = $parameter;
            }

            $page_parameter = $is_fisika ? 'fisika' : 'kimia';

            $js = array(

            );

            $data = array(
                'title'         => 'Daftar Permohonan',
                'main_content'  => 'permohonan/' . $page,
                'js'            => $js,
                'type_pemohon'  => $type_pemohon,
                'is_fisika'     => $is_fisika,
                'pemohon'       => $pemohon,
                'provinsi'      => $provinsi,
                'type_analisis' => $type_analisis,
                'lab'           => $lab,
                'page_parameter'=> $page_parameter
            );

            $this->load->view('template',$data);
        }
    }

    /**
     * Kegiatan 1
     * Penyerahan conto dan formulir analisis
     *
     * Inserting Analisis
     */
    public function insert()
    {
        if($this->session->userdata('permohonan'))
        {
            $this->load->model(array('analisis_m'));

            $input = (array) $this->session->userdata('permohonan');
            $input['biaya'] = $this->total_harga();
            $input['nomor_analisis'] = $this->analisis_m->new_nomor_analisis_by_type_pemohon($input['type_pemohon']);

            $insert = $this->analisis_m->insert($input);

            if($insert)
            {
                $permohonan = $this->analisis_m->find($insert);

                // loop parameter or type analisis
                foreach($input['parameter'] as $row)
                {
                    if($this->is_fisika($input['id_lab']))
                    {
                        $input_type_analisis = array(
                            'id_analisis'       => $insert,
                            'id_type_analisis'      => $row['id_type_analisis'],
                            'harga'             => $row['harga_after']
                        );
                        $this->analisis_m->insert_type_analisis($input_type_analisis);
                    }
                    else
                    {
                        $input_parameter = array(
                            'id_analisis'                       => $insert,
                            'id_type_analisis_parameter'        => $row['id_type_analisis_parameter'],
                            'harga'                             => $row['harga_after']
                        );
                        $this->analisis_m->insert_type_analisis_parameter($input_parameter);
                    }
                }

                /*
                 * loop to create type analisis and the unique it
                 */
                $array_type_analisis = [];
                foreach($input['parameter'] as $parameter)
                {
                    $array_type_analisis[] = $parameter['id_type_analisis'];
                }
                $array_type_analisis = array_unique($array_type_analisis);


                if(!$this->is_fisika($input['id_lab']))
                {
                    foreach($array_type_analisis as $row_type_analisis)
                    {
                        // if is kimia insert type analisis too
                        $this->analisis_m->insert_type_analisis([
                            'id_analisis'       => $insert,
                            'id_type_analisis'  => $row_type_analisis,
                            'harga'             => 0
                        ]);
                    }
                }

                // if preparasi is checked
                if(isset($input['preparasi']))
                {
                    $this->load->model('preparasi_m');
                    $input_preparasi = array(
                        'id_analisis'       => $insert
                    );
                    $this->preparasi_m->insert($input_preparasi);
                }

                // add Tracking
                $id_kegiatan = 1;
                $tracking = new Tracking();
                $tracking->add_tracking($insert, $id_kegiatan);

                // clearing input session
                $this->session->unset_userdata('pemohon');
                $this->session->unset_userdata('permohonan');

                $data = array(
                    'title'         => 'Permohonan Sukses',
                    'main_content'  => 'permohonan/success_v',
                    'id_analisis'   => $insert,
                    'nomor_analisis'=> $permohonan->nomor_analisis
                );

                $this->load->view('template', $data);
            }
            else
            {
                redirect('permohonan');
            }
        }
        else
        {
            redirect('permohonan');
        }
    }

    /**
     * @param $id_analisis
     */
    public function detail($id_analisis)
    {
        $this->load->model(array('analisis_m', 'prosedur_m', 'analisis_tracking_m', 'reference_m', 'conto_m', 'preparasi_m'));

        $array_type_analisis = [];
        $array_prosedur = [];

        $analisis = $this->analisis_m->find($id_analisis);

        if(!$analisis)
        {
            redirect('permohonan');
        }

        $pemohon = $this->pemohon_m->find($analisis->id_pemohon);
        $type_pemohon = $this->type_pemohon_m->find($pemohon->id_type_pemohon);
        $analisis->nama_lokasi = $this->lokasi_m->detail_by_kabupaten($analisis->lokasi, TRUE);
        $conto = $this->conto_m->by_analisis($id_analisis);

        $is_fisika = $this->is_fisika($analisis->id_lab);
        $laboratorium = $this->lab_m->find($analisis->id_lab);
        $analisis->laboratorium = $laboratorium->nama;

        if(!$this->_is_pihak_luar($pemohon->id_type_pemohon))
        {
            $pemohon->nama_sertifikat = 'Kp. '.$type_pemohon->nama;
            $pemohon->alamat = 'PSDG';
        }

        /*
         * Creating array type analisis for creating a prosedur kegiatan
         */
        if($is_fisika)
        {
            $type_analisis = $this->analisis_m->type_analisis($analisis->id);

            foreach($type_analisis as $row_type_analisis)
            {
                $array_type_analisis[] = $row_type_analisis->id_type_analisis;
            }
            $parameter = '';
        }
        else
        {
            $type_analisis = '';
            $analisis_parameter = $this->analisis_m->parameter($analisis->id);

            foreach($analisis_parameter as $row_parameter)
            {
                $type_analisis_parameter = $this->parameter_m->find_type_analisis_parameter($row_parameter->id_type_analisis_parameter);
                $type_analisis = $this->type_analisis_m->find($type_analisis_parameter->id_type_analisis);
                $array_type_analisis[] = $type_analisis->id;
            }
        }

        /*
         * Creating array prosedur to show kegiatan on each array
         */
        $array_type_analisis = array_unique($array_type_analisis);
        foreach($array_type_analisis as $key => $type_analisis)
        {
            $prosedur = $this->prosedur_m->find_by_type_analisis($type_analisis);
            $type_analisis = $this->type_analisis_m->find($prosedur->id_type_analisis);

            $id_prosedur = !$prosedur ? 4 : $prosedur->id;
            $kegiatan = $this->prosedur_m->kegiatan($id_prosedur);

            foreach($kegiatan as $key_kegiatan => $row_kegiatan)
            {
                $kelengkapan = $this->prosedur_m->kelengkapan_prosedur_kegiatan($row_kegiatan->id);
                $tracking = $this->analisis_tracking_m->by_analisis_and_kegiatan($analisis->id, $row_kegiatan->id_kegiatan);
                $petugas = !$tracking ? FALSE : $this->petugas_m->find($tracking->id_petugas);

                $kegiatan[$key_kegiatan]->tracking = $tracking;
                $kegiatan[$key_kegiatan]->petugas = $petugas;
                $kegiatan[$key_kegiatan]->kelengkapan = $kelengkapan;
                $kegiatan[$key_kegiatan]->task_status =  $tracking ? 'task-success' : 'task-info';
            }

            $array = [
                'id'            => $id_prosedur,
                'type_analisis' => $type_analisis,
                'kegiatan'      => $kegiatan
            ];

            $array_prosedur[] = $array;
        }

        $last_track = $this->analisis_tracking_m->find($analisis->id_analisis_tracking);
        $last_track->kegiatan = $this->reference_m->find_by_table_id('kegiatan', $last_track->id_kegiatan);
        $last_track->petugas = $this->petugas_m->find($last_track->id_petugas);

        $button_selesai = FALSE;
        if($last_track->id_kegiatan == 12)
        {
            $button_selesai = TRUE;
        }

        $status_string = 'Proses';
        if($analisis->is_selesai)
        {
            $status_string = 'Selesai';
        }
        elseif($analisis->is_cancel)
        {
            $status_string = 'Cancel';
        }

        $analisis_type_analisis = $this->analisis_m->type_analisis($id_analisis);
        foreach($analisis_type_analisis as $key => $row_analisis_type_analisis)
        {
            $type_analisis = $this->type_analisis_m->find($row_analisis_type_analisis->id_type_analisis);
            $analisis_type_analisis[$key]->nama_type_analisis = $type_analisis->nama;
        }

        $estimasi_time = ceil(($analisis->estimasi_time+$analisis->estimasi_time_delay)/ (60 * 60 * 24)); // day
        $estimasi_date = $analisis->estimasi_date;

        $preparasi = $this->preparasi_m->find($analisis->id);

        $data = array(
            'title'             => $analisis->nomor_analisis,
            'main_content'      => 'permohonan/detail_v',
            'id_analisis'       => $id_analisis,
            'analisis'          => $analisis,
            'pemohon'           => $pemohon,
            'is_fisika'         => $is_fisika,
            'conto'             => $conto,
            'prosedur'          => $array_prosedur,
            'last_track'        => $last_track,
            'button_selesai'    => $button_selesai,
            'status_string'     => $status_string,
            'analisis_type_analisis' => $analisis_type_analisis,
            'estimasi_selesai'          => $estimasi_time,
            'tanggal_estimasi_selesai' => $estimasi_date,
            'preparasi'         => $preparasi
        );

        $this->load->view('template',$data);
    }

    /**
     * Preview permohonan Data
     * if Fisika the parameter must be type analisis
     * eles the parameter contain a metoda
     */
    public function preview()
    {
        $this->load->model(array('lab_m', 'analisis_m', 'prosedur_m'));

        $permohonan = $this->session->userdata('permohonan');
        if(!$permohonan)
        {
            redirect('permohonan/daftar/' . $this->session->userdata('lab_pemohon'));
        }

        $pemohon = $this->session->userdata('pemohon');
        $nomor_analisis = $this->analisis_m->new_nomor_analisis_by_type_pemohon($pemohon->id_type_pemohon);
        $lab = $this->lab_m->find($permohonan->id_lab);
        $is_fisika = $this->is_fisika($lab->id_lab);

        $array_type_analisis = [];
        $array_prosedur = [];

        /*
         * loop to create type analisis and the unique it
         */
        foreach($permohonan->parameter as $parameter)
        {
            $array_type_analisis[] = $parameter['id_type_analisis'];
        }
        $array_type_analisis = array_unique($array_type_analisis);

        /*
         * Loop to create array prosedur
         */
        foreach($array_type_analisis as $type_analisis)
        {
            $prosedur = $this->prosedur_m->find_by_type_analisis($type_analisis);
            $array_prosedur[] = !$prosedur ? 4 : $prosedur->id;
        }


        $estimasi = new Estimasi([$array_prosedur, $permohonan->jumlah_conto]);
        $estimasi->set_lab($permohonan->id_lab);
        $estimasi_time = $estimasi->time();
        $estimasi_time_delay = $estimasi->estimasi_delay_time();
        $total_estimasi = $estimasi_time_delay + $estimasi_time;

        $estimasi_date = strtotime(now().' + 1 day') + $total_estimasi;
        $estimasi_date = date('Y-m-d H:i:s', $estimasi_date);

        $this->session->set_userdata('estimasi_time', $estimasi_time);
        $this->session->set_userdata('estimasi_time_delay', $estimasi_time_delay);
        $this->session->set_userdata('estimasi_date', $estimasi_date);

        $data = array(
            'title'         => 'Preview Permohonan',
            'main_content'  => 'permohonan/preview_v',
            'pemohon'       => $pemohon,
            'permohonan'    => $permohonan,
            'is_fisika'     => $is_fisika,
            'lab'           => $lab,
            'nomor_analisis'=> $nomor_analisis,
            'parameter'     => $permohonan->parameter,
            'estimasi_time' => $estimasi_time,
            'estimasi_text' => $estimasi->toString(),
            'estimasi_date' => $estimasi_date
        );

        $this->load->view('template', $data);
    }

    /**
     * @param $id
     */
    public function update($id)
    {
        $this->load->model(array('analisis_m'));

        $this->load->library('form_validation');

        $analisis  = $this->analisis_m->find($id);
        $pemohon = $this->pemohon_m->find($analisis->id_pemohon);
        $lokasi = $this->lokasi_m->detail_by_kabupaten($analisis->lokasi);
        $analisis->nama_lokasi = $this->lokasi_m->detail_by_kabupaten($analisis->lokasi, TRUE);

        // init select lokasi
        $provinsi = $this->lokasi_m->all_provinsi();
        $kabupaten = $this->lokasi_m->kabupaten_by_provinsi($lokasi->provinsi->id_provinsi);

        $data = array(
            'title'             => 'Update Permohonan',
            'main_content'      => 'permohonan/update_v',
            'id_analisis'       => $id,
            'analisis'          => $analisis,
            'pemohon'           => $pemohon,
            'provinsi'          => $provinsi,
            'kabupaten'         => $kabupaten,
            'lokasi'            => $lokasi
        );

        if($this->form_validation->run( 'permohonan/update' ))
        {
            $input = $this->input->post();
            $this->analisis_m->update($input);
            redirect('permohonan/detail/' . $id);
        }
        else
        {
            $this->load->view('template', $data);
        }
    }

    /**
     *  Choose Pemohon
     */
    public function pemohon()
    {
        $pemohon = $this->pemohon_m->all();

        $js = array(
            'datatables/jquery.dataTables.min'
        );

        $data = array(
            'title'         => "Pilih Pemohon",
            'main_content'  => 'permohonan/set_pemohon_v',
            'js'            => $js,
            'pemohon'       => $pemohon
        );

        $this->load->view('template', $data);
    }

    /**
     * @param $id_pemohon
     */
    public function set_pemohon($id_pemohon)
    {
        $pemohon = $this->pemohon_m->find($id_pemohon);
        $this->load->model('type_pemohon_m');
        $type_pemohon = $this->type_pemohon_m->find($pemohon->id_type_pemohon);

        $pemohon->type_pemohon = $type_pemohon;

        if(!$pemohon)
        {
            redirect('permohonan/pemohon');
        }

        $this->session->set_userdata('pemohon', $pemohon);

        redirect('permohonan/daftar/' . $this->session->userdata('lab_pemohon'));
    }

    /**
     * @return int
     */
    private function total_harga()
    {
        $total = 0;

        foreach($this->session->userdata('permohonan')->parameter as $row)
        {
            $total += $row['harga_after'];
        }

        return $total;
    }

    /**
     * Updating parameter price from Permohonan Session
     */
    public function update_harga_parameter_permohonan()
    {
        $total = 0;

        $permohonan = $this->session->userdata('permohonan');
        $permohonan->parameter[$this->input->post('rowid')]['harga_after'] = $this->input->post('harga');
        $this->session->set_userdata('permohonan', $permohonan);

        $json = array(
            'total'         => $this->total_harga(),
            'harga'         => $this->input->post('harga')
        );

        echo json_encode($json);
    }

    /**
     * Reseting parameter price from Permohonan Session
     */
    public function reset_harga_parameter_permohonan()
    {
        $total = 0;

        $permohonan = $this->session->userdata('permohonan');
        $permohonan->parameter[$this->input->post('rowid')]['harga_after'] = $permohonan->parameter[$this->input->post('rowid')]['harga'];
        $this->session->set_userdata('permohonan', $permohonan);

        $json = array(
            'total'         => $this->total_harga(),
            'harga'         => $permohonan->parameter[$this->input->post('rowid')]['harga_after']
        );

        echo json_encode($json);
    }

    /**
     *  Clearing Permohonan Session
     */
    public function reset()
    {
        $this->session->unset_userdata('pemohon');
        $this->session->unset_userdata('permohonan');
        redirect('permohonan/daftar/' . $this->session->userdata('lab_pemohon'));
    }

    public function success()
    {
        $data = array(
            'title'         => 'Permohonan Sukses',
            'main_content'  => 'permohonan/success_v',
            'id_analisis'   => '1',
            'nomor_analisis'=> '20130400001'
        );

        $this->load->view('template', $data);
    }

    public function selesai_analisis()
    {
        $id_analisis = $this->input->post('id');

        $tracking = new Tracking();
        $tracking->add_tracking($id_analisis, 13);

        $input = [
            'id'            => $id_analisis,
            'is_selesai'    => 1
        ];

        $this->analisis_m->set_selesai($input);

        redirect('permohonan/detail/' . $id_analisis);
    }

    public function search()
    {
        $this->load->model('permohonan_m');
        $from = $this->input->get('from');
        $to = $this->input->get('to');

        if(empty($from) && empty($to))
        {
            $permohonan = $this->analisis_m->all();
        }
        else
        {
            $permohonan = $this->permohonan_m->by_time($from, $to);
        }

        $data = [
            'title'         => 'Permohonan',
            'main_content'  => 'permohonan/search_v',
            'permohonan'    => $permohonan,
            'from'          => $from,
            'to'            => $to
        ];

        $this->load->view('template', $data);
    }

    public function export_excel()
    {
        $from = $this->input->get('from');
        $to = $this->input->get('to');
        $total_transaksi = 0;

        if(empty($from) && empty($to))
        {
            redirect('permohonan/search');
        }

        $permohonan = $this->permohonan_m->by_time($from, $to);

        foreach($permohonan as $row)
        {
            $total_transaksi += $row->biaya;
        }

        $data = [
            'title'         => 'Permohonan',
            'main_content'  => 'include/exporter/permohonan_excel_v',
            'permohonan'    => $permohonan,
            'from'          => $from,
            'to'            => $to,
            'total_transaksi'   => $total_transaksi
        ];

        $this->load->view('sertifikat/permohonan_excel_v', $data);
    }

    public function conto($id_analisis)
    {
        $this->load->model(['conto_m']);

        $permohonan = $this->analisis_m->find($id_analisis);
        $conto = $this->conto_m->by_analisis($id_analisis);
        $laboratorium = $this->lab_m->find($permohonan->id_lab);

        $is_fisika = $this->is_fisika($permohonan->id_lab);

        $data = [
            'title'             => 'Conto | '.$permohonan->nomor_analisis,
            'main_content'      => 'permohonan/conto_v',
            'permohonan'        => $permohonan,
            'conto'             => $conto,
            'is_fisika'         => $is_fisika,
            'laboratorium'      => $laboratorium
        ];

        $this->load->view('template', $data);
    }

    public function detail_conto_fisika($id_analisis)
    {
        $this->load->model(['conto_m']);

        $permohonan = $this->analisis_m->find($id_analisis);
        $conto = $this->conto_m->by_analisis($id_analisis);

        if(!empty($conto))
        {
            foreach($conto as $key => $row)
            {
                $conto[$key]->detail_fisika = $this->conto_m->detail_fisika_by_conto($row->id);
                foreach($conto[$key]->detail_fisika as $key_detail_fisika => $row_detail_fisika)
                {
                    $type_analisis = $this->type_analisis_m->find($row_detail_fisika->id_type_analisis);
                    $conto[$key]->detail_fisika[$key_detail_fisika]->export_excel = file_exists('application/views/sertifikat/conto_excel/excel_' . $type_analisis->id_type_analisis.'.php');
                }
            }
        }

        $type_analisis = $this->analisis_m->type_analisis($id_analisis);

        $data = [
            'title'             => 'Detail Conto Fisika | '.$permohonan->nomor_analisis,
            'main_content'      => 'permohonan/detail_conto_fisika_v',
            'permohonan'        => $permohonan,
            'type_analisis'     => $type_analisis,
            'conto'             => $conto
        ];

        $this->load->view('template', $data);
    }

    public function cancel_permohonan()
    {
        $this->permohonan_m->set_cancel($this->input->post());
        redirect('permohonan/detail/'. $this->input->post('id'));
    }

    public function reset_permohonan()
    {
        $this->permohonan_m->unset_cancel($this->input->post());
        redirect('permohonan/detail/'. $this->input->post('id'));
    }

    public function update_nomor_sertifikat()
    {
        $this->permohonan_m->update_nomor_sertifikat($this->input->post());
        redirect('permohonan/detail/'. $this->input->post('id'));
    }

    public function update_tanggal_analisis()
    {
        $this->permohonan_m->update_tanggal_analisis($this->input->post());
        redirect('permohonan/detail/'. $this->input->post('id'));
    }

    public function update_tanggal_publish()
    {
        $this->permohonan_m->update_tanggal_publish($this->input->post());
        redirect('permohonan/detail/'. $this->input->post('id'));
    }

    public function update_estimasi_date()
    {
        $this->permohonan_m->update_estimasi_date($this->input->post());
        redirect('permohonan/detail/'. $this->input->post('id'));
    }

    public function update_logo_kan()
    {
        $this->permohonan_m->update_logo_kan($this->input->post());
        redirect('permohonan/detail/'. $this->input->post('id'));
    }

}
