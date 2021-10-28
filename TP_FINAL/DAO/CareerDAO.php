<?php

namespace DAO;

use \Exception as Exception;
use DAO\IcareerDAO as IcareerDAO;
use Models\Career as Career;
use DAO\Connection as Connection;

class CareerDAO implements IcareerDAO
{    
    private $filename;
    private $connection;
    private $tableName = "careers";

//////////////////// PUBLIC FUNCTIONS ///////////////////////
    public function Add(Career $career)
    {
        $this->saveData($career);
    }

    public function GetAll()
    {
        $careerList = $this->retreiveData();
        return $careerList;
    }

    //////////////////// PRIVATE FUNCTIONS ///////////////////////

    private function saveData(Career $career)
    {
        try {
            $query = "INSERT INTO " . $this->tableName . " (careerId, description, active) VALUES (:careerId, :description, :active)";

            $parameters['careerId'] = $career->getCareerId();
            $parameters['description'] = $career->getDescription();
            $parameters['active'] = $career->getActive();

            $this->connection = Connection::GetInstance();

            $this->connection->ExecuteNonQuery($query, $parameters);
        } catch (Exception $ex) {
            throw $ex;
        }
    }

    private function retreiveData()
    {
        try {
            $careerList = array();

            $query = "SELECT * FROM" . $this->tableName;

            $this->connection = Connection::GetInstance();

            $resultSet = $this->connection->Execute($query);

            foreach ($resultSet as $row) {
                $career = new Career;

                $career->setCareerId($row['careerId']);
                $career->setDescription($row['description']);
                $career->setActive($row['active']);

                array_push($careerList, $career);
            }
            return $careerList;
        } catch (Exception $ex) {
            throw $ex;
        }
    }

    public function GetJson()
    {
        $this->filename = dirname(__DIR__) . "/Data/Career/response_1635014581333.json";
        
        if(file_exists($this->filename))
        {
            $jsoncontent = file_get_contents($this->filename);
            $arraytodecode = ($jsoncontent) ? json_decode($jsoncontent, true) : array();
            foreach($arraytodecode as $data)
            {
                $career = new Career;
                $career->setCareerId($data['careerId']);
                $career->setDescription($data['description']);
                $career->setActive($data['active']);
                
                $this->saveData($career);    
            }
        }
    }
}
