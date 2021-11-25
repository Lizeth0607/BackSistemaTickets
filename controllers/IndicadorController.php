<?php

require_once '../config/ConnectionDB.php';
require_once '../config/Controller.php';
require_once '../model/Indicador.php';

class IndicadorController extends Controller {

    public function index() {
        $indicador = new Indicador();
        $resp = $indicador->all();
        $this->responseJson($resp);
    }

    public function show($id) {
        $indicador = new Indicador();
        $resp = $indicador->find($id);
        $this->responseJson($resp);
    }

    public function store() {
        $indicador = new Indicador();
        $resp = $indicador->insert([
            'nombre' => $_POST['nombre'],
            'descripcion' => $_POST['descripcion']
        ]);
        $this->responseJson($resp);
    }

    public function update($id){
        $indicador = new Indicador();
        $resp = $indicador->update($id, [
            'nombre' => $_POST['nombre'],
            'descripcion' => $_POST['descripcion']
        ]);
        $this->responseJson($resp);
    }

    public function destroy($id) {
        $indicador = new Indicador();
        $resp = $indicador->delete($id);
        $this->responseJson($resp);
    }
    
}