<?php
    namespace Controllers;

    class HomeController
    {
        public function Index($message = "")
        {
            
            require_once(VIEWS_PATH."login.php"); 
        }
        
        public function logOut()
        {
            require_once(VIEWS_PATH."login.php"); 
            
        }

        public function showLoginView()
        {
            require_once(VIEWS_PATH."login.php"); 
        }
    }
?>