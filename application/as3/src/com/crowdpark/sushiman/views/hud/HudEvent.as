package com.crowdpark.sushiman.views.hud
{
	import flash.events.Event;

	/**
	 * @author sandberg
	 */
	public class HudEvent extends Event
	{
		public static const INIT:String = "HudEvent.INIT";
		
		public function HudEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
