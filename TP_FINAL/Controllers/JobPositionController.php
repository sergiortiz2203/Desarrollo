<?php namespace Controllers;

use DAO\JobPositionDAO as JobPositionDAO;
use Models\JobPosition as JobPosition;

class JobPositionController
{
    private $jobPositionDAO;

    public function __construct()
    {
        $this->jobPositionDAO = new JobPositionDAO;        
    }

    public function index()
    {
        $this->jobPositionDAO->GetJson();

        $this->showIndexView();
    }

 

    public function showIndexView()
    {
        require_once VIEWS_PATH . "index.php";
    }
}