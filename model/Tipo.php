<?php

require_once '../config/ConnectionDB.php';
require_once '../config/Model.php';

class Tipo extends Model {

    protected $table = "tipos";
    protected $primaryKey = "id";

}