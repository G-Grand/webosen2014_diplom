<?php

class QueryConditionMember {
    public $field;
    public $value;
    public $operator;
    public $clause;

    function __construct($field, $value, $operator = "", $clause = "")
    {
        $this->clause = $clause;
        $this->operator = $operator;
        $this->field = $field;
        $this->value = $value;
    }
}