package com.crowdpark.sushiman.views.player
{
	import com.crowdpark.sushiman.views.tiles.TilesView;
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
			eventMap.mapListener(this.eventDispatcher, GameStateChangedEvent.CHANGE, gamestateChangeHandler);
			eventMap.mapListener(this.eventDispatcher, PlayerEvent.COLLISION, collisionHandler);
			this.isActive = true;
		}
		
		
		private function deviateFromPosition():void
		{
			var deviation:int = 1;
			var direction:int = int(Math.random()* 4);
			var deviationPt:Point = new Point();

			switch(direction)
			{
				case 0:
					view.x += deviation;
					break;
				case 1:
					view.x -= deviation;
					break;
				case 2:
					view.y += deviation;
					break;
				case 3:
					view.y -= deviation;
					break;
				default:
					break;
					
			}

		}

		private function collisionHandler(event:PlayerEvent) : void
		{
			if (event.assetType == AssetsModel.PATH_WALL)
			{
				this.view.x = _lastPosition.x;
				this.view.y = _lastPosition.y;
				deviateFromPosition();
			}
		}

		private function gamestateChangeHandler(event : GameStateChangedEvent) : void
		{
			switch(event.newState)
			{
				case GameState.INIT:
				case GameState.LEVEL_COMPLETE:
				case GameState.GAME_OVER:
				case GameState.LIFE_LOST:
					isActive = false;
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
			this.view.stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			this.view.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			this.view.stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}

		private function removePlayerListeners() : void
		{
			this.view.stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			this.view.stage.removeEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			this.view.stage.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		
		private function isInTargetSpace(playerRect:Rectangle):Boolean
		{
			
//			if (view.parent is TilesView)
//			{
//				
//				var tilesView:TilesView =  (view.parent as TilesView);
//				var rect:Rectangle = (view.parent as TilesView).getBounds(tilesView.parent);
//				playerRect.x = playerRect.x + tilesView.x;
//				playerRect.y = playerRect.y + tilesView.y;
//				
//				if(playerRect.x >= rect.x &&
//				playerRect.x < (rect.x + rect.height) &&
//				playerRect.y >= rect.y &&
//				playerRect.y < rect.y + rect.height)
//				{
//					return true;
//				}
//				if (playerRect.intersects(rect))
//				{
//					return true;
//				}
//				
//			} else
//			{
//				throw new Error("Player is not a child of TilesView, which makes the current calculation of borders impossible");
//			}
//			return false;

			return true;

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
