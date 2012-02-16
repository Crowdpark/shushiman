package com.crowdpark.sushiman.views.aihunter
{
	import flash.events.Event;

	/**
	 * @author sandberg
	 */
	public class AIHunterTileEvent extends Event
	{
		public static const MOVING : String = "MOVING";
		public function AIHunterTileEvent(type : String)
		{
			super(type, bubbles, cancelable);
		}
	}
}
