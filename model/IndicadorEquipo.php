<?php

require_once '../config/ConnectionDB.php';
require_once '../config/Model.php';

class IndicadorEquipo extends Model {

    protected $table = "indicador_equipo";
    protected $primaryKey = "id";

}