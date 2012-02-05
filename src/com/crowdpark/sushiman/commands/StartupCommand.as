package com.crowdpark.sushiman.commands
{
	import com.crowdpark.sushiman.services.UserService;
	import org.robotlegs.mvcs.StarlingCommand;

	/**
	 * @author sandberg
	 */
	public class StartupCommand extends StarlingCommand
	{
		
		[Inject]
		public var service : UserService;
		
		override public function execute() : void
		{		
			service.getInitialData();
		}
	}
}
