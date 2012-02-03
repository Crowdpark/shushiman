package com.crowdpark.sushiman.events {
	import flash.events.Event;

	/**
	 * @author sandberg
	 */
	public class TestEvent extends Event {
		
		public static const TEST:String = "test";
		
		public function TestEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) 
		{
			super(type, bubbles, cancelable);
		}
	}
}
