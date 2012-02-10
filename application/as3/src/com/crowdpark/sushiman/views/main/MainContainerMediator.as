package com.crowdpark.sushiman.views.main
{
	import starling.display.Sprite;
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import com.fnicollet.BitmapDataCacher;
	import flash.geom.Rectangle;
	import com.crowdpark.sushiman.views.components.Tile;
	import starling.events.Event;

	import com.crowdpark.sushiman.model.AssetsModel;
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.model.gamestate.GameState;
	import com.crowdpark.sushiman.model.gamestate.GameStateChangedEvent;
	import com.crowdpark.sushiman.views.components.PillSmall;
	import com.crowdpark.sushiman.views.leaderboard.LeaderboardView;
	import com.crowdpark.sushiman.views.player.PlayerEvent;

	import org.robotlegs.mvcs.StarlingMediator;

	/**
	 * @author francis
	 */
	public class MainContainerMediator extends StarlingMediator
	{
		[Inject]
		public var view : MainContainerView;
		[Inject]
		public var assets : AssetsModel;
		[Inject]
		public var model:ISushimanModel;

		override public function onRegister() : void
		{
			view.x = 0;
			view.addBackgroundImage(assets.getBackgroundImage());
			view.addLogo(assets.getCrowdparkLogo());
			view.addPlayer(assets.getTextures("hero/knife_right/"));
			view.addTilesView();
			view.addPlayButton(assets.getPlayButtonTexture());

			this.eventMap.mapListener(this.eventDispatcher, PlayerEvent.MOVING, playerMovingHandler);
			eventMap.mapListener(this.eventDispatcher, GameStateChangedEvent.CHANGE, gamestateChangeHandler);

			view.playButton.addEventListener(Event.TRIGGERED, playButtonTriggerHandler);

		}

		private function playButtonTriggerHandler(event : Event) : void
		{
			dispatch(new MainContainerEvent(MainContainerEvent.PLAY));
		}

		private function gamestateChangeHandler(event : GameStateChangedEvent) : void
		{
			switch(event.state)
			{
				case GameState.INIT:
					configureInitState();
					break;
				case GameState.PLAYING:
					configurePlayState();
					break;
				case GameState.LIFE_LOST:
					configureLifeLost();
					break;				
				case GameState.LEVEL_COMPLETE:
					configureLevelComplete();
				case GameState.GAME_OVER:
					configureGameOverState();
					break;
			}
		}

		private function configureLifeLost() : void
		{
			removeLeaderboard();
		}

		private function configureLevelComplete() : void
		{
			removeLeaderboard();
		}

		private function configureInitState() : void
		{
			removeLeaderboard();
		}

		private function configurePlayState() : void
		{
			removeLeaderboard();
		}

		private function configureGameOverState() : void
		{
			view.leaderBoard = new LeaderboardView();
			view.addChild(view.leaderBoard);
		}

		private function removeLeaderboard() : void
		{
			if (view.leaderBoard != null && view.contains(view.leaderBoard))
			{
				view.removeChild(view.leaderBoard);
			}
		}

		private function playerMovingHandler(event : PlayerEvent) : void
		{
			checkCollision();
		}

		/*
		 * TODO: Detect if collision between player and other object has occured.
		 * Handling based on what kind of object.
		 */
		private function checkCollision() : void
		{
			var playerRect:Rectangle = view.player.getBounds(this.view);
			var tileRect:Rectangle;
			
//			var playerSprite:flash.display.Sprite = new flash.display.Sprite();
//			
//			playerSprite.width = playerRect.width;
//			playerSprite.height = playerRect.height;
//			playerSprite.x = view.player.x;
//			playerSprite.y = view.player.y;

			
			
			for each(var tile:Tile in this.view.tilesView.tiles)
			{

				//tile.bitmap.hitTestObject(playerSprite);
				
//				tileRect = tile.getBounds(this.view);
//				if (playerRect.intersects(tileRect))
//				{
//					trace (tile.tileData.id);
//				}
			}
			
			// for now we just pretend to eat a pill in order to trigger the scoring system
//			if (view.pills.length > 0)
//			{
//				var pill : PillSmall = view.pills[0];
//				dispatch(new PlayerEvent(PlayerEvent.COLLISION, pill));
//				view.removePillSmall(pill);
//			}
//			else
//			{
//				model.currentGameState = GameState.LEVEL_COMPLETE;
//			}
			
			// if the 
		}
	}
}
