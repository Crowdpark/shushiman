<?php

namespace Application\JsonRpc\V1\App
{
    class Auth extends \Processus\Lib\Auth\FacebookAuth
    {
        private $_isAuthorized = TRUE;
    }
}

?>