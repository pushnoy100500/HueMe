<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Member extends CI_Controller {

    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     * 		http://example.com/index.php/welcome
     * 	- or -
     * 		http://example.com/index.php/welcome/index
     * 	- or -
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see https://codeigniter.com/user_guide/general/urls.html
     */
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

    public function post($post) {
        //add post to db
        //json_decode($post)
        //data user, text, colour,
    }

    public function comment($post_id, $comment) {
        //add comment to post
    }

}
