package com.crowdpark.sushiman.views.tiles
{
	import starling.display.Image;
	import starling.textures.Texture;
	import com.crowdpark.sushiman.model.level.Level;
	import com.crowdpark.sushiman.model.level.TileData;
	import flash.geom.Point;

	/**
	 * @author sandberg
	 */
	public class Tile extends Image
	{
		private var _tileData:TileData;
		private var _texture:Texture;
		private var _textureType:String;
		
		public function Tile(textureType:String, texture:Texture, tileData:TileData)
		{
			
			this.textureType = textureType;
			this._texture = texture;
			this.tileData = tileData;
			super(texture);			
			var pos:Point = Level.calculateTilePosition(tileData.colId, tileData.rowId);
			this.x = pos.x;
			this.y = pos.y;
		}

		public function get tileData() : TileData
		{
			return _tileData;
		}

		public function set tileData(tileData : TileData) : void
		{
			_tileData = tileData;
		}

		public function get textureType() : String
		{
			return _textureType;
		}

		public function set textureType(textureId : String) : void
		{
			_textureType = textureId;
		}

	}
}
