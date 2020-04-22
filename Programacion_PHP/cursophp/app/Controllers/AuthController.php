<?php
    namespace App\Controllers;
    use App\Models\User;//Espacio de nombres de la clase Job.
    use Respect\Validation\Validator;
    use Laminas\Diactoros\Response\RedirectResponse;

    class AuthController extends BaseController{
        public function getlogin($request){
            $responseMessage = '';
            return $this->renderHTML('login.twig', ['responseMessage' => $responseMessage]);
        }
        
        public function getloginMsg($request){
            $responseMessage ='Se debe iniciar sesión primero.';
            return $this->renderHTML('login.twig', ['responseMessage' => $responseMessage]);
        }

        public function postLogin($request){
            $responseMessage = null;
            $postData = $request->getParsedBody();
            $user = User::where('email', $postData['email'])->first();
            if ($user) {
                
                if(\password_verify($postData['password'], $user->password))
                {
                    $responseMessage = 'Datos correctos.';
                    $_SESSION['userId'] = $user->id;
                    return new RedirectResponse('/cursophp/admin');
                }
                else {
                    $responseMessage = 'Password incorrecto.';
                }
            }
            else {
                $responseMessage = 'Usuario no encontrado.';            
            }
            return $this->renderHTML('login.twig', ['responseMessage' => $responseMessage]);
        }

        public function getLogOut($request){
            unset($_SESSION['userId']);
            return new RedirectResponse('/cursophp/login');
        }
    }
?>