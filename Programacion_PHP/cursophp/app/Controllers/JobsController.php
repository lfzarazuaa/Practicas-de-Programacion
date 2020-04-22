<?php
    namespace App\Controllers;
    use App\Models\Job;//Espacio de nombres de la clase Job.
    use Respect\Validation\Validator;

    class JobsController extends BaseController{
        public function getAddJobAction($request){
            $responseMessage = null;
            if ($request->getMethod() == 'POST'){//Si los valores de Post no son vacios.
                $postData = $request->getParsedBody();
                $jobValidator = Validator::key('title', Validator::stringType()->notEmpty())
                ->key('description', Validator::stringType()->notEmpty())
                ->key('months', Validator::intVal()->between(0, 200));
                //Validación de formulario con try catch. 
                try{
                    $jobValidator->assert($postData);///Despliega exepción si no cumple con las caracteristicas.
                    //Lectura de imagen.
                    $files = $request->getUploadedFiles();//Recupera el archivo ingresado.
                    $logo = $files['logo'];//Lee la imagen 'logo'.
                    
                    /* Si la imagen no es jpg png manda error. */
                    $name = $logo->getClientFilename();//Obtiene el nombre del archivo.
                    $name = explode(".", $name);//Separa la cadena desde el caracter indicado.
                    $ext = strtolower(array_pop($name));//Obtiene la extensión del archivo en minusculas.
                    if (!in_array($ext, ["jpeg", "jpg", "png"])) {
                        throw new Exception ('Formato de imagen inválido');
                    }

                    /* Si no se obtuvieron errores al cargar la imagen. */
                    if ($logo->getError() != UPLOAD_ERR_OK) {
                        throw new Exception ('No se logró cargar la imagen.');
                    }
                    
                    $job = new Job();//Crea el objeto para luego guardarlo en la base de datos.
                    $job->setValues($postData);//Guarda los valores en el objeto.
                    $job->save();
                    
                    $job = Job::where('title', $postData['title'])->orderBy('id','desc')->first();
                    $filename = "Job_" . $job->id . '.jpg';//Obtiene el nombre de la imagen.
                    $job->imagePath=$filename;
                    $logo->moveTo("../public/uploads/jobs/$filename");
                    $job->save();
                    $responseMessage = 'Guardado';
                }
                catch(\Exception $e){
                    $responseMessage = $e->getMessage();
                }
                     
            }
            //include '../views/addJob.php';//Imprime la vista.
            return $this->renderHTML('addJob.twig', [
                'responseMessage' => $responseMessage
            ]);
        }
    }
?>