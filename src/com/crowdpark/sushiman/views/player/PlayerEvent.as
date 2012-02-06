package com.crowdpark.sushiman.views.player
{
	import flash.events.Event;

	/**
	 * @author sandberg
	 */
	public class PlayerEvent extends Event
	{
		public function PlayerEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
