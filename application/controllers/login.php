<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/1/13
 * Time: 8:35 PM
 */
class Login extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        if(!$this->tinyauth->logged_in())
        {
            $this->tinyauth->login();
        }
        else
        {
            $this->tinyauth->redirect_page();
        }
    }

}
