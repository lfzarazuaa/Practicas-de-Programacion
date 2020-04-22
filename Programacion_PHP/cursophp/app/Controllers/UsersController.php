<?php
    namespace App\Controllers;
    use App\Models\User;//Espacio de nombres de la clase Job.
    use Respect\Validation\Validator;

    class UsersController extends BaseController{
        public function getAddUserAction($request){
            $responseMessage = null;
            if ($request->getMethod() == 'POST'){//Si los valores de Post no son vacios.
                $postData = $request->getParsedBody();
                $userValidator = Validator::key('email', Validator::stringType()->notEmpty())
                ->key('password', Validator::stringType()->notEmpty());
                try{
                    $userValidator->assert($postData);
                    $user = new User();//Pasa los datos obtenidos por el formulario.
                    $user->setValues($postData);
                    $user->save();
                    $responseMessage = 'Usuario Registrado';
                }
                catch(\Exception $e){
                    $responseMessage = $e->getMessage();
                }
                     
            }
           
            return $this->renderHTML('addUser.twig', //Imprime la vista.
                ['responseMessage' => $responseMessage
            ]);
        }
    }
?>