<?php namespace Controllers;

use Models\Career as Career;
use DAO\CareerDAO as CareerDAO;

class CareerController
{
    private $careerDAO;

    public function __construct()
    {
        $this->careerDAO = new CareerDAO;        
    }

    public function index()
    {
        $this->careerDAO->GetJson();
        $this->showIndexView();
    }

    public function showIndexView()
    {
        require_once VIEWS_PATH . "index.php";
    }

}
