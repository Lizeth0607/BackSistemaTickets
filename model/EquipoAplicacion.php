<?php

require_once '../config/ConnectionDB.php';
require_once '../config/Model.php';

class EquipoAplicacion extends Model {

    protected $table = "equipo_aplicacion";
    protected $primaryKey = "id";

}