<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Member extends CI_Controller {

public function __construct(){
    parent::__construct();
}

    public function index() {
        $this->load->model('MemberModel'); //Loads the model
        $data['data'] = $this->MemberModel->getData(3); //executes function from model returns rexcord set
        sleep(2);
        $this->load->view('MemberView', $data); //directs and passes data from the databse to the view
    }

    public function register() {
        $user = $this->input->post('user');
        //$mem = json_decode($member);
        $this->load->model('MemberModel'); //Loads the model
        $data['data'] = $this->MemberModel->registerUser($user); //executes function from model returns rexcord set
        $this->load->view('MemberView', $data); //directs and //passes data from the databse to the view
    }

    public function login() {
        $user = $this->input->post('user');
        $this->load->model('MemberModel'); //Loads the model
        $data['data'] = $this->MemberModel->loginUser($user); //executes function from model returns rexcord set
        $this->load->view('MemberView', $data); //directs and passes data from the databse to the view
    }

    public function updateProfile() {
        $user = $this->input->post('user');
        $this->load->model('MemberModel'); //Loads the model
        $data['data'] = $this->MemberModel->updateProfile($user); //executes function from model returns rexcord set
        $this->load->view('MemberView', $data); //directs and passes data from the databse to the view
    }

}
