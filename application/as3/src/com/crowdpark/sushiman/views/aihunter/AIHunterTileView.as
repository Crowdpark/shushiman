package com.crowdpark.sushiman.views.aihunter
{
	import com.crowdpark.sushiman.utils.GameUtil;
	import com.crowdpark.sushiman.model.level.TileData;
	import com.crowdpark.sushiman.views.components.TileMovieClip;
	import flash.geom.Point;
	import starling.textures.Texture;

	/**
	 * @author sandberg
	 */
	 
	public class AIHunterTileView extends TileMovieClip
	{
		public static const SPEED:int = 2;
		private var _data:TileData;
		private var _lastDirection : String = "";
		
		public function AIHunterTileView(textures : Vector.<Texture>, data:TileData)
		{
			_data = data;
			super(textures, 24, data);
		}
		
		public function moveInNewDirection() : void
		{
			var newDirection:String = GameUtil.getRandomDirection(_lastDirection);
			move(newDirection);
		}
		
		public function moveInOldDirection():void
		{
			move(_lastDirection);
		}

		private function move(direction:String):void
		{
			var deviation:Point = GameUtil.getRandomDeviationFromPosition();
			switch(direction)
			{
				case GameUtil.DIRECTION_RIGHT:
					x -= AIHunterTileView.SPEED;
					break;
				case GameUtil.DIRECTION_LEFT:
					x += AIHunterTileView.SPEED;
					break;
				case GameUtil.DIRECTION_UP:
					y -= AIHunterTileView.SPEED;
					break;
				case GameUtil.DIRECTION_DOWN:
					y += AIHunterTileView.SPEED;
					break;
			}
			x += deviation.x;
			y += deviation.y;
			_lastDirection = direction;				
		}

	}
}
