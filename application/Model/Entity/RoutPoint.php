<?php
namespace Entity;

class RoutPoint extends AbstractEntity
{
    public $roadroutid;
    public $point;
    public $pointqueue;

    public function _construct()
    {
        self::$_dataTypes = array(
            'roadroutid' => array(
                'type' => 'string',
                'size' => 15,
                'nullable' => false
            ),
            'point' => array(
                'type' => 'string',
                'size' => 255,
                'nullable' => false
            ),
            'pointqueue' => array(
                'type' => 'int',
                'nullable' => false
            )
        );
    }
}