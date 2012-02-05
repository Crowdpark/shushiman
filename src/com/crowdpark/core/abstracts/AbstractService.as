package com.crowdpark.core.abstracts
{
	import com.crowdpark.core.rpc.IJsonRpcClient;

	import org.robotlegs.mvcs.Actor;

	import mx.rpc.http.HTTPService;

	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 * @author Francis Varga
	 */
	public class AbstractService extends Actor implements IJsonRpcClient
	{
		protected var _url : String;
		protected var _eventDispatcher : EventDispatcher;
		protected var _onResultCallback : Function;
		protected var _onFaultCallback : Function;
		protected var _method : String;
		protected var _params : Array;
		protected var _httpService : HTTPService;

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
			this._eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}

		public function dispatchEvent(event : Event) : Boolean
		{
			return this._eventDispatcher.dispatchEvent(event);
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

		public function send() : void
		{
			throw new Error("Implement in subclasses!", "10001");
		}
	}
}
