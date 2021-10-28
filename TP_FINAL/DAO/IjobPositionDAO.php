<?php namespace DAO;

use Models\JobPosition as JobPosition;

interface IjobPositionDAO
{
    function Add(JobPosition $jobPosition);
    function GetAll();
}