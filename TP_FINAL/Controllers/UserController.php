<?php namespace Controllers;

use Models\User as User;
use DAO\UserDAO as UserDAO;

class UserController
{
    private $userDAO;

    public function __construct()
    {
        $this->userDAO = new UserDAO;        
    }

    public function index()
    {
        $this->userDAO->GetJson();
        $this->showIndexView();
    }

    public function showIndexView()
    {
        require_once VIEWS_PATH . "index.php";
    }
}