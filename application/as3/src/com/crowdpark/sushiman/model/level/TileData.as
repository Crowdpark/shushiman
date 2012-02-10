package com.crowdpark.sushiman.model.level
{
	/**
	 * @author sandberg
	 */
	public class TileData
	{
		public static const TYPE_YELLOW_POINT:String = "YellowPoint";
		public static const TYPE_WHITE_POINT:String = "WhitePoint";
		public static const TYPE_WALLBRICK:String = "WallBrick";
		
		private var _id : int;
		private var _type : String;
		private var _x : int;
		private var _y :  int;

		public function get id() : int
		{
			return _id;
		}

		public function set id(id : int) : void
		{
			_id = id;
		}

		public function get type() : String
		{
			return _type;
		}

		public function set type(type : String) : void
		{
			this._type = type;
		}

		public function get x() : int
		{
			return _x;
		}

		public function set x(x : int) : void
		{
			_x = x;
		}

		public function get y() : int
		{
			return _y;
		}

		public function set y(y : int) : void
		{
			_y = y;
		}
	}
}
