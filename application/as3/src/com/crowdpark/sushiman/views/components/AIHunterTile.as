package com.crowdpark.sushiman.views.components
{
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import com.crowdpark.sushiman.model.level.Level;
	import com.crowdpark.sushiman.model.level.TileData;
	import flash.geom.Point;

	/**
	 * @author sandberg
	 */
	public class AIHunterTile extends MovieClip implements ITile
	{
		private var _data:TileData;
		private var _isActive:Boolean;
		private var _lastPosition:Point;
		private var _textureType:String;
		private var _lastDirection:String;

		public function AIHunterTile(textures : Vector.<Texture>, textureType:String,data:TileData)
		{
			_textureType = textureType;
			_data = data;
			super(textures, 24);
			var pos:Point = Level.calculateTilePosition(data.colId, data.rowId);
			this.x = pos.x;
			this.y = pos.y;
			_lastPosition = new Point(this.x, this.y);
		}
		
		public function changeDirection():String
		{
			var direction:Array = ["LEFT", "RIGHT", "UP", "DOWN"];
			var chosen:String;
			
			while (!chosen || chosen == _lastDirection)
			{
				chosen =  direction[Math.floor(Math.random()*direction.length)];
			}
			
			_lastDirection = chosen;
			return chosen;
		}

		public function get textureType() : String
		{
			return _textureType;
		}
	}
}
