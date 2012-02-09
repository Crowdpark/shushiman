package com.crowdpark.sushiman.model.level
{
	/**
	 * @author sandberg
	 */
	public class Tile
	{
		private var _id : int;
		private var _type : String;
		private var _x : Number;
		private var _y : Number;

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

		public function get x() : Number
		{
			return _x;
		}

		public function set x(x : Number) : void
		{
			_x = x;
		}

		public function get y() : Number
		{
			return _y;
		}

		public function set y(y : Number) : void
		{
			_y = y;
		}
	}
}
