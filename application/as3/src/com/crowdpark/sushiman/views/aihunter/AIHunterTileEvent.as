package com.crowdpark.sushiman.views.aihunter
{
	import flash.events.Event;

	/**
	 * @author sandberg
	 */
	public class AIHunterTileEvent extends Event
	{
		public static const MOVING : String = "AIHunterTileEvent.MOVING";
		public static const COLLISION_BORDER : String = "AIHunterTileEvent.COLLISION_BORDER";
		public function AIHunterTileEvent(type : String)
		{
			super(type, bubbles, cancelable);
		}
	}
}
