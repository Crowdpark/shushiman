package com.crowdpark.sushiman.views.main
{
	import starling.core.Starling;
	import starling.events.Event;
	import starling.events.KeyboardEvent;

	import com.crowdpark.sushiman.events.PlayerEvent;
	import com.crowdpark.sushiman.model.AssetsModel;
	import com.crowdpark.sushiman.views.components.PillSmall;
	import com.crowdpark.sushiman.views.components.Player;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.StarlingMediator;

	import flash.ui.Keyboard;

	/**
	 * @author francis
	 */
	public class MainContainerMediator extends StarlingMediator
	{
		public static const SPEED : int = 5;
		[Inject]
		public var view : MainContainerView;
		[Inject]
		public var assets : AssetsModel;
		private var _moveLeft : Boolean;
		private var _moveRight : Boolean;
		private var _moveUp : Boolean;
		private var _moveDown : Boolean;

		override public function onRegister() : void
		{
			view.player = new Player(assets.getTextures("hero/knife_right/"), 24);
			view.addChild(view.player);
			Starling.juggler.add(view.player);
			addContextListener(ContextEvent.STARTUP_COMPLETE, onStartupComplete);
			addPlayerListeners();
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
				view.player.x -= SPEED;
			}

			if (_moveRight)
			{
				view.player.x += SPEED;
			}
			if (_moveUp)
			{
				view.player.y -= SPEED;
			}
			if (_moveDown)
			{
				view.player.y += SPEED;
			}
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
			checkCollision();
		}

		/*
		 * TODO: Detect if collision between player and other object has occured.
		 * Handling based on what kind of object.
		 */
		private function checkCollision() : void
		{
			// for now we just pretend to eat a pill in order to trigger the scoring system
			if (view.pills.length > 0) 
			{
				var pill:PillSmall = view.pills[0];
				dispatch(new PlayerEvent(PlayerEvent.UPDATE, pill));
				view.removePillSmall(pill);
			}
		}

		private function onStartupComplete(event : ContextEvent) : void
		{
			trace("Hello i'm in mediator");
		}
	}
}
