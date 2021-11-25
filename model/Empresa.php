<?php

require_once '../config/ConnectionDB.php';
require_once '../config/Model.php';

class Empresa extends Model {
    
    protected $table = "empresas";
    protected $primaryKey = "id";

}