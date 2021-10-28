<?php

namespace DAO;

use \Exception as Exception;
use DAO\IcompanyDAO as IcompanyDAO;
use Models\Company as Company;
use DAO\Connection as Connection;

class CompanyDAO implements IcompanyDAO
{
    private $tableName = "companies";
    private $connection;

    //////////////////// PUBLIC FUNCTIONS ///////////////////////

    public function Add(Company $company)
    {
        $this->saveData($company);        
    }

    public function GetAll()
    {
        $companyList = $this->retreiveData();
        return $companyList;        
    }

    //////////////////// PRIVATE FUNCTIONS ///////////////////////

    private function saveData(Company $company)
    {
        try {
            $query = "INSERT INTO" . $this->tableName . " (compayId, name, address, email, phoneNumber, cuit) VALUES 
            (:companyId, :name, :address, :email, :phoneNumber, :cuit)";

            $parameters['companyId'] = $company->getCompanyId();
            $parameters['name'] = $company->getName();
            $parameters['address'] = $company->getAddress();
            $parameters['email'] = $company->getEmail();
            $parameters['phoneNumber'] = $company->getPhoneNumber();
            $parameters['cuit'] = $company->getCuit();

            $this->connection = Connection::GetInstance();

            $this->connection->ExecuteNonQuery($query, $parameters);
        } catch (Exception $ex) {
            throw $ex;
        }
    }

    private function retreiveData()
    {
        try
        {
            $companyList = array();

            $query = "SELECT * FROM " . $this->tableName;

            $this->connection = Connection::GetInstance();

            $resultSet = $this->connection->Execute($query);

            foreach($resultSet as $row)
            {
                $company = new Company;

                $company->setCompanyId($row['companyId']);
                $company->setName($row['name']);
                $company->setAddress($row['address']);
                $company->setEmail($row['email']);
                $company->setPhoneNumber($row['phoneNumber']);
                $company->setCompanyId($row['cuit']);

                array_push($companyList, $company);
            }
            return $companyList;
        }
        catch (Exception $ex) {
            throw $ex;
        }

    }











}
