<?php namespace DAO;

use \Exception as Exception;
use DAO\IjobOfferDAO as IjobOfferDAO;
use Models\JobOffer as JobOffer;    
use DAO\Connection as Connection;

class JobOfferDAO implements IjobOfferDAO
{
    private $connection;
    private $tableName = "joboffers";

    ///////////////// PUBLIC FUNCTIONS //////////////////////////

    public function Add(JobOffer $jobOffer)
    {
        $this->saveData($jobOffer);
    }

    public function GetAll()
    {
        $jobOffer = $this->retreiveData();
        return $jobOffer;
    }

    ///////////////// PRIVATE FUNCTIONS //////////////////////////

    private function saveData(JobOffer $jobOffer)
    {
        try{
        $query = "INSERT INTO" . $this->tableName . " (jobOfferId, companyId, careerId, jobPositionId) VALUES (:jobOfferId, :companyId, :careerId, :jobPositionId)";

        $parameters['jobOfferId'] = $jobOffer->getJobOfferId();
        $parameters['companyId'] = $jobOffer->getCompanyId();
        $parameters['careerId'] = $jobOffer->getCareerId();
        $parameters['jobPositionId'] = $jobOffer->getJobPositionId();

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
            $jobOfferList = array();

            $query = "SELECT * FROM " . $this->tableName;

            $this->connection = Connection::GetInstance();

            $resultSet = $this->connection->Execute($query);

            foreach($resultSet as $row)
            {
                $jobOffer = new JobOffer;

                $jobOffer->setJobOfferId($row['jobOfferId']);
                $jobOffer->setCompanyId($row['companyId']);
                $jobOffer->setCareerId($row['careerId']);
                $jobOffer->setJobPositionId($row['jobPositionId']);

                array_push($jobOfferList, $jobOffer);
            }
            return $jobOffer;

        }
        catch(Exception $ex)
            {
                throw $ex;
            }

    }

}