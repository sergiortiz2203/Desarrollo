<?php
if(!isset($_SESSION['loged']))
{
     echo "<script>alert('Debe estar Logueado para acceder a la App');window.location.href= 'index.php' </script>";
}
    require_once('nav.php');
?>
<main class="py-5">
     <section id="listado" class="mb-5">
          <div class="container">
               <h2 class="mb-4">Informacion general</h2>
               <table class="table bg-light-alpha">
                    <thead>
                         <th>Legajo</th>
                         <th>Apellido</th>
                         <th>Nombre</th>
                    </thead>
                    <tbody>
                        
                    </tbody>
               </table>
          </div>
     </section>
</main>