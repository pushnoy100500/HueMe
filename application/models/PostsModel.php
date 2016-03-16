<?php

class PostsModel extends CI_Model{

	public function getPosts($returnNum){
        //$query = "SELECT * FROM posts  ORDER BY create_time  DESC LIMIT " . $returnNum;
		$query = 'SELECT p.content "post", p.create_time "time", u.username "user", mc.colour "colour" FROM posts p, users u, mood_colours mc WHERE p.users_id = u.id AND p.mood_colours_id = mc.id ORDER BY p.create_time DESC LIMIT ' . $returnNum;
        $rs = $this->db->query($query); //gets the data from the table
        return json_encode($rs->result_array());
        //return $rs->result_array();
    }

    public function insertPosts($post){
    	$userId = $this->getUserIdByEmail($post['email']);
		$qry = "INSERT INTO posts (users_id, mood_colours_id, tags, content) VALUES (" .
		$userId[0]['id'] . ", " . $post['mood_colours_id'] . ", '" . $post['tags'] .  
		"', '" . $post['content'] . "')"; 
		$rtn = $this->db->query($qry);
		$id = $this->db->insert_id();
		return json_encode($id);
	}

	public function insertComment($comment){
		$userId = $this->getUserIdByEmail($comment['email']);
		$qry = "INSERT INTO comments (users_id, posts_id, content) VALUES (" .
		$userId[0]['id'] . ", " . $comment['postId'] .  ", '" . $comment['content'] . "')"; 
		$rtn = $this->db->query($qry);
		$id = $this->db->insert_id();
		return json_encode($id);
	}

	//New 
	public function getPostsByColour($colour){
		//$query = "SELECT * FROM posts WHERE  ORDER BY create_time  DESC LIMIT " . $returnNum;
		$query = 'SELECT p.content "post", p.create_time "time", u.username "user", mc.colour "colour" FROM posts p, users u, mood_colours mc WHERE p.users_id = u.id AND p.mood_colours_id = mc.id AND p.mood_colours_id = "' . $colour . '" ORDER BY p.create_time DESC';
        $rs = $this->db->query($query); //gets the data from the table
        return json_encode($rs->result_array());

	}
		//New
	public function getPostsByUserId($id){
		$query = 'SELECT p.content "post", p.create_time "time", u.username "user", mc.colour "colour" FROM posts p, users u, mood_colours mc WHERE p.users_id = u.id AND p.mood_colours_id = mc.id AND p.users_id = "' . $id . '" ORDER BY p.create_time DESC';
        $rs = $this->db->query($query); //gets the data from the table
        return json_encode($rs->result_array());
	}



	//New
	public function getPostsByTen($startIndex){
		$query = 'SELECT p.content "post", p.create_time "time", u.username "username", mc.colour "colour" FROM posts p, users u, mood_colours mc WHERE p.users_id = u.id AND p.mood_colours_id = mc.id  ORDER BY p.create_time DESC LIMIT ' . $startIndex . ', 10 ';
        $rs = $this->db->query($query); //gets the data from the table
        return json_encode($rs->result_array());
	}

	private function getUserIdByEmail($email){		
		$qry = "SELECT id FROM users WHERE email = '" . $email . "'";
		$id = $this->db->query($qry);
		$row = $id->result_array();
	     return $row; //) ? "true" : "false");        
	    }

	}