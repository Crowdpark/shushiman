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
			
			var deviationPt:Point = new Point(0,0);

			switch(direction)
			{
				case 0:
					deviationPt.x += deviation;
					break;
				case 1:
					deviationPt.x -= deviation;
					break;
				case 2:
					deviationPt.y += deviation;
					break;
				case 3:
					deviationPt.y -= deviation;
					break;
				default:
					break;			
			}
			return deviationPt;
		}
	}
}
