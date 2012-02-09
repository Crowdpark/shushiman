package com.crowdpark.sushiman.model.level
{
	import flash.events.Event;

	/**
	 * @author sandberg
	 */
	public class LevelModelEvent extends Event
	{
		public static const UPDATED:String = "LevelModelEvent.UPDATED";
		
		public function LevelModelEvent(type : String)
		{
			super(type);
		}
	}
}
