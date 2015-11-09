<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/26/13
 * Time: 10:07 AM
 */
class Permohonan_m extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function by_time($from, $to)
    {
        return $this->db->join('pemohon', 'analisis.id_pemohon = pemohon.id_pemohon')
            ->join('laboratorium', 'analisis.id_lab = laboratorium.id_lab')
            ->select('analisis.*, pemohon.nama as nama_pemohon, laboratorium.nama as lab')
            ->where('DATE(created_date) >=', $from)
            ->where('DATE(created_date) <=', $to)
            ->get('analisis')
            ->result();
    }

    public function set_cancel($input)
    {
        $data = [
            'is_cancel' => 1
        ];

        return $this->db->where('id', $input['id'])->update('analisis', $data);
    }

    public function unset_cancel($input)
    {
        $data = [
            'is_cancel' => 0
        ];

        return $this->db->where('id', $input['id'])->update('analisis', $data);
    }

    public function update_nomor_sertifikat($input)
    {
        $data = [
            'nomor_sertifikat' => $input['nomor_sertifikat']
        ];

        return $this->db->where('id', $input['id'])->update('analisis', $data);
    }

    public function update_tanggal_analisis($input)
    {
        $data = [
            'tanggal_analisis' => $input['tanggal_analisis']
        ];

        return $this->db->where('id', $input['id'])->update('analisis', $data);
    }

    public function update_tanggal_publish($input)
    {
        $data = [
            'tanggal_publish' => $input['tanggal_publish']
        ];

        return $this->db->where('id', $input['id'])->update('analisis', $data);
    }

    public function update_estimasi_date($input)
    {
        $data = [
            'estimasi_date' => $input['estimasi_date']
        ];

        return $this->db->where('id', $input['id'])->update('analisis', $data);
    }

    public function update_logo_kan($input)
    {
        $data = [
            'logo_kan'  => empty($input['logo_kan']) ? 0 : 1
        ];

        return $this->db->where('id', $input['id'])->update('analisis', $data);
    }
}
