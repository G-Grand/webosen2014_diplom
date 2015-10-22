<?php
namespace Entity;

class Roadrout extends AbstractEntity
{
    public $id;
    public $driverid;
    public $start;
    public $start_adress;
    public $finish;
    public $finish_adress;
    public $terms;
    public $autoid;
    public $freeseats;
    public $price;
    public $startdate;
    public $timetrip;
    public $status;

    public function _construct()
    {
        self::$_dataTypes = array(
            'id' => array(
                'type' => 'string',
                'size' => 15,
                'nullable' => false
            ),
            'driverid' => array(
                'type' => 'string',
                'size' => 100,
                'nullable' => false
            ),
            'start' => array(
                'type' => 'string',
                'size' => 255,
                'nullable' => false
            ),
            'start_adress' => array(
                'type' => 'string',
                'size' => 255
            ),
            'finish' => array(
                'type' => 'string',
                'size' => 255,
                'nullable' => false
            ),
            'finish_adress' => array(
                'type' => 'string',
                'size' => 255
            ),
            'terms' => array(
                'type' => 'string'
            ),
            'autoid' => array(
                'type' => 'string',
                'size' => 20,
                'nullable' => false
            ),
            'freeseats' => array(
                'type' => 'int'
            ),
            'price' => array(
                'type' => 'decimal'
            ),
            'startdate' => array(
                'type' => 'datetime'
            ),
            'timetrip' => array(
                'type' => 'datetime'
            ),
            'status' => array(
                'type' => 'string',
                'size' => 20,
                'nullable' => false
            ),
        );
    }
}
