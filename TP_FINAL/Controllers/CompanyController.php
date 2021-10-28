<?php

namespace Controllers;

use Models\Company as Company;
use DAO\CompanyDAO as CompanyDAO;

class CompanyController
{
    public function index()
    {
        require_once VIEWS_PATH . "index.php";
    }

    public function Add($id, $name, $address, $email, $phonenumber, $active, $cuit)
    {
        $company = new Company;

        $aux = new CompanyDAO;
        
        $company->setCompanyId($id);
        $company->setName($name);
        $company->setAddress($address);
        $company->setEmail($email);
        $company->setPhoneNumber($phonenumber);        
        $company->setCuit($cuit);
        
        $aux->Add($company);

        $this->index();
    }

    public function GetAll()
    {
        $this->showListView();
    }





/////////////////////// VIEWS ////////////////////////////////////
    public function showAddView()
    {
        require_once VIEWS_PATH . "Company/add-view.php";
    }

    public function showUpdateView()
    {
        require_once VIEWS_PATH . "Company/update-view.php";
    }

    public function showDeleteView()
    {
        require_once VIEWS_PATH . "Company/delete-view.php";
    }

    public function showListView()
    {
        $company = new CompanyDAO;
        $companyList = $company->GetAll();
        require_once VIEWS_PATH . "company-list.php";
    }
}
