<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Member extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	 
	 /*
	 MAKE SURE ALL FUNCTIONS RETURN JSON
	 */
	 
	public function index()
	{
	   echo "This is the memeber landing page, Must return JSON";
          
	}
	
	public function login()
	{
            echo "This is the memeber Login page, Must return JSON";
	}
	
	public function register()
	{
		echo "This is the memeber Register page, Must return JSON";
	}
	
	public function post()
	{
		echo "This is the memeber post page, Must return JSON";
	}
	
	public function comment()
	{
	}
}