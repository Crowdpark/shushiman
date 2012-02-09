<?php

namespace Application\Dto
{

    class FbBasicDto extends \Processus\Abstracts\Vo\AbstractDTO
    {
        /**
         * @return array
         */
        protected function getMapping()
        {
            return array(
                "id"        => array(
                    'match'   => "id",
                    'default' => 0,
                ),
                "userId"    => array(
                    'match'   => "id",
                    'default' => 0,
                ),
                "firstName" => array(
                    'match'   => "first_name",
                    'default' => "FirstName",
                ),
                "lastName"  => array(
                    'match'   => "last_name",
                    'default' => "LastName",
                ),
                "fullName"  => array(
                    'match'   => "name",
                    'default' => "Name",
                ),
                "locale"    => array(
                    'match'   => "locale",
                    'default' => "Locale",
                ),
                "username"  => array(
                    'match'   => "id",
                    'default' => "UserName",
                ),
                "isAppUser" => array(
                    'match'   => 'isAppUser',
                    'default' => 0
                ),
            );
        }
    }
}

?>