package com.crowdpark.sushiman.views.components
{
	import com.crowdpark.sushiman.model.AssetsModel;
	import com.fnicollet.BitmapDataCacher;
	import flash.display.BitmapData;
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.textures.Texture;
	import com.crowdpark.sushiman.model.level.TileData;

	/**
	 * @author sandberg
	 */
	public class Tile extends CollisionImage
	{
		private var _tileData:TileData;
		private var _texture:Texture;
		private var _textureId:String;
		private var _bmd:BitmapData;
		
		public function Tile(textureId:String, texture:Texture, tileData:TileData)
		{
			this.textureId = textureId;
			this._texture = texture;
			this.tileData = tileData;
			
			
			this.bmd = BitmapDataCacher.getBitmapData(AssetsModel.CACHE_ID, textureId);
			

			super(texture);
			
			this.x = tileData.x;
			this.y = tileData.y;


		}

		public function get tileData() : TileData
		{
			return _tileData;
		}

		public function set tileData(tileData : TileData) : void
		{
			_tileData = tileData;
		}

		public function get textureId() : String
		{
			return _textureId;
		}

		public function set textureId(textureId : String) : void
		{
			_textureId = textureId;
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
