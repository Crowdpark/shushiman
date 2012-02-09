<?php
/**
 * Created by JetBrains PhpStorm.
 * User: francis
 * Date: 11/16/11
 * Time: 1:33 AM
 * To change this template use File | Settings | File Templates.
 */
namespace Application
{
    class ApplicationBootstrap extends \Processus\ProcessusBootstrap
    {
        /**
         * @var \Application\ApplicationBootstrap
         */
        private static $_instance;

        /**
         * @var \Application\ApplicationContext
         */
        private static $_appInstance;

        /**
         * @static
         * @return ApplicationBootstrap
         */
        public static function getInstance()
        {
            if( ! self::$_instance)
            {
                self::$_instance = new ApplicationBootstrap();
            }

            return self::$_instance;
        }

        /**
         * @return ApplicationContext
         */
        public function getApplication()
        {
            if(! self::$_appInstance)
            {
                self::$_appInstance = new ApplicationContext();
            }

            return self::$_appInstance;
        }
    }
}