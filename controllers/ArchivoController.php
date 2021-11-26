<?php

require_once '../config/Controller.php';
require_once '../model/Archivo.php';

class ArchivoController extends Controller {

    public function index() {
        $archivos = new Archivo();
        $resp = $archivos->all();
        $this->responseJson($resp);
    }

    public function show($id) {
        $archivo = new Archivo();
        $resp = $archivo->find($id);
        $this->responseJson($resp);
    }

    public function store() {
        $archivo = new Archivo();
        $resp = $archivo->insert([
            'nombre' => $_POST['nombre'],
            'link' => $_POST['link'],
            'descripcion' => $_POST['descripcion']
        ]);
        $this->responseJson($resp);
    }

    public function update($id){
        $archivo = new Archivo();
        $resp = $archivo->update($id, [
            'nombre' => $_POST['nombre'],
            'link' => $_POST['link'],
            'descripcion' => $_POST['descripcion']
        ]);
        $this->responseJson($resp);
    }

    public function destroy($id){
        $archivo = new Archivo();
        $resp = $archivo->delete($id);
        $this->responseJson($resp);
    }
}