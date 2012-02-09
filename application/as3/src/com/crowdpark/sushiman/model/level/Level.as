package com.crowdpark.sushiman.model.level
{
	/**
	 * @author sandberg
	 */
	public class Level
	{
		private var _id : String;
		private var _fields : Array;

		public function get id() : String
		{
			return _id;
		}

		public function set id(id : String) : void
		{
			_id = id;
		}

		public function get fields() : Array
		{
			return _fields;
		}

		public function set fields(fields : Array) : void
		{
			_fields = fields;
		}
	}
}
