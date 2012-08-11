<?php

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
class UserIdentity extends CUserIdentity
{
	/**
	 * Authenticates a user.
	 * The example implementation makes sure if the username and password
	 * are both 'demo'.
	 * In practical applications, this should be changed to authenticate
	 * against some persistent user identity storage (e.g. database).
	 * @return boolean whether authentication succeeds.
	 */
    public function authenticate()
    {
        // obtenemos el password 
        $password = $this->password;
        
        // lo encriptamos
        $encryptedPassword = User::model()->encryptPassword($password);

        // obtenemos el usuario según el nombre de usuario ingresado
        $user = User::model()->findByAttributes(
                    array('username'=>  $this->username)
                );

        // si encontramos el usuario, entonces vemos si la contraseña ingresada
        // es la correcta
        if($user)
        {
            // si la contraseña del usuario es la misma que ingresó
            if($user->password == $encryptedPassword)
            {
                // entonces el error es ninguno :)
                $this->errorCode=self::ERROR_NONE;
            }

            // si no es la misma, ingresó mal la contraseña
            else
            {
                $this->errorCode=self::ERROR_PASSWORD_INVALID;
            }
        }

        // si no encontramos al usuario
        else
        {
            // entonces el error es el nombre de usuario inválido
            $this->errorCode=self::ERROR_USERNAME_INVALID;
        }

        return !$this->errorCode;
    }
}