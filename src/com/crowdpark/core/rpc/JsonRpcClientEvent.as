package com.crowdpark.core.rpc
{
	import com.crowdpark.core.abstracts.AbstractEvent;

	/**
	 * @author francis
	 */
	public class JsonRpcClientEvent extends AbstractEvent
	{
		public static const RESULT : String = "JsonRpcClientEvent.RESULT";
		public static const FAULT : String = "JsonRpcClientEvent.FAULT";

		public function JsonRpcClientEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
