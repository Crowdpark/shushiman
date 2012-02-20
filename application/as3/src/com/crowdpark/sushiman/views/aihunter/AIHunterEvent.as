package com.crowdpark.sushiman.views.aihunter
{
	import flash.events.Event;

	/**
	 * @author sandberg
	 */
	public class AIHunterEvent extends Event
	{
		public static const MOVING : String = "AIHunterEvent.MOVING";
		public static const COLLISION_WALL : String = "AIHunterEvent.COLLISION_WALL";
		public static const NO_COLLISION:String = "AIHunterEvent.NO_COLLISION";
		
		public function AIHunterEvent(type : String)
		{
			super(type, bubbles, cancelable);
		}
	}
}
