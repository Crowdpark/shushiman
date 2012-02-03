package com.crowdpark.core.rpc
{
	import flash.events.Event;

	/**
	 * @author francis
	 */
	public class JsonRpcClientEvent extends Event
	{
		public function JsonRpcClientEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
