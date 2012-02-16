package com.crowdpark.sushiman.views.main 
{

	import com.crowdpark.sushiman.views.aihunter.AIHunterTileView;
	import com.crowdpark.sushiman.views.aihunter.AIHunterTileEvent;
	import starling.display.DisplayObject;
	import com.crowdpark.sushiman.views.player.PlayerEvent;
	import com.crowdpark.sushiman.views.components.Tile;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import starling.core.Starling;
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.events.Event;

	import com.crowdpark.sushiman.model.AssetsModel;
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.model.gamestate.GameState;
	import com.crowdpark.sushiman.model.gamestate.GameStateChangedEvent;
	import com.crowdpark.sushiman.model.level.LevelProxy;
	import com.crowdpark.sushiman.model.level.TileData;
	import com.crowdpark.sushiman.views.leaderboard.LeaderboardEvent;
	import com.crowdpark.sushiman.views.leaderboard.LeaderboardView;

	import org.robotlegs.mvcs.StarlingMediator;

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
			eventMap.mapListener(eventDispatcher, GameStateChangedEvent.CHANGE, gamestateChangeHandler);
			eventMap.mapListener(eventDispatcher, LeaderboardEvent.SHOW_LEADERBOARD, openLeaderBoardHandler);	
			
			view.playButton.addEventListener(Event.TRIGGERED, playButtonTriggerHandler);
		}

		private function playerMovingHandler(event:PlayerEvent) : void
		{
			checkPlayerCollision();
			checkAICollision();
		}
		
		private function checkPlayerCollision() : void
		{
			var boxHalfSize:int = 5;
			var playerPosX:int = view.tilesView.x + view.player.x + view.player.width/2;
			var playerPosY:int = view.tilesView.y + view.player.y + view.player.height/2;
			var boundingBox:Rectangle = new Rectangle(playerPosX -boxHalfSize,playerPosY-boxHalfSize,boxHalfSize*2,boxHalfSize*2);
			var tileRect:Rectangle;
			var n:int = this.view.tilesView.numChildren;
			
			for(var i:int = 0; i<n;i++)
			{
				if(this.view.tilesView.getChildAt(i) is Tile)
				{
					var tile:Tile = this.view.tilesView.getChildAt(i) as Tile;
					tileRect = (tile as DisplayObject).getBounds(this.view);

					if (tile.textureType == AssetsModel.PATH_WHITE || tile.textureType == AssetsModel.PATH_YELLOW)
					{
						if (boundingBox.intersects(tileRect))
						{
							view.tilesView.removeChild(tile as Tile);
							dispatch(new PlayerEvent(PlayerEvent.COLLISION, tile.textureType));
							break;
						}
					} else if (tile.textureType == AssetsModel.PATH_WALL)
					{
						if (boundingBox.intersects(tileRect))
						{
							dispatch(new PlayerEvent(PlayerEvent.COLLISION, tile.textureType));
							break;
						}
					} else if(tile.textureType == AssetsModel.PATH_OCTOPUSSY)
					{
						if (boundingBox.intersects(tileRect))
						{
							dispatch(new PlayerEvent(PlayerEvent.COLLISION, tile.textureType));
							break;
						}			
					}

				}
			}

		}
		private function checkAICollision() : void
		{
			var boxHalfSize:int = 5;
			var aiList:Vector.<AIHunterTileView> = this.view.AITiles;

			
			for each(var ai:AIHunterTileView in aiList)
			{
				var aiPosX:int = view.tilesView.x + ai.x + ai.width/2;
				var aiPosY:int = view.tilesView.y + ai.y + ai.height/2;
				var boundingBox:Rectangle = new Rectangle(aiPosX -boxHalfSize,aiPosY-boxHalfSize,boxHalfSize*2,boxHalfSize*2);
				var tileRect:Rectangle;
				
				var n:int = this.view.tilesView.numChildren;
				
				for(var j:int = 0; j<n;j++)
				{
					if(this.view.tilesView.getChildAt(j) is Tile)
					{
						var tile:Tile = this.view.tilesView.getChildAt(j) as Tile;
						tileRect = (tile as DisplayObject).getBounds(this.view);
	

						if (tile.textureType == AssetsModel.PATH_WALL)
						{
							if (boundingBox.intersects(tileRect))
							{
								//dispatch(new PlayerEvent(PlayerEvent.COLLISION, tile.textureType));
								break;
							}
						}
	
					}
				}				
			}


		}


		private function configurePauseState() : void
		{
			//view.stage.removeEventListener(Event.ENTER_FRAME, gameLoop);
			eventMap.mapListener(eventDispatcher, PlayerEvent.MOVING, playerMovingHandler);
		}
		
		private function configureLeaderBoard():void
		{
			if (view.leaderBoard == null)
			{
				view.leaderBoard = new LeaderboardView();
			}
			if (!view.contains(view.leaderBoard))
			{
				view.addChild(view.leaderBoard);
			}

			view.leaderBoard.x = -view.background.width;
			view.leaderBoard.y = view.hudView.background.height;

			var t:Tween = new Tween(view.leaderBoard, MainContainerView.TRANSITION_SPEED, Transitions.EASE_IN_OUT);
			t.moveTo(0, view.leaderBoard.y);
			Starling.juggler.add(t);
		}
		
		private function removeLeaderboard() : void
		{
			if (view.leaderBoard != null && view.contains(view.leaderBoard))
			{
				var t:Tween = new Tween(view.leaderBoard, MainContainerView.TRANSITION_SPEED, Transitions.EASE_IN_OUT);
				t.moveTo(-view.background.width, view.leaderBoard.y);
				Starling.juggler.add(t);
			}
		}

		private function configureLifeLost() : void
		{
		}

		private function configureLevelComplete() : void
		{
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
			eventMap.mapListener(eventDispatcher, PlayerEvent.MOVING, playerMovingHandler);
			eventMap.mapListener(eventDispatcher, AIHunterTileEvent.MOVING, playerMovingHandler);
			//view.stage.addEventListener(Event.ENTER_FRAME, gameLoop);
		}

		private function configureGameOverState():void
		{

		}



		private function openLeaderBoardHandler(event:LeaderboardEvent):void
		{
			if (view.leaderBoard != null && view.contains(view.leaderBoard))
			{
				removeLeaderboard();
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
			checkPlayerCollision();
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
