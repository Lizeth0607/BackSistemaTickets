<?php

require_once '../config/ConnectionDB.php';
require_once '../config/Model.php';

class Empleado extends Model {

    protected $table = "empleados";
    protected $primaryKey = "id";

}