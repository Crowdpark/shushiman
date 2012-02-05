package com.crowdpark.core.rpc
{
	import mx.rpc.http.HTTPService;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	[Event(name="JsonRpcClientEvent.RESULT", type="com.crowdpark.core.rpc.JsonRpcClientEvent")]
	[Event(name="JsonRpcClientEvent.FAULT", type="com.crowdpark.core.rpc.JsonRpcClientEvent")]

	/**
	 * @author francis
	 */
	public class JsonRpcClient extends EventDispatcher
	{
		private var _httpService : HTTPService;
		private var _url : String;
		private var _method : String;
		private var _params : Array;
		private var _onResultCallback : Function;
		private var _onFaultCallback : Function;

		public function JsonRpcClient(target : IEventDispatcher = null)
		{
			super(target);
		}

		private function _onResult(event : ResultEvent) : void
		{
			var newEvent : JsonRpcClientEvent = new JsonRpcClientEvent(JsonRpcClientEvent.RESULT);
			newEvent.dataProvider = event.result;
			dispatchEvent(newEvent);
		}

		private function _onFault(event : FaultEvent) : void
		{
			var newEvent : JsonRpcClientEvent = new JsonRpcClientEvent(JsonRpcClientEvent.FAULT);
			newEvent.dataProvider = event.fault;
			dispatchEvent(newEvent);
		}

		public function send() : void
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

		public function set url(url : String) : void
		{
			this._url = url;
		}

		public function get url() : String
		{
			return _url;
		}

		public function get onResultCallback() : Function
		{
			return _onResultCallback;
		}

		public function set onResultCallback(onResultCallback : Function) : void
		{
			_onResultCallback = onResultCallback;
		}

		public function get onFaultCallback() : Function
		{
			return _onFaultCallback;
		}

		public function set onFaultCallback(onFaultCallback : Function) : void
		{
			_onFaultCallback = onFaultCallback;
		}

		public function get method() : String
		{
			return _method;
		}

		public function set method(method : String) : void
		{
			_method = method;
		}

		public function get params() : Array
		{
			return _params;
		}

		public function set params(params : Array) : void
		{
			_params = params;
		}
	}
}
