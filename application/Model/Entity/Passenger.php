<?php
namespace Entity;

class Passenger extends AbstractEntity
{
    public $rdroutid;
    public $userid;

    public function _construct()
    {
        self::$_dataTypes = array(
            'rdroutid' => array(
                'type' => 'string',
                'size' => 15,
                'nullable' => false
            ),
            'userid' => array(
                'type' => 'string',
                'size' => 100,
                'nullable' => false
            ),
        );
    }
}