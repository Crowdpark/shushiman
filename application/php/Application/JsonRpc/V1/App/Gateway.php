<?php

namespace Application\JsonRpc\V1\App
{
    use Processus\Abstracts\JsonRpc\AbstractJsonRpcGateway;

    class Gateway extends AbstractJsonRpcGateway
    {

        protected $_config = array(
            'enabled' => TRUE, 
            'namespace' => __NAMESPACE__, 
            'validDomains' => array(
                'App'
            )
        );
    
    }
}

?>