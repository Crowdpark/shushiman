package com.crowdpark.sushiman.services
{
	import com.crowdpark.core.abstracts.AbstractService;
	import com.crowdpark.core.rpc.JsonRpcClient;
	import com.crowdpark.core.rpc.JsonRpcClientEvent;

	/**
	 * @author sandberg
	 */
	public class ScoreService extends AbstractService implements IScoreService
	{
		public function setScore(score : int) : void
		{
			var client : JsonRpcClient = new JsonRpcClient();
			client.url = "";
			client.addEventListener(JsonRpcClientEvent.FAULT, faultHandler);
			client.addEventListener(JsonRpcClientEvent.RESULT, resultHandler);
			client.params = [{score:score}];
			// TODO: Verify that the signature of these params are correct
			// _rawService.send();
		}

		/*
		 * TODO: Handle the result response
		 */
		private function resultHandler(event : JsonRpcClientEvent) : void
		{
		}

		/*
		 * TODO: Handle the result response
		 */
		private function faultHandler(event : JsonRpcClientEvent) : void
		{
		}

		override protected function get gatewayUrl() : String
		{
			return "http://api_shushiman.crowdpark-game.com/api/v1/app/";
		}

	}
}
