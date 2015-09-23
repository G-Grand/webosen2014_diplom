<?php
namespace Entity;

class Access extends AbstractEntity
{
    public $id;
    public $descr;

    public function _construct()
    {
        self::$_dataTypes = array(
            'id' => array(
                'type' => 'int',
                'nullable' => false
            ),
            'descr' => array(
                'type' => 'string',
                'size' => 255,
                'nullable' => false
            )
        );
    }
}