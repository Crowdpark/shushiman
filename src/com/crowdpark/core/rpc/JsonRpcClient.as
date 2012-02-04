package com.crowdpark.core.rpc
{
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/**
	 * @author francis
	 */
	public class JsonRpcClient extends EventDispatcher
	{
		private var _httpService : HTTPService;
		private var _url : String;
		private var _onResultCallback : Function;
		private var _onFaultCallback : Function;

		public function JsonRpcClient(target : IEventDispatcher = null)
		{
			super(target);
			this._initRpc();
		}

		protected function _initRpc() : void
		{
			_httpService = new HTTPService();
			_httpService.addEventListener(FaultEvent.FAULT, this._onFaultCallback ||= this._onFault);
			_httpService.addEventListener(ResultEvent.RESULT, this._onResultCallback ||= this._onResult);
		}

		private function _onResult(event : ResultEvent) : void
		{
		}

		private function _onFault(event : FaultEvent) : void
		{
		}

		public function send() : void
		{
		}

		public function set url(url : String) : void
		{
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
	}
}
