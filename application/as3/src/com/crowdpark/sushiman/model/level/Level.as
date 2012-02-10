package com.crowdpark.sushiman.model.level
{
	/**
	 * @author sandberg
	 */
	public class Level
	{
		private var _id : String;
		private var _tiles : Vector.<TileData>;

		public function get id() : String
		{
			return _id;
		}

		public function set id(id : String) : void
		{
			_id = id;
		}

		public function get tiles() : Vector.<TileData>
		{
			return _tiles;
		}

		public function set tiles(tiles : Vector.<TileData>) : void
		{
			_tiles = tiles;
		}
	}
}