<?php

namespace Controllers;

use DAO\StudentDAO as StudentDAO;
use Models\Student as Student;

class StudentController
{
    private $studentDAO;

    public function __construct()
    {
        $this->studentDAO = new StudentDAO();
    }

    public function index()
    {
        $this->studentDAO->GetJson();
        $this->showIndexView();

    }

    public function InfoStudent()
    {
        $this->ShowStudentView();
    }

    public function Update()
    {
        $this->studentDAO->UpdateJson();
        $this->showIndexView();
    }

    public function Add($studentId, $fileNumber, $careerId, $userId, $active)
    {
        $student = new Student();
        $student->setStudentId($studentId);
        $student->setFileNumber($fileNumber);
        $student->setCareerId($careerId);
        $student->setUserId($userId);
        $student->setActive($active);
       
        $this->studentDAO->Add($student);

        $this->ShowAddView();
    }

    ////////////////// VIEWS //////////////////////////

    public function ShowAddView()
    {
        require_once(VIEWS_PATH . "add-student.php");
    }

    public function ShowListView()
    {
        $studentList = $this->studentDAO->GetAll();

        require_once(VIEWS_PATH . "student-list.php");
    }

    public function ShowStudentView()
    {
        $std = new StudentDAO;
        $student = $std->GetById();
        require_once VIEWS_PATH . "student-view.php";

    }

    public function showIndexView()
    {
        require_once VIEWS_PATH . "index.php";
    }
}
