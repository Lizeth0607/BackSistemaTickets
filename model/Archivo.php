<?php

require_once '../config/ConnectionDB.php';
require_once '../config/Model.php';

class Archivo extends Model {

    protected $table = "archivos";
    protected $primaryKey = "id";

}