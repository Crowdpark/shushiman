package com.crowdpark.sushiman.views.player
{
	import com.crowdpark.sushiman.views.components.PillSmall;
	import flash.ui.Keyboard;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import org.robotlegs.mvcs.StarlingMediator;

	/**
	 * @author sandberg
	 */
	public class PlayerMediator extends StarlingMediator
	{
		[Inject]
		public var view:PlayerView;
		
		private var _isActive:Boolean;
		private var _moveLeft : Boolean;
		private var _moveRight : Boolean;
		private var _moveUp : Boolean;
		private var _moveDown : Boolean;
		
		override public function onRegister():void
		{
			isActive = true;
		}
		
		private function addPlayerListeners() : void
		{
			this.view.stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			this.view.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			this.view.stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			this.view.stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}

		private function removePlayerListeners() : void
		{
			this.view.stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			this.view.stage.removeEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			this.view.stage.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}

		private function enterFrameHandler(event : Event) : void
		{
			if (_moveLeft)
			{
				view.x -= PlayerView.SPEED;
			}

			if (_moveRight)
			{
				view.x += PlayerView.SPEED;
			}
			if (_moveUp)
			{
				view.y -= PlayerView.SPEED;
			}
			if (_moveDown)
			{
				view.y += PlayerView.SPEED;
			}
			
			dispatch(new PlayerEvent((PlayerEvent.MOVING)));
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
			} else
			{
				removePlayerListeners();
			}
		}
		
	}
}
