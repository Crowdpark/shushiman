package com.crowdpark.sushiman.views.aihunter
{
	import starling.core.Starling;
	import com.crowdpark.sushiman.model.level.Level;
	import starling.display.Sprite;
	import starling.display.MovieClip;
	import flash.geom.Rectangle;
	import com.crowdpark.sushiman.model.level.TileData;
	import flash.geom.Point;
	import starling.textures.Texture;

	/**
	 * @author sandberg
	 */
	 
	public class AIHunterView extends Sprite
	{
		public static const SPEED:int = 2;
		private var _data:TileData;
		private var _stageArea:Rectangle;
		
		private var _angryLeft:MovieClip;
		private var _angryRight:MovieClip;
		private var _frightenedLeft:MovieClip;
		private var _frightenedRight:MovieClip; 
		
		private var _currentView:MovieClip;
		
		public function AIHunterView(angryLeft : Vector.<Texture>, 
								angryRight : Vector.<Texture>, 
								frightenedLeft : Vector.<Texture>,
								frightenedRight : Vector.<Texture>,
								data:TileData, 
								stageArea:Rectangle
								)
		{
			_angryLeft = new MovieClip(angryLeft, 24);
			_angryRight = new MovieClip(angryRight, 24);
			_frightenedLeft = new MovieClip(frightenedLeft, 24);
			_frightenedRight = new MovieClip(frightenedRight, 24);

			_stageArea = stageArea;
			_data = data;
			
			var pos:Point = Level.calculateTilePosition(data.colId, data.rowId);
			this.x = pos.x - Level.TILE_WIDTH;
			this.y = pos.y + Level.TILE_HEIGHT;

		}
		
		public function setCurrentViewByPlayer(isPlayerFighting:Boolean):void
		{

			if (currentView == _angryLeft || currentView == frightenedLeft)
			{
				if (isPlayerFighting)
				{
					currentView = frightenedLeft;
				} else
				{
					currentView = angryLeft;
				}
			} else
			{
				if (isPlayerFighting)
				{
					currentView = frightenedRight;
				} else
				{
					currentView = angryRight;
				}
			}
		}


		public function get angryLeft() : MovieClip
		{
			return _angryLeft;
		}

		public function set angryLeft(angryLeft : MovieClip) : void
		{
			_angryLeft = angryLeft;
		}

		public function get angryRight() : MovieClip
		{
			return _angryRight;
		}

		public function set angryRight(angryRight : MovieClip) : void
		{
			_angryRight = angryRight;
		}

		public function get frightenedLeft() : MovieClip
		{
			return _frightenedLeft;
		}

		public function set frightenedLeft(frightenedLeft : MovieClip) : void
		{
			_frightenedLeft = frightenedLeft;
		}

		public function get frightenedRight() : MovieClip
		{
			return _frightenedRight;
		}

		public function set frightenedRight(frightenedRight : MovieClip) : void
		{
			_frightenedRight = frightenedRight;
		}

		public function get currentView() : MovieClip
		{
			return _currentView;
		}

		public function set currentView(currentView : MovieClip) : void
		{
			if(_currentView != null && this.contains(_currentView))
			{
				this.removeChild(_currentView);
				Starling.juggler.remove(_currentView);
			}
			_currentView = currentView;
			this.addChild(_currentView);
			Starling.juggler.add(_currentView);
		}

		public function get stageArea() : Rectangle
		{
			return _stageArea;
		}

		public function set stageArea(stageArea : Rectangle) : void
		{
			_stageArea = stageArea;
		}

	}
}
