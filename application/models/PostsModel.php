<?php

class Posts_Model extends CI_Model{
    
    public function getPosts($returnNum){
        //$query = "SELECT * FROM posts  ORDER BY create_time  DESC LIMIT " . $returnNum;
        $query = 'SELECT p.content "post", p.create_time "time", u.username "user", mc.colour "colour" FROM posts p, users u, mood_colours mc WHERE p.users_id = u.id AND p.mood_colours_id = mc.id ORDER BY p.create_time DESC LIMIT ' . $returnNum;
        $rs = $this->db->query($query); //gets the data from the table
       return json_encode($rs->result_array());
        //return $rs->result_array();
    }
}