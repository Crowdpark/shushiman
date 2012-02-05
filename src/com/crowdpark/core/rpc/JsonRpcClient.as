package com.crowdpark.core.rpc
{
	import com.crowdpark.core.abstracts.AbstractService;

	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	[Event(name="JsonRpcClientEvent.RESULT", type="com.crowdpark.core.rpc.JsonRpcClientEvent")]
	[Event(name="JsonRpcClientEvent.FAULT", type="com.crowdpark.core.rpc.JsonRpcClientEvent")]
	/**
	 * @author francis
	 */
	public class JsonRpcClient extends AbstractService
	{
		override public function send() : void
		{
			_httpService = new HTTPService();
			_httpService.addEventListener(FaultEvent.FAULT, this._onFaultCallback ||= this._onFault);
			_httpService.addEventListener(ResultEvent.RESULT, this._onResultCallback ||= this._onResult);

			_httpService.method = "POST";
			_httpService.url = this.url;
			_httpService.contentType = "application/json";
			_httpService.resultFormat = HTTPService.RESULT_FORMAT_TEXT;
			_httpService.request = JSON.stringify({"id":"1", "method":this.method, "params":this.params});
			_httpService.send();
		}

		protected function _onResult(event : ResultEvent) : void
		{
			var newEvent : JsonRpcClientEvent = new JsonRpcClientEvent(JsonRpcClientEvent.RESULT);
			newEvent.dataProvider = event.result;
			dispatchEvent(newEvent);
		}

		protected function _onFault(event : FaultEvent) : void
		{
			var newEvent : JsonRpcClientEvent = new JsonRpcClientEvent(JsonRpcClientEvent.FAULT);
			newEvent.dataProvider = event.fault;
			dispatchEvent(newEvent);
		}
		
	}
}
