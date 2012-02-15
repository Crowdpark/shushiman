package com.crowdpark.sushiman.views.main
{

	import com.crowdpark.sushiman.views.components.ITile;
	import starling.display.DisplayObject;
	import com.crowdpark.sushiman.model.level.TileData;
	import starling.events.Event;

	import com.crowdpark.sushiman.model.AssetsModel;
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.model.gamestate.GameState;
	import com.crowdpark.sushiman.model.gamestate.GameStateChangedEvent;
	import com.crowdpark.sushiman.model.level.LevelModel;
	import com.crowdpark.sushiman.views.components.Tile;
	import com.crowdpark.sushiman.views.leaderboard.LeaderboardView;
	import com.crowdpark.sushiman.views.player.PlayerEvent;

	import org.robotlegs.mvcs.StarlingMediator;

	import flash.geom.Point;
	import flash.geom.Rectangle;

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
		[Inject]
		public var levelModel:LevelModel;

		override public function onRegister() : void
		{
			view.x = 0;
			view.addBackgroundImage(assets.getBackgroundImage());
			view.addLogo(assets.getCrowdparkLogo());
			view.addPlayButton(assets.getPlayButtonTexture());
			eventMap.mapListener(this.eventDispatcher, GameStateChangedEvent.CHANGE, gamestateChangeHandler);
			view.playButton.addEventListener(Event.TRIGGERED, playButtonTriggerHandler);
			view.stage.addEventListener(Event.ENTER_FRAME, gameLoop);
		}

		private function gameLoop(event : Event) : void
		{
			checkCollision();
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
			view.addPlayer(assets.getTextures(AssetsModel.PATH_PLAYER));

			var aiTiles:Vector.<TileData> = levelModel.currentLevel.aiTiles;
			for each (var data:TileData in aiTiles)
			{
				if (data.type == TileData.TYPE_OCTOPUSSY)
				{
					view.addAITile(assets.getTextures(AssetsModel.PATH_OCTOPUSSY), AssetsModel.PATH_OCTOPUSSY, data);
				}
			}
 
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

		private function checkCollision() : void
		{
			if (view.player)
			{
				var playerRect:Rectangle = view.player.getBounds(this.view);
				var playerPt:Point = new Point(playerRect.x, playerRect.y);
				var tileRect:Rectangle;
	
				var n:int = this.view.tilesView.numChildren;
				for(var i:int = 0; i<n;i++)
				{
					if(this.view.tilesView.getChildAt(i) is ITile)
					{
						var tile:ITile = this.view.tilesView.getChildAt(i) as ITile;
						tileRect = (tile as DisplayObject).getBounds(this.view);
							
						if (playerRect.intersects(tileRect))
						{
							if (tile.textureType == AssetsModel.PATH_WHITE || tile.textureType == AssetsModel.PATH_YELLOW)
							{

								view.tilesView.removeChild(tile as Tile);
								dispatch(new PlayerEvent(PlayerEvent.COLLISION, tile.textureType));
								break;
							}
						} 
						else if (tile.textureType == AssetsModel.PATH_WALL)
						{
								dispatch(new PlayerEvent(PlayerEvent.COLLISION, tile.textureType));
								break;
						} else if(tile.textureType == AssetsModel.PATH_OCTOPUSSY)
						{
								dispatch(new PlayerEvent(PlayerEvent.COLLISION, tile.textureType));
								break;		
						}
					}
				}
			}
		}
	}
}
