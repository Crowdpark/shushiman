package com.crowdpark.sushiman.utils
{
	/**
	 * @author sandberg
	 */
	public class GameUtil
	{
		public static const DIRECTION_RIGHT:String = "right";
		public static const DIRECTION_LEFT:String = "left";
		public static const DIRECTION_UP:String = "up";
		public static const DIRECTION_DOWN:String = "down";
		
		public static function getRandomDirection():String
		{
			var deviation:int = 1;
			var direction:int = int(Math.random()* 4);
			
			switch(direction)
			{
				case 0:
					return DIRECTION_RIGHT;
					break;
				case 1:
					return DIRECTION_LEFT;
					break;
				case 2:
					return DIRECTION_UP;
					break;
				case 3:
					return DIRECTION_DOWN;
					break;
				default:
					break;
			}
			return "";

		}
	}
}
