<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Landingpage extends CI_Controller
{
    public function index()
    {
        $data['title'] = 'Home';
        $this->load->view('templates/pembeli/header', $data);
        $this->load->view('templates/pembeli/navbar', $data);
        $this->load->view('pembeli/index', $data);
        $this->load->view('templates/pembeli/footer', $data);
    }
}
