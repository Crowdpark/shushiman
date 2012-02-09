<?php
/**
 * Created by JetBrains PhpStorm.
 * User: francis
 * Date: 12/7/11
 * Time: 11:04 AM
 * To change this template use File | Settings | File Templates.
 */
namespace Application\Factorys
{
    class AppUserFactory
    {

        /**
         * @var array
         */
        private static $_factoryCollection = array();

        /**
         * @static
         * @return array
         */
        public static function getFactoryCollection()
        {
            return self::$_factoryCollection;
        }

        /**
         * @static
         *
         * @param int $userId
         *
         * @return \Application\Mvo\AppUserMvo
         */
        public static function factory($userId)
        {

            $debug = new \Processus\Lib\Profiler\ProcessusDebugProfilerVo();
            $debug->setLine(__LINE__)
                ->setClass(__CLASS__)
                ->setMethod(__METHOD__)
                ->setComment("factory => " . $userId)
                ->startTimeTrack();

            $factoryObj = self::$_factoryCollection[$userId];

            if (empty($factoryObj)) {
                $factoryObj = new \Application\Mvo\AppUserMvo();
                $factoryObj->setMemId($userId);
                $factoryObj->getFromMem();

                self::$_factoryCollection[$userId] = $factoryObj;
            }

            \Processus\Lib\Profiler\ProcessusProfiler::getInstance()->addDebugInfo($debug->endTimeTrack());

            return self::$_factoryCollection[$userId];
        }
    }
}