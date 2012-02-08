package com.crowdpark.sushiman.services
{
	import com.crowdpark.core.rpc.JsonRpcClient;
	import com.crowdpark.core.rpc.JsonRpcClientEvent;

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author francis
	 */
	public class UserService extends Actor implements IUserService
	{
		public function getInitialData() : void
		{
			var client : JsonRpcClient = new JsonRpcClient();
			client.url = "http://api_shushiman.crowdpark-game.com";
			client.method = "App.User.getInitialData";
			client.addEventListener(JsonRpcClientEvent.RESULT, onGetInitialDataComplete);
			client.send();
		}

		private function onGetInitialDataComplete(event : JsonRpcClientEvent) : void
		{

		}
	}
}
