package com.crowdpark.sushiman {
	import com.crowdpark.sushiman.commands.TestCommand;
	import com.crowdpark.sushiman.events.TestEvent;
	import org.robotlegs.core.IMediator;
	import com.crowdpark.sushiman.views.mediators.TestMediator;
	import com.crowdpark.sushiman.views.TestView;
	import org.robotlegs.mvcs.StarlingContext;

	import starling.display.DisplayObjectContainer;

	/**
	 * @author sandberg
	 */
	public class SushimanContext extends StarlingContext {
		public function SushimanContext(contextView : DisplayObjectContainer = null, autoStartup : Boolean = true) {
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			this.mediatorMap.registerMediator(TestView, TestMediator as IMediator );
			
			this.commandMap.mapEvent(TestEvent.TEST, TestCommand)
			
			super.startup();
			
			this.dispatchEvent(new TestEvent(TestEvent.TEST));
			
		}
	}
}
