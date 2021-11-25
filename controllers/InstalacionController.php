<?php

require_once '../config/Controller.php';
require_once '../model/EquipoAplicacion.php';
require_once '../model/Equipo.php';
require_once '../model/Aplicacion.php';

class InstalacionController extends Controller {

    public function index(){
        $instalacion = new EquipoAplicacion();
        $resp = $instalacion->all();
        $this->responseJson($resp);
    }

    public function show($id) {
        $instalacion = new EquipoAplicacion();
        $resp = $instalacion->find($id);
        $this->responseJson($resp);
    }

    public function store() {
        $instalacion = new EquipoAplicacion();
        $equipo = new Equipo();
        $equipo_id = $equipo->findOrCreate(['estacion' => $_POST['estacion']])['id'];
        $aplicacion = new Aplicacion();
        $aplicacion_id = $aplicacion->findOrCreate(['nombre' => $_POST['aplicacion']])['id'];
        $resp = $instalacion->insert([
            'equipo_id' => $equipo_id,
            'aplicacion_id' => $aplicacion_id,
            'fecha_instalacion' => $_POST['instalacion']
        ]);
        $this->responseJson($resp);
    }

    public function update($id) {
        $instalacion = new EquipoAplicacion();
        $equipo = new Equipo();
        $equipo_id = $equipo->findOrCreate(['estacion' => $_POST['estacion']])['id'];
        $aplicacion = new Aplicacion();
        $aplicacion_id = $aplicacion->findOrCreate(['nombre' => $_POST['aplicacion']])['id'];
        $resp = $instalacion->update($id, [
            'equipo_id' => $equipo_id,
            'aplicacion_id' => $aplicacion_id,
            'fecha_instalacion' => $_POST['instalacion']
        ]);
        $this->responseJson($resp);
    }

    public function destroy($id){
        $instalacion = new EquipoAplicacion();
        $resp = $instalacion->delete($id);
        $this->responseJson($resp);
    }

}