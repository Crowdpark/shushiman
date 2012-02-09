package com.crowdpark.sushiman.services
{
	import com.crowdpark.core.rpc.JsonRpcClient;
	import com.crowdpark.core.rpc.JsonRpcClientEvent;
	import com.crowdpark.sushiman.services.interfaces.IScoreService;
	import org.robotlegs.mvcs.Actor;


	/**
	 * @author sandberg
	 */
	public class ScoreService extends Actor implements IScoreService
	{
		private var _rawService : JsonRpcClient = new JsonRpcClient();

		public function setScore(score : int) : void
		{
			_rawService.url = "";
			_rawService.addEventListener(JsonRpcClientEvent.FAULT, faultHandler);
			_rawService.addEventListener(JsonRpcClientEvent.RESULT, resultHandler);
			_rawService.params = [{score:score}];
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
	}
}
