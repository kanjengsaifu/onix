<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 4/16/15
 * Time: 12:39 PM
 */

class Prosedur {

    var $CI = NULL;
    var $id_prosedur = '';
    var $jumlah_conto = 0;
    var $kegiatan = [];
    var $array_kegiatan = [];
    var $array_waktu = [];
    var $jumlah_waktu = 0;
    var $jumlah_hari = 0;
    var $total_waktu = 0;

    /*
     * Estimasi
     */
    var $bulan = 0;
    var $hari = 0;
    var $jam = 0;
    var $menit = 0;
    var $detik = 0;

    public function __construct($params)
    {
        $this->CI =& get_instance();
        $this->CI->load->model(['prosedur_m', 'analisis_m']);

        $this->id_prosedur = $params['id_prosedur'];
        $this->jumlah_conto = $params['jumlah_conto'];

        $this->_set_kegiatan();
        $this->_set_waktu();
    }

    private function _set_kegiatan()
    {
        $kegiatan = $this->CI->prosedur_m->kegiatan($this->id_prosedur);
        if(!$kegiatan)
        {
            $kegiatan = $this->CI->prosedur_m->kegiatan(4);
        }
        $this->kegiatan = $kegiatan;
    }

    private function _set_waktu()
    {
        $this->_set_array_waktu();
        $this->_set_jumlah_waktu();
        $this->_set_jumlah_hari_by_conto();
        $this->_set_total_waktu();
        $this->set_estimasi_mdhis();
    }

    private function _set_array_waktu()
    {
        foreach($this->kegiatan as $row)
        {
            $data = [
                'waktu'             => $row->waktu,
                'is_perhari'        => $row->is_perhari,
                'jumlah_conto'      => $row->jumlah_conto,
                'hari'              => $row->hari
            ];

            $this->array_waktu[] = $data;
        }
    }

    /**
     * Waktu Dalam Menit
     * @return int
     */
    private function _set_jumlah_waktu()
    {
        $jumlah_waktu = 0;
        foreach($this->array_waktu as $row)
        {
            $jumlah_waktu += $row['waktu'];
        }

        $this->jumlah_waktu = strtotime("$jumlah_waktu minute", 0);
    }

    private function _set_jumlah_hari_by_conto()
    {
        $jumlah_hari = 0;

        foreach($this->array_waktu as $row)
        {
            if($row['is_perhari'])
            {
                $hari = $row['hari'];
                $jumlah_conto = $row['jumlah_conto'];

                $subtotal = ceil($this->jumlah_conto / $jumlah_conto);
                $jumlah_hari += $hari * $subtotal;
            }
        }
        $this->jumlah_hari = strtotime("$jumlah_hari day", 0);
    }

    /**
     * Estimasi selesai
     */
    private function _set_total_waktu()
    {
        $total_waktu = $this->jumlah_waktu + $this->jumlah_hari;

        $this->total_waktu = $total_waktu;
    }

    public function set_estimasi_mdhis()
    {
        $this->detik = $this->total_waktu % 60;
        $this->menit = floor(($this->total_waktu % 3600) / 60);
        $this->jam = floor(($this->total_waktu % 86400) / 3600);
        $this->hari = floor(($this->total_waktu % 2592000) / 86400);
        $this->bulan = floor($this->total_waktu / 2592000);
    }

    public function estimasi_array()
    {
        return [
            "bulan"     => $this->bulan,
            "hari"     => $this->hari,
            "jam"     => $this->jam,
            "menit"     => $this->menit,
            "detik"     => $this->detik
        ];
    }

    public function toString()
    {
        return "$this->bulan bulan, $this->hari hari, $this->jam jam, $this->menit menit, $this->detik detik";
    }

    public function estimasi_time()
    {
        return $this->total_waktu;
    }

    public function estimasi_date()
    {
        $estimasi_date = strtotime(now(). '+ 1 day') + $this->total_waktu;
        $estimasi_date = date('Y-m-d H:i:s', $estimasi_date);

        return $estimasi_date;
    }

    public function get_kegiatan()
    {
        return $this->kegiatan;
    }

    public function get_array_waktu()
    {
        return $this->array_waktu;
    }

    public function debug()
    {
        dump($this->total_waktu);
    }
}

class Estimasi extends Prosedur {

    var $total_estimasi_time_delay = 0;
    var $lab = '';

    public function __construct($params)
    {
        $this->CI =& get_instance();
        $this->CI->load->model(['prosedur_m', 'analisis_m']);

        $array_prosedur = $params[0];
        $jumlah_conto = $params[1];

        foreach($array_prosedur as $data)
        {
            $param = [
                'id_prosedur'   => $data,
                'jumlah_conto'  => $jumlah_conto
            ];

            $prosedur = new Prosedur($param);
            $this->array_waktu[] = $prosedur->estimasi_time();
        }
    }

    public function set_lab($id_lab)
    {
        $this->lab = $id_lab;
    }

    public function estimasi_delay_time()
    {
        $analisis = $this->CI->analisis_m->is_selesai($this->lab, 0);

        foreach($analisis as $row)
        {
            $this->total_estimasi_time_delay += $row->estimasi_time + $row->estimasi_time_delay;
        }

        return $this->total_estimasi_time_delay;
    }

    public function time()
    {
        $time = max($this->array_waktu); // waktu yang paling lama yang diambil
        $this->total_waktu = $time;
        $this->set_estimasi_mdhis();

        return $time;
    }
}

/**
 * Class Tracking
 */
class Tracking extends Prosedur {

    public function __construct()
    {
        $this->CI =& get_instance();
        $this->CI->load->model(['tracking_m']);
    }

    public function add_tracking($id_analisis, $id_kegiatan)
    {
        $data = [
            'id_analisis'                   => $id_analisis,
            'id_kegiatan'                   => $id_kegiatan
        ];

        $insert_analisis_tracking = $this->CI->tracking_m->insert($data);

        $this->CI->analisis_m->update_tracking([$id_analisis, $insert_analisis_tracking]);
    }

    public function add_tracking_khusus($id_analisis, $id_kegiatan)
    {
        $data = [
            'id_analisis'                   => $id_analisis,
            'id_kegiatan'                   => $id_kegiatan
        ];

        $this->CI->tracking_m->insert($data);
    }

    public function isset_tracking($id_analisis, $id_kegiatan)
    {
        return  $this->CI->tracking_m->isset_tracking($id_analisis, $id_kegiatan);

    }
}