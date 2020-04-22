<?php

    namespace App\Controllers;
    use App\Models\{Job, Project};

    class IndexController extends BaseController{
        public function indexAction(){
            $name = "Hector Benitez";//Acepta variables dentro de la cadena de texto.
            $limitMonths = 102;//Límite de meses.

            $jobs= Job::all();//Lee todos los job de la base de datos y los guarda en jobs.
            foreach ($jobs as $job) {//Obtiene la url para cada job.
                if ($job->imagePath ?? false){
                    $job->imagePath = '../cursophp/public/uploads/jobs/'.$job->imagePath;
                }
                else{
                    $job->imagePath="https://ui-avatars.com/api/?name=John+Doe&size=255";
                }
            }
            $projects = Project::all();//Lee todos los project de la base de datos y los guarda en project.

            //include '../views/index.php';//Imprime la vista.
            return $this->renderHTML('index.twig', [
                'name' => $name,
                'jobs' => $jobs,
                'projects' => $projects
            ]);
        }

        
    }
?>