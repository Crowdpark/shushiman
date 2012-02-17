package com.crowdpark.sushiman.views.player
{
	import com.crowdpark.sushiman.utils.GameUtil;
	import flash.geom.Rectangle;
	import com.crowdpark.sushiman.model.AssetsModel;
	import starling.events.Event;
	import starling.events.KeyboardEvent;

	import com.crowdpark.sushiman.model.gamestate.GameState;
	import com.crowdpark.sushiman.model.gamestate.GameStateChangedEvent;

	import org.robotlegs.mvcs.StarlingMediator;

	import flash.geom.Point;
	import flash.ui.Keyboard;

	/**
	 * @author sandberg
	 */
	public class PlayerMediator extends StarlingMediator
	{

		[Inject]
		public var view : PlayerView;
		private var _isActive : Boolean;
		private var _moveLeft : Boolean;
		private var _moveRight : Boolean;
		private var _moveUp : Boolean;
		private var _moveDown : Boolean;
		private var _lastPosition:Point;
		

		override public function onRegister() : void
		{
			eventMap.mapListener(eventDispatcher, GameStateChangedEvent.CHANGE, gamestateChangeHandler);
			eventMap.mapListener(eventDispatcher, PlayerEvent.COLLISION, collisionHandler);
			view.resetPosition();
			isActive = true;
		}

		private function collisionHandler(event:PlayerEvent) : void
		{
			if (event.assetType == AssetsModel.PATH_WALL)
			{
				var deviation:Point = GameUtil.getRandomDeviationFromPosition();
				view.x = _lastPosition.x + deviation.x;
				view.y = _lastPosition.y + deviation.y;
			}
		}

		private function gamestateChangeHandler(event : GameStateChangedEvent) : void
		{
			switch(event.newState)
			{
				case GameState.INIT:
				case GameState.LEVEL_COMPLETE:
				case GameState.GAME_OVER:
					removePlayerListeners();
				case GameState.LIFE_LOST:
				break;
				case GameState.PAUSED:
					isActive = false;
				break;
				case GameState.PLAYING:
					isActive = true;
				break;
			}
		}

		private function addPlayerListeners() : void
		{
			view.stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			view.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			view.stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}

		private function removePlayerListeners() : void
		{
			view.stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			view.stage.removeEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			view.stage.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}

		private function enterFrameHandler(event : Event) : void
		{
			var newPosition:Point = new Point(view.x,view.y);
			
			_lastPosition = new Point(view.x, view.y);
		
			if (_moveLeft)
			{
				newPosition.x -= PlayerView.SPEED;
			}
		
			if (_moveRight)
			{
				newPosition.x += PlayerView.SPEED;
			}

			if (_moveUp)
			{
				newPosition.y -= PlayerView.SPEED;
			}

			if (_moveDown)
			{
				newPosition.y += PlayerView.SPEED;
			}
			
			var playerRect:Rectangle = view.getBounds(view.parent);
			
//			if (newPosition.x != _lastPosition.x &&
//				newPosition.y != newPosition.y &&
//				 isInTargetSpace(playerRect))
//			{
				view.x = newPosition.x;
				view.y = newPosition.y;
				dispatch(new PlayerEvent((PlayerEvent.MOVING)));
			//}
			
		}

		private function keyDownHandler(event : KeyboardEvent) : void
		{
			switch(event.keyCode)
			{
				case Keyboard.RIGHT:
					_moveRight = true;
					break;
				case Keyboard.LEFT:
					_moveLeft = true;
					break;
				case Keyboard.UP:
					_moveUp = true;
					break;
				case Keyboard.DOWN:
					_moveDown = true;
					break;
			}
		}

		/*
		 * TODO: 
		 * Check if movement could be allowed(no walls, not outside board)
		 * Move - improve the quality of movement
		 * Check for collission between other objects and decide what to do.
		 */
		private function keyUpHandler(event : KeyboardEvent) : void
		{
			switch(event.keyCode)
			{
				case Keyboard.RIGHT:
					_moveRight = false;
					break;
				case Keyboard.LEFT:
					_moveLeft = false;
					break;
				case Keyboard.UP:
					_moveUp = false;
					break;
				case Keyboard.DOWN:
					_moveDown = false;
					break;
			}
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
				addPlayerListeners();
			}
			else
			{
				removePlayerListeners();
			}
		}
	}
}
