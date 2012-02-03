package com.crowdpark.sushiman.views.main
{
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.StarlingMediator;

	/**
	 * @author francis
	 */
	public class MainContainerMediator extends StarlingMediator
	{
		override public function onRegister() : void
		{
			addContextListener(ContextEvent.STARTUP_COMPLETE, onStartupComplete);
		}

		private function onStartupComplete(event : ContextEvent) : void
		{
			trace("Hello i'm in mediator");
		}
	}
}
