package com.crowdpark.sushiman.views.main 
{
	import starling.events.Event;
	import com.crowdpark.sushiman.model.AssetsModel;
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.model.gamestate.GameState;
	import com.crowdpark.sushiman.model.gamestate.GameStateChangedEvent;
	import com.crowdpark.sushiman.model.level.LevelProxy;
	import com.crowdpark.sushiman.model.level.TileData;
	import com.crowdpark.sushiman.views.components.Tile;
	import com.crowdpark.sushiman.views.leaderboard.LeaderboardEvent;
	import com.crowdpark.sushiman.views.leaderboard.LeaderboardView;
	import org.robotlegs.mvcs.StarlingMediator;
	import flash.geom.Point;

	/**
	 * @author francis
	 * TODO: add something to pause the game when pause state is entered
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
		public var levelModel:LevelProxy;

		override public function onRegister() : void
		{
			view.addBackgroundImage(assets.getBackground());
			view.addLogo(assets.getCrowdparkLogo());
			view.addPlayButton(assets.getPlayButtonTexture());
			
			eventMap.mapListener(this.eventDispatcher, GameStateChangedEvent.CHANGE, gamestateChangeHandler);
			eventMap.mapListener(this.eventDispatcher, LeaderboardEvent.SHOW_LEADERBOARD, openLeaderBoardHandler);
			
			view.playButton.addEventListener(Event.TRIGGERED, playButtonTriggerHandler);
		}
		
		private function addGameloopListener():void
		{
			view.stage.addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		
		private function removeGameloopListener():void
		{
			view.stage.removeEventListener(Event.ENTER_FRAME, gameLoop);
		}
		
		private function checkCollision() : void
		{
			if (view.player)
			{
				var i:uint = Math.floor((view.player.x + view.player.width/2) / levelModel.currentLevel.numColumns);
				var j:uint = Math.floor((view.player.y + view.player.height/2) / levelModel.currentLevel.numRows);
				var tile:Tile = getTileTypeByPosition(new Point(i,j));
				if (tile)
				{
					trace(tile.tileData.colId, tile.tileData.rowId);
				}
			}
		}
		
		private function getTileTypeByPosition(gridPosition:Point):Tile
		{
			var tiles:Vector.<Tile> = view.tilesView.tiles;
			for each (var tile:Tile in tiles)
			{	
				if (tile)
				{
					if (gridPosition.x == tile.tileData.rowId && gridPosition.y == tile.tileData.colId)
					{
						return tile;
						break;
					}
				}
			}
			return null;
		}

		private function configurePauseState() : void
		{
			removeGameloopListener();
		}
		
		private function configureLeaderBoard():void
		{
			view.leaderBoard = new LeaderboardView();
			if (view.hudView != null)
			{
				view.leaderBoard.y = view.hudView.background.height;
			}
			view.addChild(view.leaderBoard);
		}

		private function configureInitState() : void
		{

		}

		private function configurePlayState(previousState:String) : void
		{

			removeLeaderboard();
			view.removePlayButton();
			
			if (previousState != GameState.PAUSED)
			{			
				view.addTilesView();
				view.addPlayer(assets.getTextures(AssetsModel.PATH_PLAYER));
	
				if (levelModel.currentLevel != null)
				{
					var aiTiles:Vector.<TileData> = levelModel.currentLevel.aiTiles;
					for each (var data:TileData in aiTiles)
					{
						if (data.type == TileData.TYPE_OCTOPUSSY)
						{
							view.addAITile(assets.getTextures(AssetsModel.PATH_OCTOPUSSY), AssetsModel.PATH_OCTOPUSSY, data);
						}
					}
				}
			}
		
			view.addBackgroundMask(assets.getBackgroundMask());
			view.addHudView(assets.getBackgroundHud());
			view.addFriendsListView(assets.getBackgroundHud());
			addGameloopListener();
		}

		private function configureGameOverState():void
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

		private function openLeaderBoardHandler(event:LeaderboardEvent):void
		{
			if (view.leaderBoard != null && view.contains(view.leaderBoard))
			{
				view.removeChild(view.leaderBoard);
			} else
			{
				if (model.currentGameState == GameState.PAUSED)
				{
					configureLeaderBoard();	
				}
				
			}
		}
		
		private function gameLoop(event : Event) : void
		{
//			if (view.player)
//			{
//				var x:int = Math.floor((view.player.x + view.player.width/2) / levelModel.currentLevel.numColumns);
//				var y:int = Math.floor((view.player.x + view.player.height/2) / levelModel.currentLevel.numRows); 
//				checkCollision();
//			}
		}

		private function playButtonTriggerHandler(event : Event) : void
		{
			dispatch(new MainContainerEvent(MainContainerEvent.PLAY));
		}
	
		private function gamestateChangeHandler(event : GameStateChangedEvent) : void
		{
			switch(event.newState)
			{
				case GameState.INIT:
					configureInitState();
				break;
				case GameState.PLAYING:
					configurePlayState(event.previousState);
				break;
				case GameState.PAUSED:
					configurePauseState();
				break;
				case GameState.LIFE_LOST:
				break;				
				case GameState.LEVEL_COMPLETE:
				break;
				case GameState.GAME_OVER:
					configureGameOverState();
				break;
			}
		}
	}
}
