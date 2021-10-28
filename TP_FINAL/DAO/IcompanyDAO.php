<?php namespace DAO;

use Models\Company as Company;

interface IcompanyDAO
{
    function Add(Company $company);
    function GetAll();
}