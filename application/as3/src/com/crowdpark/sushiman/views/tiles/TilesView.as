package com.crowdpark.sushiman.views.tiles
{

	import starling.display.Image;
	import flash.display.BitmapData;
	import starling.textures.Texture;
	import com.crowdpark.sushiman.model.level.TileData;
	import com.crowdpark.sushiman.views.components.Tile;
	import starling.display.Sprite;
	

	/**
	 * @author sandberg
	 */
	public class TilesView extends Sprite
	{
		private var _tiles:Vector.<Tile>;
		
		public function TilesView()
		{
//			var s :flash.display.Sprite = new flash.display.Sprite();
//			var color : uint = Math.random() * 0xFFFFFF;
//			s.graphics.beginFill(color);
//			var radius : uint = 20;
//			s.graphics.drawRect(0,0,760,650);
//			s.graphics.endFill();
//			var bmd : BitmapData = new BitmapData(radius * 2, radius * 2, true, color);
//
//			bmd.draw(s);
//			var t : Texture = Texture.fromBitmapData(bmd);
//			var im:Image = new Image(t);
//			addChild(im);
		}
		
		
		public function addTile(textureId:String, tileTexture:Texture, data:TileData):void
		{
			if (_tiles == null)
			{
				_tiles = new Vector.<Tile>();
			}
			var tile:Tile = new Tile(textureId, tileTexture, data);
			_tiles.push(tile);
			addChild(tile);
		}

		public function get tiles() : Vector.<Tile>
		{
			return _tiles;
		}

		public function set tiles(tiles : Vector.<Tile>) : void
		{
			_tiles = tiles;
		}
		
	}
}
