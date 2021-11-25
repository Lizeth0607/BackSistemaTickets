<?php 

require_once '../config/Controller.php';
require_once '../model/Aplicacion.php';

class AplicacionController extends Controller {

    public function index() {
        $app = new Aplicacion();
        $resp = $app->all();
        $this->responseJson($resp);
    }

    public function show($id) {
        $app = new Aplicacion();
        $resp = $app->find($id);
        $this->responseJson($resp);
    }

    public function store() {
        $app = new Aplicacion();
        $resp = $app->insert([
            'nombre' => $_POST['nombre'],
            'version' => $_POST['version'],
            'fecha_compra' => $_POST['compra']
        ]);
        $this->responseJson($resp);
    }

    public function update($id) {
        $app = new Aplicacion();
        $resp = $app->update($id, [
            'nombre' => $_POST['nombre'],
            'version' => $_POST['version'],
            'fecha_compra' => $_POST['compra']
        ]);
        $this->responseJson($resp);
    }

    public function destroy($id) {
        $app = new Aplicacion();
        $resp = $app->delete($id);
        $this->responseJson($resp);
    }

}