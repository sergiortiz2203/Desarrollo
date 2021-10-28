<?php namespace DAO;

use Models\Role as Role;

interface IroleDAO
{
    function Add(Role $role);
    function GetAll();
}