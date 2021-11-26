<?php

require_once '../config/Controller.php';
require_once '../model/Asignacion.php';

class AsignacionController extends Controller {

    public function index() {
        $asignacion = new Asignacion();
        $resp = $asignacion->all();
        $this->responseJson($resp);
    }

}