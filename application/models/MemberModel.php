<?php

class MemberModel extends CI_Model {

    function registerUser($register) {
        $json_reg = $register; // json_decode($register);

        $qr = 'INSERT INTO users (username, password, email) VALUES ("' . $json_reg['username'] . '", "' . $json_reg['password'] . '", "' . $json_reg['email'] . '")';

        $rs = $this->db->query($qr);

        //this is the same as inser_id in php
        $id = $this->db->insert_id();

        if ($rs) {
            return $this->getProfile($id);
        } else {
            return http_response_code(500);
        }
    }

    function loginUser($user) {
        $json_user = $user; //json_decode($user);
        $query = "SELECT id FROM users WHERE username = '" . $json_user['username'] . "' AND password = '" . $json_user['password'] . "'";
        $rs = $this->db->query($query);
        $id = $rs->row();
        if ($id) {
            return $this->getProfile($id->id);
        }
    }

    public function getData($returnNum) {
        $query = 'SELECT p.content "post", p.create_time "time", u.username "user", mc.colour "colour" FROM posts p, users u, mood_colours mc WHERE p.users_id = u.id AND p.mood_colours_id = mc.id ORDER BY p.create_time DESC LIMIT ' . $returnNum;
        $rs = $this->db->query($query); //gets the data from the table
        return json_encode($rs->result_array());
    }

    public function updateProfile($user) {

        $query = "UPDATE users SET photo_url= " . $user['photo_url'] . " ,dob = " . $user['dob'] .
                " ,description= " . $user['description'] . " ,gender=" . $user['gender'] .
                ", status= " . $user['description'] . ",country=" . $user['country'] . ",region" .
                $user['description'] . ",city=" . $user['description'] . ",zip_code=" . $user['description'] .
                "mood_colours_id=" . $user['description'] . " WHERE sessionid = " . $user['sessionid'];
        $rs = $this->db->query($query); //gets the data from the table
        return json_encode($rs->result_array());
    }

    private function getProfile($id) {
        $qry = 'SELECT dob, description, gender, status, country, region, city,zip_code, photo_url FROM users WHERE id = ' . $id;
        $userInfo = $this->db->query($qry);
        $user = $userInfo->result_array();
        return json_encode($user);
    }

}

/*
 *
 * 
 * 
 * 
 * creat sessionid and insert into database and check ajax for session 
 * 
 */