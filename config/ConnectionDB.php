<?php

class Connection {

    private $host;
    private $user;
    private $password;
    private $db;
    private $port;

    private $connection;

    public function __construct($db, $host = 'localhost', $port = 3306, $user = 'root', $password = ''){
        $this->db = $db;
        $this->user = $user;
        $this->password = $password;
        $this->host = $host;
        $this->port = $port;
    }

    public function connect(){
        $this->connection = mysqli_connect(
            $this->host,
            $this->user,
            $this->password,
            $this->db,
            $this->port
        );
        $this->connection->set_charset("utf8mb4");
        if(mysqli_connect_errno()){
            print("Error al conectar en $this->db");
        }
        return $this->connection;
    }

    public function close(){
        $this->connection = null;
    }
}