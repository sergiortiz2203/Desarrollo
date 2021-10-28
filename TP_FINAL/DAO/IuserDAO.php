<?php namespace DAO;

use Models\User as User;

interface IuserDAO
{
    function Add(User $user);
    function GetAll();
}