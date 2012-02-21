package com.crowdpark.sushiman.views.tiles 
{
	import com.crowdpark.sushiman.model.AssetsModel;
	import com.crowdpark.sushiman.model.level.TileData;
	import starling.display.Sprite;
	import starling.textures.Texture;



	/**
	 * @author sandberg
	 */
	 
	public class TilesView extends Sprite 
	{

		private var _tiles:Vector.<Tile> = new Vector.<Tile>();
		
		public function addTile(textureId : String, tileTexture : Texture, data : TileData) : void 
		{
			var tile : Tile = new Tile(textureId, tileTexture, data);
			addChild(tile);
			_tiles.push(tile);
		}

		public function containsMoreScoreTiles():Boolean
		{
			var n : int = this.numChildren;
			for (var i : uint = 0;i < n;i++) 
			{
				var t : Tile = this.getChildAt(i) as Tile;
				if (t.textureType == AssetsModel.PATH_WHITE || t.textureType == AssetsModel.PATH_YELLOW)
				{
					return true;	
				}
			}
			return false;
		}


		public function removeTile(tile : Tile) : void 
		{
			var n : int = this.numChildren;
			for (var i : uint = 0;i < n;i++) 
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

		public function get tiles() : Vector.<Tile>
		{
			return _tiles;
		}
	}
}
