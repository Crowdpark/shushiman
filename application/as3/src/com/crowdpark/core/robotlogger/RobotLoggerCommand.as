package com.crowdpark.core.robotlogger
{
	import org.robotlegs.mvcs.StarlingCommand;

	/**
	 * @author sandberg
	 */
	public class RobotLoggerCommand extends StarlingCommand
	{
		
		[Inject]
		public var service:IRobotLoggerService;
		[Inject]
		public var event:RobotLoggerEvent;
		
		override public function execute():void
		{
			service.log(event.level, event.sender, event.message);
		}
	}
}
