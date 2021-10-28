<?php

namespace Controllers;

use DAO\UserDAO as UserDAO;
use DAO\StudentDAO as StudentDAO;

class LoginController
{

    public function index()
    {
        $this->showLoginView();
    }

    public function process($email, $password)
    {
        $user = new UserDAO;
        $std = new StudentDAO;

        $users = $user->GetForEmail($email);

        foreach ($users as $data) 
        {
            if ($data['email'] == $email) 
            {
                if($data['roleId'] == 1)
                {
                     $loged = ["rol"=>"Usuario", "firstName"=>$data['firstName'], "lastName"=>$data['lastName'], 'email'=>$data['email']];
                    $_SESSION['loged'] = $loged;                    
                }else{
                    $loged = ["rol"=>"Administrador", "firstName"=>$data['firstName'], "lastName"=>$data['lastName'], 'email'=>$data['email']];
                    $_SESSION['loged'] = $loged;
                }
                $this->showIndexView();
               
            }else{
                $this->index();
            }       
        }
    }

    public function showLoginView()
    {
        require_once VIEWS_PATH . "login.php";
    }

    public function showIndexView()
    {
        require_once VIEWS_PATH . "index.php";
    }
}
