package com.crowdpark.sushiman.model
{
	import flash.events.Event;

	/**
	 * @author sandberg
	 */
	public class SushimanModelEvent extends Event
	{
		public static const UPDATED_SCORE : String = "SushimanModelEvent.UPDATED_SCORE";
		public static const UPDATED_NUM_LIVES : String = "SushimanModelEvent.UPDATED_NUM_LIVES";
		public static const UPDATED_NUM_OCTOPUSSIES : String = "SushimanModelEvent.UPDATED_NUM_OCTOPUSSIES";

		public function SushimanModelEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
