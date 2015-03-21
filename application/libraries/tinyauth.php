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
                    if($this->CI->session->userdata('komoditi') == 'tu')
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
                set_flashdata('Kombinasi Username dan Password Anda salah.');
                redirect('login');
            }
        }
        else
        {
            set_flashdata(validation_errors());
            $this->CI->load->view('login_v');
        }
    }

    public function login_kepala()
    {
        if( $this->_valid->run('login'))
        {
            $login = array(
                'user'      => $this->CI->input->post('username'),
                'pass'      => $this->CI->input->post('password'),
                'user_type' => '2'
            );

            if($this->_validate_login($login))
            {
                redirect('permohonan');
            }
            else
            {
                redirect('kepala');
            }
        }
        else
        {
            $data = array(
                'title' => 'Laboratorium Pusat Sumber Daya Geologi',
                'main_content'  => 'login_kepala_v'
            );

            $this->CI->load->view('template', $data);
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

        // validating login pemohon
        if($login['user_type'] == 1)
        {
            $cek_login = $this->CI->pemohon_m->cek_login($login['user'], sha1($login['pass']));
            if($cek_login)
            {
                $login_cek = TRUE;
                $user_type = '1';
            }
            else
                return FALSE;
        }

        // validation login petugas
        elseif($login['user_type'] == 2)
        {
            $cek_login = $this->CI->petugas_m->cek_login($login['user'], sha1($login['pass']));

            if($cek_login)
            {
                $login_cek = TRUE;
                $user_type = '2';
            }
            else
            {
                return FALSE;
            }
        }
        else
        {
            return FALSE;
        }

        if( $login_cek )
        {
            if($user_type == '1')
            {
                $id_user = $this->CI->pemohon_m->get_id_by_user($login['user']);
                $this->CI->session->set_userdata('logged_user', $login['user']);
                $this->CI->session->set_userdata('id_user', $id_user);
            }
            else
            {
                $petugas = $this->CI->petugas_m->find_by_username($login['user']);
                $this->CI->session->set_userdata('logged_user', $login['user']);
                $this->CI->session->set_userdata('komoditi', $petugas->id_komoditi);
                $this->CI->session->set_userdata('logged_id', $petugas->id_petugas);

            }

            $this->CI->session->set_userdata('user_type', $user_type);
            return TRUE;
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
        if( $this->CI->session->userdata('logged_user') == '' )
        {
            return FALSE;
        }
        else
        {
            return TRUE;
        }
    }

    public function logout()
    {
        $this->CI->session->sess_destroy();
        redirect('home');
    }

}
