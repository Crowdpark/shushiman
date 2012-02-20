package com.crowdpark.sushiman.views.main 
{
	import com.crowdpark.sushiman.views.player.PlayerView;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import com.crowdpark.sushiman.views.aihunter.AIHunterView;
	import com.crowdpark.sushiman.views.aihunter.AIHunterEvent;
	import starling.display.DisplayObject;
	import com.crowdpark.sushiman.views.player.PlayerEvent;
	import com.crowdpark.sushiman.views.components.Tile;
	import flash.geom.Rectangle;
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

		private var _currentTimer:Timer;
		private var _isPausing:Boolean;

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
			if(!_isPausing)
			{
				checkPlayerCollision();
			}
			
		}
		
		private function checkPlayerCollision() : void
		{
			var boxHalfSize:int = 10;
			var playerPosX:int = view.player.x + view.player.width/2;
			var playerPosY:int = view.player.y + view.player.height/2;
			var boundingBox:Rectangle = new Rectangle(playerPosX - boxHalfSize, playerPosY - boxHalfSize, boxHalfSize * 2, boxHalfSize * 2);
			
			moveAI(boundingBox);

			var hitTile:Tile = getHitTile(boundingBox);
			if (hitTile != null)
			{
				dispatch(new PlayerEvent(PlayerEvent.COLLISION, hitTile.textureType));
				if (hitTile.textureType == AssetsModel.PATH_WHITE || hitTile.textureType == AssetsModel.PATH_YELLOW)
				{
					view.tilesView.removeChild(hitTile);
				}
			}
		}

		private function moveAI(player:Rectangle):void
		{
			var aiList:Vector.<AIHunterView> = this.view.AITiles;
			var isAIHit:Boolean;
			var n:uint = aiList.length;
			var ai:AIHunterView;
			var aiBox:Rectangle;
			var tile:Tile;
			var boxHalfSize:int = 20;
			
			for(var i:uint = 0; i < n; i++)
			{
				ai = aiList[i];
				aiBox = ai.getBounds(this.view);
				
				tile = getHitTile(aiBox);

				if(player.intersects(aiBox))
				{
					dispatch(new PlayerEvent(PlayerEvent.COLLISION, AssetsModel.PATH_OCTOPUSSY_ANGRY_LEFT));
					break;
				} 
				
				if (tile != null && tile.textureType == AssetsModel.PATH_WALL)
				{
					// move in new direction
					dispatch(new AIHunterEvent(AIHunterEvent.COLLISION_WALL));
					
				} else
				{
					// move in old direction
					//dispatch(new PlayerEvent(PlayerEvent.NO_COLLISION));
					dispatch(new AIHunterEvent(AIHunterEvent.NO_COLLISION));
				}
			}
		}

		private function getHitTile(boundingBox:Rectangle):Tile
		{
			var tileRect:Rectangle;
			var n:int = this.view.tilesView.numChildren;
			
			for(var i:uint = 0; i<n;i++)
			{
				if(this.view.tilesView.getChildAt(i) is Tile)
				{
					var tile:Tile = this.view.tilesView.getChildAt(i) as Tile;
					tileRect = (tile as DisplayObject).getBounds(this.view);

					if (tile.textureType == AssetsModel.PATH_WHITE || 
						tile.textureType == AssetsModel.PATH_YELLOW ||
						tile.textureType == AssetsModel.PATH_WALL ||
						tile.textureType == AssetsModel.PATH_OCTOPUSSY_ANGRY_LEFT)
					{
						if (boundingBox.intersects(tileRect))
						{
							return tile;
							break;
						}
					}
				}								
			}
			return null;
		}

		private function configurePauseState() : void
		{
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
			if (_currentTimer == null)
			{
				_isPausing = true;
				view.signDead = assets.getSignDead();
				view.signDead.x = view.tilesView.x + (view.tilesView.width/2 - view.signDead.width/2);
				view.signDead.y = view.tilesView.y + (view.tilesView.height/2 - view.signDead.height/2);
				view.addChild(view.signDead);
				
				_currentTimer  = new Timer(1000);
				_currentTimer.addEventListener(TimerEvent.TIMER, signDeadHandler);
				_currentTimer.start();
			}
		}

		private function signDeadHandler(event : TimerEvent) : void
		{
			_currentTimer.stop();
			_currentTimer.removeEventListener(TimerEvent.TIMER, signDeadHandler);
			_currentTimer = null;
			
			view.removeChild(view.signDead);
			view.player.resetPosition();
			_isPausing = false;

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
				view.player = new PlayerView(assets.getTextures(AssetsModel.PATH_PLAYER_WALKING_LEFT),
											assets.getTextures(AssetsModel.PATH_PLAYER_WALKING_RIGHT),
											assets.getTextures(AssetsModel.PATH_PLAYER_KNIFE_LEFT),
											assets.getTextures(AssetsModel.PATH_PLAYER_KNIFE_RIGHT)
											);
				view.addChild(view.player);
	
				if (levelModel.currentLevel != null)
				{
					var aiTiles:Vector.<TileData> = levelModel.currentLevel.aiTiles;
					var stageArea:Rectangle = view.tilesView.getBounds(this.view);
					for each (var data:TileData in aiTiles)
					{
						if (data.type == TileData.TYPE_OCTOPUSSY)
						{
							var hunter:AIHunterView = new AIHunterView( assets.getTextures(AssetsModel.PATH_OCTOPUSSY_ANGRY_LEFT), 
																assets.getTextures(AssetsModel.PATH_OCTOPUSSY_ANGRY_RIGHT),
																assets.getTextures(AssetsModel.PATH_OCTOPUSSY_FRIGHTENED_LEFT),
																assets.getTextures(AssetsModel.PATH_OCTOPUSSY_FRIGHTENED_RIGHT),
																data, 
																stageArea
																);
							view.addChild(hunter);
							//view.addAITile(assets.getTextures(AssetsModel.PATH_OCTOPUSSY_ANGRY_LEFT), AssetsModel.PATH_OCTOPUSSY_ANGRY_LEFT, data, stageArea);
						}
					}
				}
			}
		
			view.addBackgroundMask(assets.getBackgroundMask());
			view.addHudView(assets.getBackgroundHud());
			view.addFriendsListView(assets.getBackgroundFriendsView());
			eventMap.mapListener(eventDispatcher, PlayerEvent.MOVING, playerMovingHandler);
			eventMap.mapListener(eventDispatcher, AIHunterEvent.MOVING, playerMovingHandler);
		}

		private function configureGameOverState():void
		{
				_isPausing = true;
				view.signGameOver = assets.getGameOver();
				view.signGameOver.x = view.tilesView.x + (view.tilesView.width/2 - view.signGameOver.width/2);
				view.signGameOver.y = view.tilesView.y + (view.tilesView.height/2 - view.signGameOver.height/2);
				view.addChild(view.signGameOver);			
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
					if(model.numLives > 1)
					{
						configureLifeLost();
					}
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
