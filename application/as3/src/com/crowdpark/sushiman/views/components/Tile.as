package com.crowdpark.sushiman.views.components
{
	import com.crowdpark.sushiman.model.level.Level;
	import com.crowdpark.sushiman.model.AssetsModel;
	import com.fnicollet.BitmapDataCacher;
	import flash.display.BitmapData;
	import starling.display.Image;
	import starling.textures.Texture;
	import com.crowdpark.sushiman.model.level.TileData;

	/**
	 * @author sandberg
	 */
	public class Tile extends Image
	{
		private var _tileData:TileData;
		private var _texture:Texture;
		private var _textureType:String;
		private var _bmd:BitmapData;
		
		public function Tile(textureType:String, texture:Texture, tileData:TileData)
		{
			this.textureType = textureType;
			this._texture = texture;
			this.tileData = tileData;

			this.bmd = BitmapDataCacher.getBitmapData(AssetsModel.CACHE_ID, textureType);
			
			super(texture);
			
			this.width = Level.TILE_WIDTH;
			this.height = Level.TILE_HEIGHT;
			this.x = tileData.colId * Level.TILE_WIDTH;
			this.y = tileData.rowId * Level.TILE_HEIGHT;
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

		public function get bmd() : BitmapData
		{
			return _bmd;
		}

		public function set bmd(bmd : BitmapData) : void
		{
			_bmd = bmd;
		}
	}
}
