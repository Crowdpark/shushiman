package com.crowdpark.sushiman.views.main
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import com.crowdpark.sushiman.views.components.Tile;
	import starling.events.Event;

	import com.crowdpark.sushiman.model.AssetsModel;
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.model.gamestate.GameState;
	import com.crowdpark.sushiman.model.gamestate.GameStateChangedEvent;
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

			
		}

		private function configurePlayState() : void
		{
			removeLeaderboard();
			view.removePlayButton();
			view.addTilesView();
			view.addPlayer(assets.getTextures("hero/knife_right/"));
			view.addHudView();
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
			var playerPt:Point = new Point(playerRect.x, playerRect.y);
			var tileRect:Rectangle;

			var n:int = this.view.tilesView.numChildren;
			for(var i:int = 0; i<n;i++)
			{
				if (this.view.tilesView.getChildAt(i) is Tile)
				{
					var tile:Tile = this.view.tilesView.getChildAt(i) as Tile;
					if (tile.textureType == AssetsModel.PATH_WHITE || tile.textureType == AssetsModel.PATH_YELLOW)
					{
						tileRect = tile.getBounds(this.view.tilesView);
						
						// Method below for doing a pixel perfect collision detection
						// The texture atlas should position the objhects correctly first
						// with the use of BitmapDataCacher
						var ptPlayer:Point = new Point(view.player.x + (view.player.width/2),view.player.y + (view.player.height/2));
						
						if(tile.bmd.hitTest(new Point(view.player.x,view.player.y), 255, tile.bmd, new Point(tile.x,tile.y), 255))
						
						//if (playerRect.intersects(tileRect))
						{
							trace ("Hit" + playerRect.x + ":" + playerRect.y + ":" + tile.tileData.id);
							//we should now remove the object from stage & report scoring
							view.tilesView.removeChild(tile);
							dispatch(new PlayerEvent(PlayerEvent.COLLISION, tile.textureType));
							break;
						}
					}
				}
			}

		}
	}
}
