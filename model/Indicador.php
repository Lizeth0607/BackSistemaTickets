<?php

require_once '../config/Model.php';
require_once '../model/Indicador.php';

class Indicador extends Model {

    protected $table = 'indicadores';
    protected $primaryKey = 'id';

}