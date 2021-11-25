<?php

require_once '../config/ConnectionDB.php';
require_once '../config/Model.php';

class Aplicacion extends Model {

    protected $table = "aplicaciones";
    protected $primaryKey = "id";

}