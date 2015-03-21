<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/18/13
 * Time: 2:55 AM
 */
class Home extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $data = array(
            'title' => 'Laboratorium Pusat Sumber Daya Geologi',
            'main_content'  => 'home_v'
        );

        $this->load->view('template', $data);
    }

    public function logout()
    {
        $this->tinyauth->logout();
    }

}
