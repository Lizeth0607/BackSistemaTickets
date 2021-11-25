<?php

abstract class Model {

    private $conn;
    private $cx;

    public function __construct(){
        $this->cx = new Connection('aplicacion');
        $this->conn = $this->cx->connect();
    }

    public function __destruct(){
        $this->cx->close();
    }

    public function all(){
        $data = array();
        $results = mysqli_query($this->conn, "SELECT * FROM $this->table");
        $error = mysqli_error($this->conn);
        if(empty($error)){
            if (mysqli_num_rows($results) > 0) {
                while ($row = mysqli_fetch_assoc($results)) {
                    array_push($data, $row);
                }
            }else{
                throw new Exception($error);
            }
        } 
        return $data;
    }

    public function find($id){
        $result = mysqli_query($this->conn, "SELECT * FROM $this->table WHERE $this->table.$this->primaryKey = $id");
        $error = mysqli_error($this->conn);
        if(empty($error)){
            return mysqli_fetch_assoc($result);
        }else{
            throw new Exception($error);
        }
        return null;
    }

    public function insert($data = array()){
        $fields = array();
        $vals = array();
        foreach ($data as $field => $value) {
            array_push($fields, $field);
            array_push($vals, "'".$value."'");
        }
        $query = "INSERT INTO $this->table (".join(', ', $fields).") VALUES (".join(', ', $vals).")";
        mysqli_query($this->conn, $query);
        $error = mysqli_error($this->conn);
        if(empty($error)){
            return [
                'lasted_id' => $this->conn->insert_id,
                'table' => $this->table
            ];
        }else{
            return ['error' => $error];
        }
    }

    public function update($id, $data = array()){
        $updated = array();
        foreach ($data as $field => $value) {
            $up = $field." = '".$value."'";
            array_push($updated, $up);
        }
        $query = "UPDATE $this->table SET ".join(", ", $updated)." WHERE $this->table.$this->primaryKey = $id";
        mysqli_query($this->conn, $query);
        $error = mysqli_error($this->conn);
        if(empty($error)){
            return [
                'affected' => $this->conn->affected_rows,
                'msg' => $this->conn->affected_rows > 0 ? "Updated ".$this->conn->affected_rows." rows" : "No record has been updated",
                'table' => $this->table
            ];
        }else{
            return ['error' => $error];
        }
    }

    public function delete($id){
        $query = sprintf("DELETE FROM $this->table WHERE $this->table.$this->primaryKey = %d", $id);
        mysqli_query($this->conn, $query);
        $error = mysqli_error($this->conn);
        if(empty($error)){
            return [
                'affected' => $this->conn->affected_rows,
                'msg' => ($this->conn->affected_rows > 0) ? "Deleted ".$this->conn->affected_rows." rows" : "No record has been deleted",
                'table' => $this->table
            ];
        }else{
            return ['error' => $error];
        }
    }

    public function findOrCreate($condition = array(), $data = array()){
        $where = array();
        foreach($condition as $key => $value){
            $cond = $key." = '".$value."'";
            array_push($where, $cond);
            $data[$key] = $value;
        }
        $query = "SELECT * FROM $this->table WHERE ".join(" AND ", $where);
        $result = mysqli_fetch_assoc(mysqli_query($this->conn, $query));
        if(is_null($result)){
            $this->insert($data);
            return [
                'msg' => "The last record inserted is ".$this->conn->insert_id,
                'id' => $this->conn->insert_id
            ];
        }else{
            return [
                'msg' => "The record already exists",
                'id' => $result[$this->primaryKey]
            ];
        }
    }

    public function getData($sql){
        $data = array();
        $results = mysqli_query($this->conn, $sql);
        $error = mysqli_error($this->conn);
        if(empty($error)){
            if (mysqli_num_rows($results) > 0) {
                while ($row = mysqli_fetch_assoc($results)) {
                    array_push($data, $row);
                }
            }else{
                throw new Exception($error);
            }
        } 
        return $data;
    }

    public function getSingleData($sql){
        $result = mysqli_query($this->conn, $sql);
        $error = mysqli_error($this->conn);
        if(empty($error)){
            return mysqli_fetch_assoc($result);
        }else{
            throw new Exception($error);
        }
        return null;
    }

}