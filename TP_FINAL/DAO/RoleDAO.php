<?php

namespace DAO;

use \Exception as Exception;
use DAO\IroleDAO as IroleDAO;
use Models\Role as Role;
use DAO\Connection as Connection;

class RoleDAO implements IroleDAO
{
    private $connection;
    private $tableName = "roles";

    ///////////////// PUBLIC FUNCTIONS //////////////////////////

    public function Add(Role $role)
    {
        $this->saveData($role);
    }

    public function GetAll()
    {
        $role = $this->retreiveData();
        return $role;
    }

    ///////////////// PRIVATE FUNCTIONS //////////////////////////

    private function saveData(Role $role)
    {
        try 
        {
            $query = "INSERT INTO" . $this->tableName . " (roleId, value) VALUES (:roleId, :value)";

            $parameters['roleId'] = $role->getRoleId();
            $parameters['value'] = $role->getValue();

            $this->connection = Connection::GetInstance();

            $this->connection->ExecuteNonQuery($query, $parameters);
        }
         catch (Exception $ex) {
            throw $ex;
        }
    }

    private function retreiveData()
    {
        try 
        {
            $roleList = array();

            $query = "SELECT * FROM " . $this->tableName;

            $this->connection = Connection::GetInstance();

            $resultSet = $this->connection->Execute($query);

            foreach($resultSet as $row)
            {
                $role = new Role;

                $role->setRoleId($row['roleId']);
                $role->setValue($row['value']);

                array_push($roleList, $role);
            }
            return $role;
        }
        catch (Exception $ex) {
            throw $ex;
        }
    }
}
