package com.crowdpark.core.robotlogger
{
	import flash.events.Event;

	/**
	 * @author sandberg
	 */
	public class RobotLoggerEvent extends Event
	{
		public static const LOG:String = "RobotLoggerEvent.LOG";

		//Designates that messages of all logging levels should be logged.
		public static const LEVEL_ALL:int = 0;

		//Logs internal Flex activities. This is most useful when debugging an application.
		public static const LEVEL_DEBUG:int = 2;

		//Logs general information.
		public static const LEVEL_INFO:int = 4;

		//Logs a message when the application encounters a problem. These problems do not cause the application to stop running, but could lead to further errors.
		public static const LEVEL_WARN:int = 6;

		//Logs a message when a critical service is not available or a situation has occurred that restricts the use of the application.
		public static const LEVEL_ERROR:int = 8;

		//Logs a message when an event occurs that results in the failure of the application.
		public static const LEVEL_FATAL:int = 1000;

		private var _level:int;
		private var _sender:Class;
		private var _message:String;
		
		public function RobotLoggerEvent(type : String, level:int, sender:Class, message:String)
		{
			this.level = level;
			this.sender = sender;
			this.message = message;
			
			super(type);
		}
		
		
		public function getLevelName(level:int):String
		{
			switch(level)
			{
				case 0:
					return "ALL";
					break;
				case 2:
					return "DEBUG";
					break;
				case 4:
					return "INFO";
					break;
				case 6:
					return "WARN";
					break;
				case 8:
					return "ERROR";
					break;
				case 1000:
					return "FATAL";
					break;
				default:
					return "";
					break;
			}
		}

		public function get level() :int
		{
			return _level;
		}

		public function set level(level : int) : void
		{
			_level = level;
		}

		public function get sender() : Class
		{
			return _sender;
		}

		public function set sender(sender : Class) : void
		{
			_sender = sender;
		}

		public function get message() : String
		{
			return _message;
		}

		public function set message(message : String) : void
		{
			_message = message;
		}
	}
}
