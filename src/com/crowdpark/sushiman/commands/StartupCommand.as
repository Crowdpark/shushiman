package com.crowdpark.sushiman.commands
{
	import com.crowdpark.sushiman.views.main.MainContainerEvent;
	import org.robotlegs.mvcs.StarlingCommand;

	/**
	 * @author sandberg
	 */
	public class StartupCommand extends StarlingCommand {
		public function StartupCommand() {
		}
		
		override public function execute():void
		{
			this.dispatch(new MainContainerEvent(MainContainerEvent.INIT));
		}
	}
}
