package com.crowdpark.sushiman.views.main
{
	import com.crowdpark.sushiman.model.gamestate.GameState;
	import com.crowdpark.sushiman.model.gamestate.GameStateEvent;
	import com.crowdpark.sushiman.views.leaderboard.LeaderboardView;
	import com.crowdpark.sushiman.model.AssetsModel;
	import com.crowdpark.sushiman.views.components.PillSmall;
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

		override public function onRegister() : void
		{
			view.addBackgroundImage(assets.getBackgroundImage());
			view.addLogo(assets.getCrowdparkLogo());
			view.addPlayer(assets.getTextures("hero/knife_right/"));

			this.eventMap.mapListener(this.eventDispatcher, PlayerEvent.MOVING, playerMovingHandler);
			eventMap.mapListener(this.eventDispatcher, GameStateEvent.CHANGE, gamestateChangeHandler);
		}

		private function gamestateChangeHandler(event : GameStateEvent) : void
		{
			switch(event.state)
			{
				case GameState.INIT:
					configureInitState();
					break;
				case GameState.PLAY:
					configurePlayState();
					break;
				case GameState.GAME_OVER:
					configureGameOverState();
					break;
			}
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
			// for now we just pretend to eat a pill in order to trigger the scoring system
			if (view.pills.length > 0)
			{
				var pill : PillSmall = view.pills[0];
				dispatch(new PlayerEvent(PlayerEvent.UPDATE, pill));
				view.removePillSmall(pill);
			}
			else
			{
				dispatch(new PlayerEvent(PlayerEvent.LEVEL_COMPLETE));
			}
		}
	}
}
