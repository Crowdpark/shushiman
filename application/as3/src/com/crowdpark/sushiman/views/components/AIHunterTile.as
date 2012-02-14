package com.crowdpark.sushiman.views.components
{
	import starling.display.MovieClip;
	import com.crowdpark.sushiman.model.level.Level;
	import flash.events.Event;
	import flash.geom.Point;
	import com.crowdpark.sushiman.model.level.TileData;
	import starling.textures.Texture;

	/**
	 * @author sandberg
	 */
	public class AIHunterTile extends MovieClip implements ITile
	{
		private var _data:TileData;
		private var _isActive:Boolean;
		private var _lastPosition:Point;
		private var _textureType:String;
		
		public function AIHunterTile(textures : Vector.<Texture>, textureType:String,data:TileData)
		{
			_textureType = textureType;
			_data = data;
			super(textures, 24);
			
			this.width = Level.TILE_WIDTH;
			this.height = Level.TILE_HEIGHT;
			
			var pos:Point = Level.calculateTilePosition(data.colId, data.rowId);
			this.x = pos.x;
			this.y = pos.y;
			
			_lastPosition = new Point(this.x, this.y);
		}

		public function get isActive() : Boolean
		{
			return _isActive;
		}

		public function set isActive(isActive : Boolean) : void
		{
			_isActive = isActive;
			if (isActive)
			{
				this.stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			}
		}

		private function enterFrameHandler(event : Event) : void
		{
		}

		public function get textureType() : String
		{
			return _textureType;
		}

	}
}
