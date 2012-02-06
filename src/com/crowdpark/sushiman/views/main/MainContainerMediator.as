package com.crowdpark.sushiman.views.main
{
	import com.crowdpark.sushiman.views.components.SimplePill;
	import com.crowdpark.sushiman.events.ScoreEvent;
	import com.crowdpark.sushiman.views.player.Player;
	import flash.ui.Keyboard;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.StarlingMediator;
	import starling.events.KeyboardEvent;

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
		 * TODO: 
		 * Check if movement could be allowed(no walls, not outside board)
		 * Move - improve the quality of movement
		 * Check for collission between other objects and decide what to do.
		 */
		private function keyUpHandler(event : KeyboardEvent) : void
		{
			var speed:int = 5;
			
			switch(event.keyCode)
			{
				case Keyboard.RIGHT:
					view.player.x += speed;
					break;
				case Keyboard.LEFT:
					view.player.x -= speed;
					break;
				case Keyboard.UP:
					view.player.y -= speed;
					break;
				case Keyboard.DOWN:
					view.player.y =+ speed;
					break;
				
			}
			checkCollision();
		}
		
		/*
		 * TODO: Detect if collision between player and other object has occured.
		 * Handling based on what kind of object.
		 */
		private function checkCollision():void
		{
			// for now we just pretend to eat a pill in order to trigger the scoring system
			dispatch(new ScoreEvent(ScoreEvent.UPDATE, SimplePill));
		}

		private function onStartupComplete(event : ContextEvent) : void
		{
			trace("Hello i'm in mediator");
		}
	}
}
