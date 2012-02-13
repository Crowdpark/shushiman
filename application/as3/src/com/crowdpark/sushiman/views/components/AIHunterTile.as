package com.crowdpark.sushiman.views.components
{
	import flash.events.Event;
	import flash.geom.Point;
	import com.crowdpark.sushiman.model.level.TileData;
	import starling.textures.Texture;

	/**
	 * @author sandberg
	 */
	public class AIHunterTile extends TileMovieClip
	{
		private var _data:TileData;
		private var _isActive:Boolean;
		private var _lastPosition:Point;
		
		public function AIHunterTile(textures : Vector.<Texture>, data:TileData)
		{
			_data = data;
			super(textures, 24, data);
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
	}
}
