<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Posts extends CI_Controller{

	public function __construct(){

		header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
        $method = $_SERVER['REQUEST_METHOD'];
        if($method == "OPTIONS") {
          die();
      }
      parent::__construct();
      $this->load->model('PostsModel'); //Loads the model
	}


	public function post() {
        $post = json_decode(file_get_contents('php://input'), true)['post']; //$this->input->post('user');
        //$this->load->model('MemberModel'); //Loads the model
        $data['data'] = $this->PostsModel->insertPosts($post); //executes function from model returns rexcord set
        $this->load->view('PostsView', $data); //directs and passes data from the databse to the view
    }

	public function comment() {
        //add comment to post
         $comment = json_decode(file_get_contents('php://input'), true)['comment'];
         $data['data'] = $this->PostsModel->insertComment($comment);
         $this->load->view('PostsView', $data);
	}

	public function getAllPostsByUser(){
		//qury all users posts
		
		
	}

}