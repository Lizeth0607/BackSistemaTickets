<?php

require_once '../config/Controller.php';
require_once '../model/Equipo.php';
require_once '../model/Empresa.php';
require_once '../model/Tipo.php';

class EquipoController extends Controller {

    public function index() {
        $equipo = new Equipo();
        $resp = $equipo
            ->getData("
                SELECT 
                    equipos.*,
                    tipos.nombre AS tipo,
                    empresas.nombre AS empresa
                FROM equipos
                INNER JOIN tipos ON equipos.tipo_id = tipos.id
                INNER JOIN empresas ON equipos.empresa_id = empresas.id
            ");
        $this->responseJson($resp);
    }

    public function show ($id){
        $equipo = new Equipo();
        $resp = $equipo
            ->getSingleData("
                SELECT
                    equipos.*,
                    tipos.nombre AS tipo,
                    empresas.nombre AS empresa
                FROM equipos
                INNER JOIN tipos ON equipos.tipo_id = tipos.id
                INNER JOIN empresas ON equipos.empresa_id = empresas.id
                WHERE num_serie = $id
            ");
        $this->responseJson($resp);
    }

    public function store(){
        $empresa = new Empresa();
        //$empresa_id = $empresa->findOrCreate(['nombre' => $_POST['empresa']])['id'];
        $tipo = new Tipo();
        //$tipo_id = $tipo->findOrCreate(['nombre' => $_POST['tipo']])['id'];
        $equipo = new Equipo();
        $resp = $equipo->insert([
	'num_serie' => $_POST['num_serie'],
            'estacion' => $_POST['estacion'],
            'detalles' => $_POST['detalle'],
            'compra' => $_POST['compra'],
            'can_install' => $_POST['install'],
            'tipo_id' => $_POST['tipo_id'],
            'empresa_id' => $_POST['empresa_id']
        ]);
        $this->responseJson($resp);
    }

    public function update($id){
        $empresa = new Empresa();
        $empresa_id = $empresa->findOrCreate(['nombre' => $_POST['empresa']])['id'];
        $tipo = new Tipo();
        $tipo_id = $tipo->findOrCreate(['nombre' => $_POST['tipo']])['id'];
        $equipo = new Equipo();
        $resp = $equipo->update($id, [
            'estacion' => $_POST['estacion'],
            'detalles' => $_POST['detalle'],
            'compra' => $_POST['compra'],
            'can_install' => $_POST['install'],
            'tipo_id' => $tipo_id,
            'empresa_id' => $empresa_id
        ]);
        $this->responseJson($resp);
    }

    public function destroy($num_serie){
        $equipo = new Equipo();
        $resp = $equipo->delete($num_serie);
        $this->responseJson($resp);
    }

}