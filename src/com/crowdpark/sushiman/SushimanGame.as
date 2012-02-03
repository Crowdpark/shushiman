package com.crowdpark.sushiman {
	import starling.display.Sprite;

	import com.crowdpark.sushiman.views.TestView;

	import starling.events.Event;
	import starling.display.DisplayObjectContainer;
	import org.robotlegs.mvcs.StarlingContext;

	/**
	 * @author sandberg
	 */
	public class SushimanGame extends Sprite
	{
		private var _context:SushimanContext;
		
		public function SushimanGame() 
		{
			_context = new SushimanContext(this as DisplayObjectContainer);
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        private function onAddedToStage(event:Event):void
        {
            //var testView:TestView = new TestView();
            //addChild(testView);
        }

	}
}
