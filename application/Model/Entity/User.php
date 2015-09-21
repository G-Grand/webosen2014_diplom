<?php
namespace Entity;

class User extends AbstractEntity
{
    public $email;
    public $userpassword;
    public $username;
    public $surname;
    public $phone;
    public $birthday;
    public $gendor;
    public $rate;
    public $photo;
    public $crdate;
    public $access;

    public function _construct()
    {
        self::$_dataTypes = array(
            'email' => array(
                'type' => 'string',
                'size' => 100,
                'nullable' => false
            ),
            'userpassword' => array(
                'type' => 'string',
                'size' => 100,
                'nullable' => false
            ),
            'username' => array(
                'type' => 'string',
                'size' => 100
            ),
            'surname' => array(
                'type' => 'string',
                'size' => 100
            ),
            'phone' => array(
                'type' => 'string',
                'size' => 200
            ),
            'birthday' => array(
                'type' => 'date'
            ),
            'gendor' => array(
                'type' => 'string',
                'size' => 1
            ),
            'rate' => array(
                'type' => 'int'
            ),
            'photo' => array(
                'type' => 'string',
                'size' => 200
            ),
            'crdate' => array(
                'type' => 'date',
                'nullable' => false
            ),
            'access' => array(
                'type' => 'string',
                'size' => 100,
                'nullable' => false
            ),
        );
    }
}