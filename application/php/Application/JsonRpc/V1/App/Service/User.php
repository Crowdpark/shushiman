<?php

namespace Application\JsonRpc\V1\App\Service
{
    class User extends \Processus\Abstracts\JsonRpc\AbstractJsonRpcService
    {

        /**
         * @return array
         */
        public function getInitialData()
        {
            // get data from current user
            $userMvo        = $this->getProcessusContext()->getUserBo()->getFacebookUserMvo();
            $userDto        = $userMvo->setDto(new \Application\Dto\FbBasicDto())->export();
            $appFriendsList = $this->getProcessusContext()->getUserBo()->getAppFriends();
            $friendsIdList  = $this->getProcessusContext()->getFacebookClient()->getFriendsIdList();

            $response                   = array();
            $response['user']           = $userDto;
            $response['appFriendsList'] = $appFriendsList;
            $response['friendsIdList']  = $friendsIdList;

            return $response;
        }
    }
}

?>