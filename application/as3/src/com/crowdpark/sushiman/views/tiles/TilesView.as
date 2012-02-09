package com.crowdpark.sushiman.views.tiles
{
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
		}
		
		
		public function addTile(tileTexture:Texture, data:TileData):void
		{
			if (_tiles == null)
			{
				_tiles = new Vector.<Tile>();
			}
			var tile:Tile = new Tile(tileTexture, data);
			_tiles.push(tile);
			addChild(tile);
			
			
		}
	}
}
