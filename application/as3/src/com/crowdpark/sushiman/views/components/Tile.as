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
			
			
//			var s : flash.display.Sprite = new flash.display.Sprite();
//			var color : uint = Math.random() * 0xFFFFFF;
//			s.graphics.beginFill(color);
//			var radius : uint = 20;
//			s.graphics.drawCircle(radius, radius, radius);
//			s.graphics.endFill();
//			var bmd : BitmapData = new BitmapData(radius * 2, radius * 2, true, color);
//
//			bmd.draw(s);
//			var t : Texture = Texture.fromBitmapData(bmd);
			
			super(texture);
			
			this.x = tileData.x;
			this.y = tileData.y;

//			super();
//			
//			var image : Image = new Image(_texture);
//			addChild(image);
			

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
