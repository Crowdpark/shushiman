package com.crowdpark.sushiman.views.main
{
	import com.crowdpark.core.abstracts.AbstractEvent;

	/**
	 * @author francis
	 */
	public class MainContainerEvent extends AbstractEvent
	{
		public static var INIT : String = "MainContainerEvent.INIT";
		public static const PLAY : String = "MainContainerEvent.PLAY";
		
		public function MainContainerEvent(type : String, bubbles : Boolean = false)
		{
			super(type, bubbles);
		}
	}
}
