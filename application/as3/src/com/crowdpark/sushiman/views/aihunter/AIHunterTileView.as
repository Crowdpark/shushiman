package com.crowdpark.sushiman.views.aihunter
{
	import flash.geom.Rectangle;
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
		private var _stageArea:Rectangle;
		
		public function AIHunterTileView(textures : Vector.<Texture>, data:TileData, stageArea:Rectangle)
		{
			_stageArea = stageArea;
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
			var oldPosition:Point;
			var newPosition:Point = oldPosition = new Point(x,y);
			
			switch(direction)
			{
				case GameUtil.DIRECTION_RIGHT:
					newPosition.x -= AIHunterTileView.SPEED;
					break;
				case GameUtil.DIRECTION_LEFT:
					newPosition.x += AIHunterTileView.SPEED;
					break;
				case GameUtil.DIRECTION_UP:
					newPosition.y -= AIHunterTileView.SPEED;
					break;
				case GameUtil.DIRECTION_DOWN:
					newPosition.y += AIHunterTileView.SPEED;
					break;
			}
			
			newPosition.x += deviation.x;
			newPosition.y += deviation.y;
			
			x = newPosition.x;
			y = newPosition.y;
			
			if (!this.getBounds(parent).intersects(_stageArea))
			{
				x = oldPosition.x;
				y = oldPosition.y;
			}
			_lastDirection = direction;				
		}

	}
}
