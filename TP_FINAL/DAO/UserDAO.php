<?php

namespace DAO;

use \Exception as Exception;
use DAO\IuserDAO as IuserDAO;
use Models\User as User;
use DAO\Connection as Connection;

class UserDAO implements IuserDAO
{
    private $filename;
    private $connection;
    private $tableName = "users";


    //////////////////// PUBLIC FUNCTIONS /////////////////

    public function Add(User $user)
    {
        $this->saveData($user);
    }

    public function GetAll()
    {
        $user = $this->retreiveData();
        return $user;
    }

    public function GetForEmail($email)
    {
        $user = $this->GetByEmail($email);
        return $user;
    }

    public function GetJson()
    {
        $this->filename = dirname(__DIR__) . "/Data/Student/response_1635014736722.json"; // TOMO PARTES DE JSON STUDENT

        //$careerJsonList = array();
        if (file_exists($this->filename)) 
        {
            $jsoncontent = file_get_contents($this->filename);
            $arraytodecode = ($jsoncontent) ? json_decode($jsoncontent, true) : array();
            $i = 1;
            foreach ($arraytodecode as $data) {
                $user = new User;
                $user->setUserId($i);
                $user->setRoleId(1);
                $user->setFirstName($data['firstName']);
                $user->setLastName($data['lastName']);
                $user->setDni($data['dni']);
                $user->setGender($data['gender']);
                $user->setBirthDay($data['birthDate']);
                $user->setEmail($data['email']);
                $user->setPhoneNumber($data['phoneNumber']);
                $i++;

                $this->saveData($user);
            }
        }
    }

    //////////////////// PRIVATE FUNCTIONS /////////////////

    private function saveData($user)
    {
        try {
            $query = "INSERT INTO " . $this->tableName . " (userId, roleId, firstName, lastName, dni, gender, birthDay, email, phoneNumber) VALUES 
                (:userId, :roleId, :firstName, :lastName, :dni, :gender, :birthDay, :email, :phoneNumber);";

            $parameters["userId"] = $user->getUserId();
            $parameters["roleId"] = $user->getRoleId();
            $parameters["firstName"] = $user->getFirstName();
            $parameters["lastName"] = $user->getLastName();
            $parameters["dni"] = $user->getDni();
            $parameters["gender"] = $user->getGender();
            $parameters["birthDay"] = $user->getBirthDay();
            $parameters['email'] = $user->getEmail();
            $parameters["phoneNumber"] = $user->getPhoneNumber();

            $this->connection = Connection::GetInstance();

            $this->connection->ExecuteNonQuery($query, $parameters);
        } catch (Exception $ex) {
            throw $ex;
        }
    }

    private function retreiveData()
    {
        try {
            $userList = array();

            $query = "SELECT * FROM " . $this->tableName;

            $this->connection = Connection::GetInstance();

            $resultSet = $this->connection->Execute($query);

            foreach ($resultSet as $row) {
                $user = new User;
                $user->setUserId($row["userId"]);
                $user->setRoleId($row["roleId"]);
                $user->setFirstName($row["firstName"]);
                $user->setLastName($row['lastName']);
                $user->setDni($row['dni']);
                $user->setGender($row['gender']);
                $user->setBirthDay($row['birthDay']);
                $user->setPhoneNumber($row['phoneNumber']);
                $user->setRoleId($row['roleId']);

                array_push($userList, $user);
            }

            return $userList;
        } catch (Exception $ex) {
            throw $ex;
        }
    }

    private function GetByEmail($email)
    {
        try {
            $query = "SELECT * FROM " . $this->tableName . " WHERE email = :email";
            $parameters['email'] = $email;
            $this->connection = Connection::GetInstance();
            $resultSet = $this->connection->Execute($query, $parameters);
            return $resultSet;
        } catch (Exception $ex) {
            throw $ex;
        }
    }
}
