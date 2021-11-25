<?php

require_once '../model/Tipo.php';
require_once '../config/Controller.php';

class TipoController extends Controller {

    public function index(){
        $tipo = new Tipo();
        $resp = $tipo->all();
        $this->responseJson($resp);
    }

    public function show($id){
        $tipo = new Tipo();
        $resp = $tipo->find($id);
        $this->responseJson($resp);
    }

    public function store(){
        $tipo = new Tipo();
        $resp = $tipo->insert([
            'nombre' => $_POST['nombre']
        ]);
        $this->responseJson($resp);
    }

    public function update($id){
        $tipo = new Tipo();
        $resp = $tipo->update($id, [
            'nombre' => $_POST['nombre']
        ]);
        $this->responseJson($resp);
    }

    public function destroy($id){
        $tipo = new Tipo();
        $resp = $tipo->delete($id);
        $this->responseJson($resp);
    }
}