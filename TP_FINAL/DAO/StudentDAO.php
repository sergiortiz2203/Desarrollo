<?php

namespace DAO;

use \Exception as Exception;
use DAO\IStudentDAO as IStudentDAO;
use Models\Student as Student;
use DAO\Connection as Connection;

class StudentDAO implements IStudentDAO
{
    private $fileName;
    private $connection;
    private $tableName = "students";


    ///////////////// PUBLIC FUNCTIONS //////////////////////////

    public function Add(Student $student)
    {
        $this->saveData($student);
    }

    public function GetAll()
    {
        $student = $this->retreiveData();
        return $student;
    }

    public function GetJson()
    {
        $this->filename = dirname(__DIR__) . "/Data/Student/response_1635014736722.json"; // TOMO PARTES DE JSON STUDENT

        //$careerJsonList = array();
        if (file_exists($this->filename)) {
            $jsoncontent = file_get_contents($this->filename);
            $arraytodecode = ($jsoncontent) ? json_decode($jsoncontent, true) : array();
            $i = 1;
            foreach ($arraytodecode as $data) {
                $student = new Student;
                $student->setStudentId($i);
                $student->setFileNumber($data['fileNumber']);
                $student->setCareerId($data['careerId']);
                $student->setUserId($i);
                $student->setActive($data['active']);
                $i++;

                $this->saveData($student);
            }
        }
    }

    public function UpdateJson()
    {
        $this->filename = dirname(__DIR__) . "/Data/Student/response_1635014736722.json"; // TOMO PARTES DE JSON STUDENT

        if (file_exists($this->filename)) {
            $jsoncontent = file_get_contents($this->filename);
            $arraytodecode = ($jsoncontent) ? json_decode($jsoncontent, true) : array();
            $i = 1;
            foreach ($arraytodecode as $data) {
                $student = new Student;

                $student->setStudentId($i);
                $student->setFileNumber($data['fileNumber']);
                $student->setCareerId($data['careerId']);
                $student->setUserId($i);
                $student->setActive($data['active']);
                $i++;

                $this->updateData($student);             
            }
        }
    }

    public function GetById()
    {
        $email = "";
        if(isset($_SESSION['loged']))
        {
            $email = $_SESSION['loged']['email'];
        }
        $student = $this->retreiveDataByEmail($email);
        return $student;
        }



    ///////////////////// PRIVATE FUNCTIONS //////////////////////

    private function saveData($student)
    {
        try {
            $query = "INSERT INTO " . $this->tableName . " (studentId, fileNumber, careerId, userId, active) VALUES 
                (:studentId, :fileNumber, :careerId, :userId, :active);";

            $parameters["studentId"] = $student->getStudentId();
            $parameters["fileNumber"] = $student->getFileNumber();
            $parameters["careerId"] = $student->getCareerId();
            $parameters['userId'] = $student->getUserId();
            $parameters['active'] = $student->getActive();

            $this->connection = Connection::GetInstance();

            $this->connection->ExecuteNonQuery($query, $parameters);
        } catch (Exception $ex) {
            throw $ex;
        }
    }

    private function retreiveData()
    {
        try {
            $studentList = array();

            $query = "SELECT * FROM " . $this->tableName;

            $this->connection = Connection::GetInstance();

            $resultSet = $this->connection->Execute($query);

            foreach ($resultSet as $row) {
                $student = new Student;

                $student->setStudentId($row["studentId"]);
                $student->setFileNumber($row['fileNumber']);
                $student->setCareerId($row['careerId']);
                $student->setUserId($row['userId']);
                $student->setActive($row['active']);

                array_push($studentList, $student);
            }
            return $studentList;
        } catch (Exception $ex) {
            throw $ex;
        }
    }

    private function updateData($student)
    {
        try
        {           
            $query = "UPDATE " . $this->tableName . " SET userId = :uid  WHERE studentId = :std";

            $parameters['uid'] = $student->getUserId();
            $parameters['std'] = $student->getStudentId();

            $this->connection = Connection::GetInstance();
            $this->connection->ExecuteNonQuery($query, $parameters);

        }
        catch (Exception $ex) {
            throw $ex;
        }
    }

    private function retreiveDataByEmail($email)
    {
        try
        {            
            $query = "SELECT ST.studentId, ST.fileNumber,USR.firstName, USR.lastName, CAR.description as Carrera, USR.dni, USR.email, USR.phoneNumber 
                    FROM Students as ST
                    INNER JOIN users as USR ON
                    ST.userId = USR.userId
                    inner join careers as CAR ON
                    ST.careerId = CAR.careerId and USR.email = :email";

            $parameters['email'] = $email;

            $this->connection = Connection::GetInstance();

            $resultset = $this->connection->Execute($query, $parameters);

            return $resultset;

        } catch (Exception $ex) {
            throw $ex;
        }


    }
}
