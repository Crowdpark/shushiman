package com.crowdpark.sushiman.views.main 
{
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
		
		private function checkCollision() : void
		{
			
		}

		private function configurePauseState() : void
		{
			view.stage.removeEventListener(Event.ENTER_FRAME, gameLoop);
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
			view.stage.addEventListener(Event.ENTER_FRAME, gameLoop);
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
			checkCollision();
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