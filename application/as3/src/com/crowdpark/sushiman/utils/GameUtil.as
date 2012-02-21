package com.crowdpark.sushiman.utils
{
	import flash.geom.Point;
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
			return directions[direction];
		}

		public static function getOppositDirection(direction:String):String
		{
			switch(direction)
			{
				case DIRECTION_RIGHT:
					return DIRECTION_LEFT;
					break;
				case DIRECTION_LEFT:
					return DIRECTION_RIGHT;
					break;
				case DIRECTION_UP:
					return DIRECTION_DOWN;
					break;
				case DIRECTION_DOWN:
					return DIRECTION_UP;
					break;
				default:
					break;
			}
			return "";			
		}

		public static function getRandomDeviationFromPosition(deviation:int=1):Point
		{
			var direction:int = int(Math.random()* 4);
			var x:Number = 0;
			var y:Number = 0;
			
			switch(direction)
			{
				case 0:
					x += deviation;
					break;
				case 1:
					x -= deviation;
					break;
				case 2:
					y += deviation;
					break;
				case 3:
					y -= deviation;
					break;
				default:
					break;			
			}
			return new Point(x, y);
		}
	}
}
