package com.crowdpark.sushiman.views.aihunter
{
	import com.crowdpark.sushiman.model.level.TileData;
	import com.crowdpark.sushiman.views.components.TileMovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import starling.textures.Texture;

	/**
	 * @author sandberg
	 */
	 
	public class AIHunterTileView extends TileMovieClip
	{
		public static const SPEED:int = 5;
		private var _data:TileData;
		private var _isActive:Boolean;
		private var _lastPosition:Point;
		
		public function AIHunterTileView(textures : Vector.<Texture>, data:TileData)
		{
			_data = data;
			super(textures, 24, data);
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
