package com.crowdpark.core.rpc
{
	import org.robotlegs.mvcs.Actor;

	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	import flash.events.Event;
	import flash.events.EventDispatcher;

	[Event(name="JsonRpcClientEvent.RESULT", type="com.crowdpark.core.rpc.JsonRpcClientEvent")]
	[Event(name="JsonRpcClientEvent.FAULT", type="com.crowdpark.core.rpc.JsonRpcClientEvent")]
	/**
	 * @author francis
	 */
	public class JsonRpcClient extends Actor implements IJsonRpcClient
	{
		protected var _url : String;
		protected var _serviceEventDispatcher : EventDispatcher = new EventDispatcher();
		protected var _onResultCallback : Function;
		protected var _onFaultCallback : Function;
		protected var _method : String;
		protected var _params : Array;
		protected var _httpService : HTTPService;

		public function send() : void
		{
			_httpService = new HTTPService();
			_httpService.addEventListener(FaultEvent.FAULT, this._onFaultCallback ||= this._onFault);
			_httpService.addEventListener(ResultEvent.RESULT, this._onResultCallback ||= this._onResult);

			_httpService.method = "POST";
			
			if (this.url.length < 5)
			{
				throw new Error("Url not available");
			}
			
			_httpService.url = this.url;
			_httpService.contentType = "application/json";
			_httpService.resultFormat = HTTPService.RESULT_FORMAT_TEXT;
			_httpService.request = JSON.stringify({"id":"1", "method":this.method ||= "App.User.getInitialData", "params":this.params ||= []});
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

		public function get url() : String
		{
			return this._url;
		}

		public function set url(url : String) : void
		{
			this._url = url;
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

		public function addEventListener(type : String, listener : Function, useCapture : Boolean = false, priority : int = 0, useWeakReference : Boolean = false) : void
		{
			this._serviceEventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}

		public function dispatchEvent(event : Event) : Boolean
		{
			return this._serviceEventDispatcher.dispatchEvent(event);
		}

		public function hasEventListener(type : String) : Boolean
		{
			return this.hasEventListener(type);
		}

		public function removeEventListener(type : String, listener : Function, useCapture : Boolean = false) : void
		{
			this.removeEventListener(type, listener, useCapture);
		}

		public function willTrigger(type : String) : Boolean
		{
			return this.willTrigger(type);
		}
	}
}
