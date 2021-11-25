<?php

// require_once '../config/ConnectionDB.php';

function getParams(){
    $params = array();
    foreach($_GET as $key => $param){
        if($key != 'controller' && $key != 'action'){
            $params[$key] = $param;
        }
    }
    return $params;
}

if($_GET['controller'] && $_GET['action']){
    $controller = ucfirst($_GET['controller'])."Controller";
    $action = $_GET['action'];
    require "../Controllers/$controller.php";
    $controller = new $controller();
    call_user_func_array(array($controller, $action), getParams());
}

// echo $_GET['id'];