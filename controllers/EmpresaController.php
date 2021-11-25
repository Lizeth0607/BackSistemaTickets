<?php

require '../model/Empresa.php';
require_once '../config/Controller.php';

class EmpresaController extends Controller {

    public function index(){
        $empresa = new Empresa();
        $result = $empresa->all();
        $this->responseJson($result);
    }

    public function show($id){
        $empresa = new Empresa();
        $result = $empresa->find($id);
        $this->responseJson($result);
    }

    public function store(){
        $empresa = new Empresa();
        $resp = $empresa->insert([
            'nombre' => $_POST['nombre']
        ]);
        $this->responseJson($resp);
    }

    public function update($id){
        $empresa = new Empresa();
        $resp = $empresa->update($id, [
            'nombre' => $_POST['nombre'],
        ]);
        $this->responseJson($resp);
    }

    public function destroy($id){
        $empresa = new Empresa();
        $resp = $empresa->delete($id);
        $this->responseJson($resp);
    }

}