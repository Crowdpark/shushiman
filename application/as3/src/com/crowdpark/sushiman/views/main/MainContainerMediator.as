package com.crowdpark.sushiman.views.main
{
	import com.crowdpark.sushiman.views.player.PlayerView;
	import com.crowdpark.sushiman.model.AssetsModel;
	import com.crowdpark.sushiman.views.components.PillSmall;
	import com.crowdpark.sushiman.views.player.PlayerEvent;
	import flash.ui.Keyboard;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.StarlingMediator;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.events.KeyboardEvent;




	/**
	 * @author francis
	 */
	public class MainContainerMediator extends StarlingMediator
	{
		
		[Inject]
		public var view : MainContainerView;
		[Inject]
		public var assets : AssetsModel;


		override public function onRegister() : void
		{
			view.player = new PlayerView(assets.getTextures("hero/knife_right/"), 24);
			view.addChild(view.player);
			Starling.juggler.add(view.player);
			
			this.eventMap.mapListener(this.eventDispatcher, PlayerEvent.MOVING, playerMovingHandler);
			addContextListener(ContextEvent.STARTUP_COMPLETE, onStartupComplete);
		}

		private function playerMovingHandler(event:PlayerEvent) : void
		{
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
			} else
			{
				dispatch(new PlayerEvent(PlayerEvent.LEVEL_COMPLETE));
			}
		}


		private function onStartupComplete(event : ContextEvent) : void
		{
			trace("Hello i'm in mediator");
		}
	}
}
