package com.crowdpark.core.robotlogger
{
	/**
	 * @author sandberg
	 */
	public interface IRobotLoggerService
	{
		function log(level : int, sender : Class, message : String) : void;

	}
}
