package com.crowdpark.sushiman.views.components
{
	import flash.display.BitmapData;
	import starling.display.Sprite;
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
		
		public function Tile(texture:Texture, tileData:TileData)
		{
			this._texture = texture;
			this.tileData = tileData;

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
	}
}
