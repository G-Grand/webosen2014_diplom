<?php
namespace Entity;

class Roadrout extends AbstractEntity
{
    public $id;
    public $driverid;
    public $start;
    public $finish;
    public $terms;
    public $autoid;
    public $freeseats;
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
            'finish' => array(
                'type' => 'string',
                'size' => 255,
                'nullable' => false
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
            'startdate' => array(
                'type' => 'date'
            ),
            'timetrip' => array(
                'type' => 'time'
            ),
            'status' => array(
                'type' => 'string',
                'size' => 20,
                'nullable' => false
            ),
        );
    }
}
