package com.crowdpark.core.rpc
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/**
	 * @author francis
	 */
	public class JsonRpcClient extends EventDispatcher
	{
		public function JsonRpcClient(target : IEventDispatcher = null)
		{
			super(target);
		}
	}
}
