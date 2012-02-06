package com.crowdpark.sushiman.services
{
	import com.crowdpark.core.rpc.JsonRpcClientEvent;
	import com.crowdpark.core.rpc.JsonRpcClient;
	import org.robotlegs.mvcs.Actor;

	/**
	 * @author sandberg
	 */
	public class ScoreService extends Actor implements IScoreService
	{
		private var rawService:JsonRpcClient = new JsonRpcClient();
		
		public function setScore(score:int):void
		{
			rawService.url = "";
			rawService.addEventListener(JsonRpcClientEvent.FAULT, faultHandler);
			rawService.addEventListener(JsonRpcClientEvent.RESULT, resultHandler);
			rawService.params = [{score:score}]; //TODO: Verify that the signature of these params are correct
			rawService.send();
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
	}
}
