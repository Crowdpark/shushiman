package com.crowdpark.sushiman
{
	import com.crowdpark.sushiman.services.UserService;
	import starling.display.DisplayObjectContainer;
	import com.crowdpark.sushiman.commands.StartupCommand;
	import com.crowdpark.sushiman.views.main.MainContainerView;
	import com.crowdpark.sushiman.views.main.MainContainerMediator;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.StarlingContext;

	/**
	 * @author sandberg
	 */
	public class SushimanContext extends StarlingContext
	{
		public function SushimanContext(contextView : DisplayObjectContainer = null, autoStartup : Boolean = true) : void
		{
			super(contextView, autoStartup);
		}

		override public function startup() : void
		{
			this.mediatorMap.mapView(MainContainerView, MainContainerMediator);

			this.commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCommand);
			
			this.injector.mapSingleton(UserService);
			
			super.startup();
		}
	}
}
