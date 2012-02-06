package com.crowdpark.sushiman.views.main
{
	import flash.ui.Keyboard;
	import starling.events.KeyboardEvent;
	import com.crowdpark.sushiman.views.components.Player;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.StarlingMediator;

	/**
	 * @author francis
	 */
	public class MainContainerMediator extends StarlingMediator
	{

		[Inject]
		public var view:MainContainerView;
		
		override public function onRegister() : void
		{
			addContextListener(ContextEvent.STARTUP_COMPLETE, onStartupComplete);
			addKeyListeners();
		}

		private function addKeyListeners() : void
		{
			this.view.stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler)
		}

		/*
		 * TODO: Move the player and check for collision
		 */
		private function keyUpHandler(event : KeyboardEvent) : void
		{
			switch(event.keyCode)
			{
				case Keyboard.RIGHT:
					break;
				case Keyboard.LEFT:
					break;
				case Keyboard.UP:
					break;
				case Keyboard.DOWN:
					break;
				
			}
		}
		
		/*
		 * TODO: Detect if collision between player and other object has occured.
		 * Handling based on what kind of object.
		 */
		private function checkCollision():void
		{
			
		}

		private function onStartupComplete(event : ContextEvent) : void
		{
			trace("Hello i'm in mediator");
		}
	}
}
