<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/1/13
 * Time: 10:53 PM
 */
class Petugas_m extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function is_admin($username)
    {
        $result = FALSE;
        $q = $this->db->where('admin', 1)->where('username', $username)->get('petugas');
        if($q->num_rows() == 1)
        {
            $result = TRUE;
        }

        return $result;
    }

    public function all($with_info = FALSE)
    {
        $result = $this->db->get("petugas")->result();

        if($with_info)
        {
            $result = $this->db->select('petugas.*, komoditi.nama as komoditi')
                               ->join('komoditi', 'petugas.id_komoditi=komoditi.id_komoditi')
                               ->get('petugas')
                               ->result();
        }

        return $result;
    }

    public function find($id_petugas)
    {
        return $this->db->where('id_petugas', $id_petugas)->limit(1)->get('petugas')->row();
    }

    public function count_is_login()
    {
        return count($this->db->where('is_login', 1)->get('petugas')->result());
    }

    public function get_nama($val)
    {
        $data = FALSE;
        $q = $this->db->query("SELECT nama FROM pegawai WHERE id_pegawai='$val'");
        if($q->num_rows() > 0)
        {
            $result = $q->row();
            $data = $result->nama;
        }

        return $data;
    }

    public function get_detail_pegawai($id_pegawai)
    {
        $q = $this->db->query("SELECT id_pegawai, nama, id_komoditi FROM pegawai WHERE id_pegawai='$id_pegawai'");
        $result = FALSE;
        if($q->num_rows() > 0)
        {
            $result = $q->row();
        }

        return $result;
    }

    public function find_by_username($username)
    {
        return $this->db->where('username', $username)->get('petugas')->row();
    }

    public function get_nama_by_user($val)
    {
        $data = FALSE;
        $q = $this->db->where('username', $val)->select('nama')->get('petugas');
        if($q->num_rows() > 0)
        {
            $result = $q->row();
            $data = $result->nama;
        }

        return $data;
    }


    public function cek_login($username, $password)
    {
        $q = $this->db->select('id_petugas')
                        ->where('username', $username)
                        ->where('password', $password)
                        ->limit(1)
                        ->get('petugas');

        $result = FALSE;

        if($q->num_rows() == 1)
        {
            $petugas = $q->row();
            $result = TRUE;
            // set login petugas
            $this->db->where('id_petugas', $petugas->id_petugas)
                     ->set('is_login', 1)
                     ->set('last_login', now())
                     ->update('petugas');
        }

        return $result;
    }

    /**
     * @param $input
     * @return mixed
     */
    public function insert($input)
    {
        $nama = $this->input->post('nama');
        $komoditi = $this->input->post('komoditi');

        $username = strtoupper(str_replace(' ', '', substr($nama, 0, 4)).$komoditi).rand(10, 99);
        $key = hash('crc32', $username.date('YmdHis'));
        $password = sha1($key);

        $data = array(
            'nip'           => $input['nip'],
            'nama'          => $input['nama'],
            'telepon'       => $input['telepon'],
            'email'         => $input['email'],
            'id_komoditi'   => $input['id_komoditi'],
            'bagian'        => $input['bagian'],
            'username'      => $username,
            'password'      => $password,
            'pass_awal'     => $key,
            'created_date'  => now()
        );

        $this->db->insert("petugas", $data);

        return $this->db->insert_id();
    }

    /**
     * @param $input
     * @return mixed
     */
    public function update($input)
    {
        $data = array(
            'nip'           => $input['nip'],
            'nama'          => $input['nama'],
            'id_komoditi'   => $input['id_komoditi'],
            'telepon'       => $input['telepon'],
            'email'         => $input['email'],
            'bagian'        => $input['bagian']
        );

        return $this->db->where('id_petugas', $input['id_petugas'])->update('petugas', $data);
    }

    public function delete($id_petugas)
    {
        return $this->db->where('id_petugas', $id_petugas)->delete('petugas');
    }

    /**
     * @param $id
     */
    public function logout($id)
    {
        $this->db->set('is_login', FALSE)->where('id_petugas', $id)->update('petugas');
    }

    public function reset_password($id)
    {
        $key = hash('crc32', date('YmdHis'));
        $password = sha1($key);

        $data = [
            'password'          => $password,
            'pass_awal'         => $key
        ];

        $reset = $this->db->where('id_petugas', $id)->update('petugas', $data);

        if(!$reset)
        {
            return FALSE;
        }
        else
        {
            return $key;
        }
    }

}
