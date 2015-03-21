<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/18/13
 * Time: 6:07 PM
 */
class Sertifikat extends PS_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model(array('pemohon_m','lab_m','lokasi_m','type_analisis_m','analisis_m','parameter_m', 'type_pemohon_m'));
    }

    public function cetak_sertifikat($id)
    {
        $this->load->library('fpdf');

        $analisis = $this->analisis_m->find($id);
        $pemohon = $this->pemohon_m->find($analisis->id_pemohon);
        $type_pemohon = $this->type_pemohon_m->find($pemohon->id_type_pemohon);
        $analisis->nama_lokasi = $this->lokasi_m->detail_by_kabupaten($analisis->lokasi, TRUE);

        if($this->_is_pihak_luar($pemohon->id_type_pemohon))
        {
            $pemohon->nama_sertifikat = $pemohon->nama;
        }
        else
        {
            $pemohon->nama_sertifikat = 'Kp. '.$type_pemohon->nama;
            $pemohon->alamat = 'PSDG';
        }

        $data = array(
            'title'             => 'Cetak ' . $analisis->nomor_analisis,
            'analisis'          => $analisis,
            'pemohon'           => $pemohon
        );

        $this->load->view('sertifikat/sertifikat_v', $data);
    }

    public function cetak_conto($id_analisis, $type_analisis, $id_conto)
    {
        $this->load->library('pdf');
        $this->load->helper('labs_helper');

        /*
         * Keterangan Detail
         */

        $analisis = $this->analisis_m->get_detail_analisis($id_analisis);
        $conto = $this->analisis_m->get_detail_conto($id_conto);
        $uji_parameter = $this->analisis_m->get_param_by_id_conto($id_conto, $type_analisis);
        $list_conto = $this->analisis_m->get_conto_by_no_analisis($id_analisis);
        $parameter = $this->parameter_m->get_param_by_type($type_analisis);


        $provinsi = $this->lokasi_m->nama_prov_by_id_kab($analisis->lokasi);


        $data = array(
            'id_conto'          => $id_conto,
            'id_analisis'       => $id_analisis,
            'nomor_analisis'    => $analisis->nomor_analisis,
            'hasil_analisis'    => $analisis,
            'conto'             => $conto,
            'uji_parameter'     => $uji_parameter,
            'list_conto'        => $list_conto,
            'parameter'         => $parameter,
            'jumlah_conto'      => $analisis->jumlah_contoh,
            'jenis_conto'       => $analisis->jenis_contoh,
            'id_pemohon'        => $analisis->id_pemohon,
            'kode_conto'        => $analisis->kode_conto,
            'lokasi'            => $analisis->nama_lokasi,
            'provinsi'          => $provinsi,
            'id_lab'            => substr($id_analisis, 5, 3)
        );

        $is_fisika = substr($id_analisis, 5, 1) == 'f' ? TRUE : FALSE;
//        if($is_fisika == TRUE)
//            $type_analisis = 'fmbrt';

        $this->load->view('sertifikat/type/'.strtolower($type_analisis),$data);

    }

}
