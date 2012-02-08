package com.crowdpark.core.robotlogger
{

	/**
	 * @author sandberg
	 */
	public class RobotLoggerTraceService implements IRobotLoggerService
	{
		[Inject]
		public var event:RobotLoggerEvent;
		
		public function log(level : int, sender : Class, message : String):void
		{
			var out:String  = "";
			out += "[" + new Date().toLocaleTimeString() + "] ";
			out += "=> ";
			out += "[" + event.getLevelName(level) + "] ";
			out += "=> ";
			out += String(sender) +" ";
			out += "=> ";
			out += "['" + message + "'] ";
			
			trace (out);

		}
	}
}
