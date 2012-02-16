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
		
		public static function getRandomDirection(exceptDirection:String = ""):String
		{
			var directions:Array = [DIRECTION_RIGHT,DIRECTION_LEFT,DIRECTION_UP,DIRECTION_DOWN];
			var index:int = directions.indexOf(exceptDirection);
			if (index > -1)
			{
				directions.splice(index,1);
			}

			var direction:int = int(Math.random()* directions.length);
			
			switch(direction)
			{
				case 0:
					return directions[0];
					break;
				case 1:
					return directions[1];
					break;
				case 2:
					return directions[2];
					break;
				case 3:
					return directions[3];
					break;
				default:
					break;
			}
			return "";

		}
	}
}
