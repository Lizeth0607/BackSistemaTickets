<?php

require_once '../config/Controller.php';
require_once '../model/IndicadorEquipo.php';
require_once '../model/Equipo.php';
require_once '../model/Indicador.php';

class TicketController extends Controller {

    public function index() {
        $ticket = new IndicadorEquipo();
        $resp = $ticket->getData("
            SELECT
                indicador_equipo.*,
                equipos.estacion,
                indicadores.nombre AS kpi
            FROM indicador_equipo
            INNER JOIN equipos ON equipos.num_serie = indicador_equipo.equipo_id
            INNER JOIN indicadores ON indicadores.id = indicador_equipo.indicador_id");
        $this->responseJson($resp);
    }

    public function show($id) {
        $ticket = new IndicadorEquipo();
        $resp = $ticket->getSingleData("
            SELECT
                indicador_equipo.*,
                equipos.estacion,
                indicadores.nombre AS kpi
            FROM indicador_equipo
            INNER JOIN equipos ON equipos.num_serie = indicador_equipo.equipo_id
            INNER JOIN indicadores ON indicadores.id = indicador_equipo.indicador_id
            // WHERE indicador_equipo.id = $id");
        $this->responseJson($resp);
    }

    public function store(){
        $ticket = new IndicadorEquipo();
        $equipo = new Equipo();
        $equipo_id = $equipo->findOrCreate(['estacion' => $_POST['estacion']])['id'];
        $indicador = new Indicador();
        $indicador_id = $indicador->findOrCreate(['nombre' => $_POST['kpi']])['id'];
        $resp = $ticket->insert([
            'equipo_id' => $equipo_id,
            'indicador_id' => $indicador_id,
            'problema' => $_POST['problema'],
            'acciones' => NULL,
            'estado' => $_POST['estado'],
            'fecha_inicio' => $_POST['inicio']
        ]);
        $this->responseJson($resp);
    }

    public function update($id) {
        $ticket = new IndicadorEquipo();
        $equipo = new Equipo();
        $equipo_id = $equipo->findOrCreate(['estacion' => $_POST['estacion']])['id'];
        $indicador = new Indicador();
        $indicador_id = $indicador->findOrCreate(['nombre' => $_POST['kpi']])['id'];
        $resp = $ticket->update($id, [
            'equipo_id' => $equipo_id,
            'indicador_id' => $indicador_id,
            'problema' => $_POST['problema'],
            'acciones' => NULL,
            'estado' => $_POST['estado'],
            'fecha_inicio' => $_POST['inicio']
        ]);
        $this->responseJson($resp);
    }

    public function destroy($id){
        $ticket = new IndicadorEquipo();
        $resp = $ticket->delete($id);
        $this->responseJson($resp);
    }

}