<?php
    namespace App\Controllers;
    use App\Models\Project;//Espacio de nombres de la clase Project.

    class ProjectsController extends BaseController{
        public function getAddProjectAction($request){
            if ($request->getMethod() == 'POST'){//Si los valores de Post no son vacios.
                $postData = $request->getParsedBody();//Obtiene las variables del post.
                $project = new Project();//Pasa los datos obtenidos por el formulario.
                $project->setValues($postData);
                $project->save();
            }
            return $this->renderHTML('addProject.twig');
        }
    }
?>