package com.crowdpark.sushiman.services
{
	import com.crowdpark.core.rpc.JsonRpcClientEvent;
	import com.crowdpark.core.rpc.JsonRpcClient;

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author francis
	 */
	public class UserService extends Actor
	{
		public function getInitialData() : void
		{			
			var client : JsonRpcClient = new JsonRpcClient();
			client.url = "http://beatguide.me/api/v1/pub/"; 
			client.params = [{"time":"7days","cost":"all","district":"all","genre":"all","venue":"all"}];
			client.method = "Pub.Filter.filterEvents";
			client.addEventListener(JsonRpcClientEvent.RESULT, onGetInitialDataComplete);
			client.send();
		}

		private function onGetInitialDataComplete(event : JsonRpcClientEvent) : void
		{
			
		}
	}
}
