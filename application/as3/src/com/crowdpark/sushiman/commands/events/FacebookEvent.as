package com.crowdpark.sushiman.commands.events
{
	import flash.events.Event;

	/**
	 * @author sandberg
	 */
	public class FacebookEvent extends Event
	{
		public static const LOGIN:String = "login";
		
		public function FacebookEvent(type : String)
		{
			super(type, bubbles, cancelable);
		}
	}
}
