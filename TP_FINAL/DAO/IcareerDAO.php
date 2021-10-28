<?php namespace DAO;

use Models\Career as Career;

interface IcareerDAO
{
    function Add(Career $career);
    function GetAll();
    
}