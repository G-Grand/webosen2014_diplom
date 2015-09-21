<?php
namespace Entity;

class Car extends AbstractEntity
{
    public $regnumber;
    public $userid;
    public $brand;
    public $model;
    public $color;
    public $seats;
    public $photo;
    public $fuelrate;

    public function _construct()
    {
        self::$_dataTypes = array(
            'regnumber' => array(
                'type' => 'string',
                'size' => 20,
                'nullable' => false
            ),
            'userid' => array(
                'type' => 'string',
                'size' => 100,
                'nullable' => false
            ),
            'brand' => array(
                'type' => 'string',
                'size' => 50
            ),
            'model' => array(
                'type' => 'string',
                'size' => 50
            ),
            'color' => array(
                'type' => 'string',
                'size' => 100
            ),
            'seats' => array(
                'type' => 'int',
                'nullable' => false
            ),
            'photo' => array(
                'type' => 'string',
                'size' => 255
            ),
            'fuelrate' => array(
                'type' => 'decimal'
            ),
        );
    }
}
