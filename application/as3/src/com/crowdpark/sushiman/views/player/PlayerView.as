package com.crowdpark.sushiman.views.player
{
	import starling.core.Starling;
	import starling.textures.Texture;
	import starling.display.Sprite;
	import starling.display.MovieClip;
	/**
	 * @author sandberg
	 */
	public class PlayerView extends Sprite
	{
		public static const SPEED : int = 2;
		public static const START_X:int = 10;
		public static const START_Y:int = 200;

		private var _currentView:MovieClip;
		
		private var _playerWalkingLeft:MovieClip;
		private var _playerWalkingRight:MovieClip;
		private var _playerKnifeLeft:MovieClip;
		private var _playerKnifeRight:MovieClip;
		
		private var _isFighting:Boolean;
		
		
		public function PlayerView(walkingLeft:Vector.<Texture>, walkingRight:Vector.<Texture>, knifeLeft:Vector.<Texture>, knifeRight:Vector.<Texture>)
		{
			_playerWalkingLeft = new MovieClip(walkingLeft, 24);
			_playerWalkingRight = new MovieClip(walkingRight, 24);
			_playerKnifeLeft = new MovieClip(knifeLeft, 24);
			_playerKnifeRight = new MovieClip(knifeRight, 24);
		}
		
		
		public function resetPosition():void
		{
			x = START_X;
			y = START_Y;
		}

		public function get playerWalkingLeft() : MovieClip
		{
			return _playerWalkingLeft;
		}

		public function set playerWalkingLeft(playerWalkingLeft : MovieClip) : void
		{
			_playerWalkingLeft = playerWalkingLeft;
		}

		public function get playerWalkingRight() : MovieClip
		{
			return _playerWalkingRight;
		}

		public function set playerWalkingRight(playerWalkingRight : MovieClip) : void
		{
			_playerWalkingRight = playerWalkingRight;
		}

		public function get playerKnifeLeft() : MovieClip
		{
			return _playerKnifeLeft;
		}

		public function set playerKnifeLeft(playerKnifeLeft : MovieClip) : void
		{
			_playerKnifeLeft = playerKnifeLeft;
		}

		public function get playerKnifeRight() : MovieClip
		{
			return _playerKnifeRight;
		}

		public function set playerKnifeRight(playerKnifeRight : MovieClip) : void
		{
			_playerKnifeRight = playerKnifeRight;
		}

		public function get currentView() : MovieClip
		{
			return _currentView;
		}

		public function set currentView(currentView : MovieClip) : void
		{
			if (_currentView != currentView)
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
		}

		public function get isFighting() : Boolean
		{
			return _isFighting;
		}

		public function set isFighting(isFighting : Boolean) : void
		{
			_isFighting = isFighting;
		}

	}
}
