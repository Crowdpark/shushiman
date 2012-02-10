package com.crowdpark.sushiman.views.tiles {
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


		public function addTile(textureId : String, tileTexture : Texture, data : TileData) : void 
		{
			var tile : Tile = new Tile(textureId, tileTexture, data);
			addChild(tile);
		}

		public function removeTile(tile : Tile) : void 
		{
			var n : int = this.numChildren;
			for (var i : int = 0;i < n;i++) 
			{
				var t : Tile = this.getChildAt(i) as Tile;
				if (t.tileData.id == tile.tileData.id) 
				{
					if (this.contains(t)) 
					{
						this.removeChild(t);
					}
					break;
				}
			}
		}
	}
}
