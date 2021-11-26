<?php

require_once '../config/ConnectionDB.php';
require_once '../config/Model.php';

class Asignacion extends Model {

    protected $table = "view_asignacion";
    protected $primaryKey = "id";

}