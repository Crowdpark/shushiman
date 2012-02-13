package com.crowdpark.sushiman.views.components
{
	import flash.geom.Rectangle;
	import flash.geom.Point;
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
			if (textureType == AssetsModel.PATH_WHITE || textureType == AssetsModel.PATH_YELLOW)
			{
				texture = Texture.fromTexture(texture, null, new Rectangle(0,0,40,40));
				//texture.
			} else
			{
				texture = Texture.fromTexture(texture, null, new Rectangle(0,0,40,40));
			}

			this.textureType = textureType;
			this._texture = texture;
			this.tileData = tileData;

			this.bmd = BitmapDataCacher.getBitmapData(AssetsModel.CACHE_ID, textureType);
			
			super(texture);
			
			this.width = Level.TILE_WIDTH;
			this.height = Level.TILE_HEIGHT;
			
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
