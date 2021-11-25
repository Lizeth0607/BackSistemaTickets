<?php

abstract class Controller {

    public function responseJson($data, $code = 200){
        header('Content-Type: application/json');
        http_response_code($code);
        echo json_encode($data);
    }

    public function view($view){
        $path = explode(".", $view);
        $path = join('/', $path);
        require_once '../views/'.$path.'.php';
    }

}