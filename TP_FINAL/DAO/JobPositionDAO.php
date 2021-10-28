<?php namespace DAO;

use \Exception as Exception;
use DAO\IjobPositionDAO as IjobPositionDAO;
use Models\JobPosition as JobPosition;    
use DAO\Connection as Connection;

class JobPositionDAO implements IjobPositionDAO
{

    private $filename;
    private $connection;
    private $tableName = "jobpositions";


    ////////////// PUBLIC FUNCTIONS ///////////////////////

    public function Add(JobPosition $jobPosition)
    {
        $this->saveData($jobPosition);
    }

    public function GetAll()
    {
        $jobPosition = $this->retreiveData();
        return $jobPosition;
    }

    public function GetJson()
    {
        $this->fileName = dirname(__DIR__) . "/Data/JobPosition/response_1635014664967.json";

        if(file_exists($this->fileName))
        {
            $jsoncontent = file_get_contents($this->fileName);
            $arraytodecode = ($jsoncontent) ? json_decode($jsoncontent, true) : array();
            foreach($arraytodecode as $data)
            {
                $jobPosition = new JobPosition;

                $jobPosition->setJobPositionId($data['jobPositionId']);
                $jobPosition->setCareerId($data['careerId']);
                $jobPosition->setDescription($data['description']);

                $this->saveData($jobPosition);
            }
        }
    }

    ////////////// PRIVATE FUNCTIONS ///////////////////////

    private function saveData($jobPosition)
    {
        try{
        $query = "INSERT INTO " . $this->tableName . " (jobPositionId, careerId, description) VALUES (:jobPositionId, :careerId, :description)";

        $parameters['jobPositionId'] = $jobPosition->getJobPositionId();
        $parameters['careerId'] = $jobPosition->getCareerId();
        $parameters['description'] = $jobPosition->getDescription();

        $this->connection = Connection::GetInstance();

        $this->connection->ExecuteNonQuery($query, $parameters);
        }
        catch(Exception $ex)
        {
            throw $ex;
        }
    }

    private function retreiveData()
    {
        try
        {
            $jobPositionList = array();

            $query = "SELECT * FROM " . $this->tableName;

            $this->connection = Connection::GetInstance();

            $resultSet = $this->connection->Execute($query);

            foreach($resultSet as $row)
            {
                $jobPosition = new JobPosition;

                $jobPosition->setJobPositionId($row['jobPositionId']);
                $jobPosition->setCareerId($row['careerId']);
                $jobPosition->setDescription(['description']);

                array_push($jobPositionList, $jobPosition);
            }
            return $jobPositionList;
        }

        catch(Exception $ex)
        {
            throw $ex;
        }

    }

}