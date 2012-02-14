package com.crowdpark.sushiman.views.components
{
	import flash.geom.Point;
	import com.crowdpark.sushiman.model.level.Level;
	import com.crowdpark.sushiman.model.level.TileData;
	import starling.textures.Texture;
	import starling.display.MovieClip;
	/**
	 * @author sandberg
	 */
	public class TileMovieClip extends MovieClip
	{
		private var _data:TileData;
		
		public function TileMovieClip(textures:Vector.<Texture>, fps:Number, data:TileData)
		{
			super(textures, fps);
			
			this.width = Level.TILE_WIDTH;
			this.height = Level.TILE_HEIGHT;
			
			var pos:Point = Level.calculateTilePosition(data.colId, data.rowId);
			this.x = pos.x;
			this.y = pos.y;
		}

		public function get data() : TileData
		{
			return _data;
		}

		public function set data(data : TileData) : void
		{
			_data = data;
		}
	}
}
