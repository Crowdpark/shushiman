package com.crowdpark.sushiman.views.main
{
	import flash.events.Event;

	/**
	 * @author francis
	 */
	public class MainContainerEvent extends Event
	{
		public static var INIT : String = "MainContainerEvent.INIT";
		
		public function MainContainerEvent(type : String, bubbles : Boolean = false)
		{
			super(type, bubbles);
		}
	}
}
