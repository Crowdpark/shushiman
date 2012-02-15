package com.crowdpark.sushiman.views.main
{
	import starling.events.Event;

	import com.crowdpark.sushiman.model.AssetsModel;
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.model.gamestate.GameState;
	import com.crowdpark.sushiman.model.gamestate.GameStateChangedEvent;
	import com.crowdpark.sushiman.model.level.LevelModel;
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
		public var levelModel:LevelModel;

		override public function onRegister() : void
		{
			view.x = 0;
			view.addBackgroundImage(assets.getBackgroundImage());
			view.addLogo(assets.getCrowdparkLogo());
			view.addPlayButton(assets.getPlayButtonTexture());
			eventMap.mapListener(this.eventDispatcher, GameStateChangedEvent.CHANGE, gamestateChangeHandler);
			eventMap.mapListener(this.eventDispatcher, LeaderboardEvent.SHOW_LEADERBOARD, openLeaderBoardHandler);
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
		
		private function configureLeaderBoard():void
		{
			view.leaderBoard = new LeaderboardView();
			view.addChild(view.leaderBoard);
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
					//view.addAITile(assets.getTextures(AssetsModel.PATH_OCTOPUSSY), AssetsModel.PATH_OCTOPUSSY, data);
				}
			} 
			
			view.addHudView(assets.getBackgroundHud());
			view.addFriendsListView();
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

		private function openLeaderBoardHandler(event:LeaderboardEvent):void
		{
			configureLeaderBoard();		
		}
		 
		private function checkCollision() : void
		{
			if (view.player)
			{
				trace(Math.floor((view.player.x + view.player.width/2) / levelModel.currentLevel.numColumns));
				trace(Math.floor((view.player.y + view.player.height/2) / levelModel.currentLevel.numRows));
			}
		}
	}
}
