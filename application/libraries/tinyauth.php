<?php
/**
 * Created by tinyauth.php.
 * User: phi314
 */
class Tinyauth
{
    var $CI = NULL;
    var $_valid = NULL;

    public function __construct()
    {
        $this->CI =& get_instance();
        $this->CI->load->library('form_validation');
        $this->CI->load->model(array('pemohon_m','petugas_m'));

        $this->_valid = $this->CI->form_validation;
    }

    public function login()
    {
        $config = array(
            array(
                'field' => 'username',
                'label' => 'Username',
                'rules' => 'trim|required|xss_clean'
            ),
            array(
                'field' => 'password',
                'label' => 'Password',
                'rules' => 'trim|required'
            )
        );

        $this->_valid->set_rules($config);

        if( $this->_valid->run('login') )
        {
            $login = array(
                'user'      => $this->CI->input->post('username'),
                'pass'      => $this->CI->input->post('password'),
                'user_type' => $this->CI->input->post('type_user')
            );

            if($this->_validate_login($login))
            {
                if($login['user_type'] == '1')
                {
                    redirect('permohonan');
                }
                else
                {
                    if( in_array($this->CI->session->userdata('komoditi'), ['tu', 'pw']))
                    {
                        redirect('permohonan');
                    }
                    else
                    {
                        redirect('analisis');
                    }
                }
            }
            else
            {
                set_flashdata('Kombinasi Username dan Password Anda salah.', 'danger');
                redirect('login');
            }
        }
        else
        {
            set_flashdata(validation_errors(), 'danger');
            $this->CI->load->view('login_v');
        }
    }

    private function _validate_login($login = NULL)
    {
        $this->CI->load->helper('array');
        if( !isset($login) && !is_array($login) )
        {
            return FALSE;
        }

        if( count($login) != 3 )
        {
            return FALSE;
        }

        $cek_login = $this->CI->petugas_m->cek_login($login['user'], sha1($login['pass']));

        if($cek_login)
        {
            $petugas = $this->CI->petugas_m->find_by_username($login['user']);
            $this->CI->session->set_userdata('logged_user', $login['user']);
            $this->CI->session->set_userdata('logged_name', $petugas->nama);
            $this->CI->session->set_userdata('komoditi', $petugas->id_komoditi);
            $this->CI->session->set_userdata('logged_id', $petugas->id_petugas);
            $this->CI->session->set_userdata('user_type', 2);
        }
        else
        {
            return FALSE;
        }
    }

    public function is_admin()
    {
        $username = $this->CI->session->userdata('logged_user');
        if($this->CI->petugas_m->is_admin($username))
            return TRUE;
        else
            return FALSE;
    }

    public function is_kepala()
    {
        $username = $this->CI->session->userdata('logged_user');
        if($username == 'kapus' OR $username == 'keplab' OR $username == 'sartek')
            return TRUE;
        else
            return FALSE;
    }

    public function logged_in()
    {
        if( !$this->CI->session->userdata('logged_user') )
        {
            return FALSE;
        }
        else
        {
            return TRUE;
        }
    }

    public function redirect_page()
    {
        if(in_array($this->CI->session->userdata('komoditi'), ['tu', 'pw']))
        {
            redirect('permohonan');
        }
        elseif($this->CI->session->userdata('komoditi') == 'pp')
        {
            redirect('preparasi');
        }
        else
        {
            redirect('analisis');
        }
    }

    public function logout()
    {
        $this->CI->petugas_m->logout($this->CI->session->userdata('logged_id'));
        $this->CI->session->sess_destroy();
        redirect('home');
    }

}
