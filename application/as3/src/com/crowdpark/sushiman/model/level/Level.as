package com.crowdpark.sushiman.model.level
{
	import flash.geom.Point;
	/**
	 * @author sandberg
	 */
	public class Level
	{
		private var _id : String;
		private var _tiles : Vector.<TileData>;

		public static const TILE_WIDTH:int = 40;
		public static const TILE_HEIGHT:int = 40;
				
		public static function calculateTilePosition(colId:int, rowId:int):Point
		{
			var posX:int = (colId-1) * TILE_WIDTH;
			var posY:int = (rowId-1) * TILE_HEIGHT;
			return new Point(posX, posY);
		}
		
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
		
		public function get numColumns():int
		{
			var numColumns:int = -1;
			if (tiles != null)
			{
				for each (var tile:TileData in tiles)
				{
					if (tile.colId > numColumns)
					{
						numColumns = tile.colId;
					}
				}
			}
			return numColumns;
		}
		
		public function get numRows():int
		{
			var numRows:int = -1;
			if (tiles != null)
			{
				for each (var tile:TileData in tiles)
				{
					if (tile.rowId > numRows)
					{
						numRows = tile.rowId;
					}
				}
			}
			return numRows;
		}
		
		
		public function get aiTiles():Vector.<TileData>
		{
			var aiTiles:Vector.<TileData> = new Vector.<TileData>();
			for each (var tile:TileData in this.tiles)
			{
				if (tile.type == TileData.TYPE_OCTOPUSSY)
				{
					aiTiles.push(tile);
				}
			}
			return aiTiles;
		}
	}
}
