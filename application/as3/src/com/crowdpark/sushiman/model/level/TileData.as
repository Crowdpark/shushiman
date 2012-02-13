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
		public static const TYPE_OCTOPUSSY:String = "Octopussy";
		
		private var _id : int;
		private var _type : String;
		private var _rowId:int;
		private var _colId:int;

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

		public function get rowId() : int {
			return _rowId;
		}

		public function set rowId(rowId : int) : void {
			_rowId = rowId;
		}

		public function get colId() : int {
			return _colId;
		}

		public function set colId(colId : int) : void {
			_colId = colId;
		}

	}
}
