<?php

require_once '../config/Controller.php';
require_once '../model/Empleado.php';

class EmpleadoController extends Controller {

    public function index() {
        $empleados = new Empleado();
        $resp = $empleados->getData("
            SELECT
                empleados.id,
                CONCAT(empleados.nombre,' ', empleados.apellidos) AS empleado,
                empleados.puesto,
                empleados.area,
                equipos.num_serie AS `S/N`,
                equipos.detalles,
                equipos.compra
            FROM empleados
            LEFT JOIN equipos ON empleados.equipo_id = equipos.num_serie;
        ");
        $this->responseJson($resp);
    }

    public function show($id) {
        $empleados = new Empleado();
        $resp = $empleados->getSingleData("
            SELECT
                empleados.id,
                CONCAT(empleados.nombre,' ', empleados.apellidos) AS empleado,
                empleados.puesto,
                empleados.area,
                equipos.num_serie AS `S/N`,
                equipos.detalles,
                equipos.compra
            FROM empleados
            LEFT JOIN equipos ON empleados.equipo_id = equipos.num_serie
            WHERE empleados.id = $id;
        ");
        $this->responseJson($resp);
    }

    public function store() {
        $empleados = new Empleado();
        $resp = $empleados->insert([
            'id' => $_POST['num_empleado'],
            'nombre' => $_POST['nombre'],
            'apellidos' => $_POST['apellidos'],
            'puesto' => $_POST['puesto'],
            'area' => $_POST['area'],
            'equipo_id' => array_key_exists('equipo', $_POST) ? $_POST['equipo'] : 'NULL'
        ]);
        $this->responseJson($resp);
    }

    public function update($id) {
        $empleados = new Empleado();
        $resp = $empleados->update($id, [
            'id' => $_POST['num_empleado'],
            'nombre' => $_POST['nombre'],
            'apellidos' => $_POST['apellidos'],
            'puesto' => $_POST['puesto'],
            'area' => $_POST['area'],
            'equipo_id' => array_key_exists('equipo', $_POST) ? $_POST['equipo'] : 'NULL'
        ]);
        $this->responseJson($resp);
    }

    public function destroy($id) {
        $empleados = new Empleado();
        $resp = $empleados->delete($id);
        $this->responseJson($resp);
    }

}