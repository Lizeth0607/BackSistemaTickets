<?php

require_once '../config/ConnectionDB.php';
require_once '../config/Model.php';

class Equipo extends Model {

    protected $table = "equipos";
    protected $primaryKey = "num_serie";

}