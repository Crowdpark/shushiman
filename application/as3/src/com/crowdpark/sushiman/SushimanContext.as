package com.crowdpark.sushiman
{
	import com.crowdpark.sushiman.views.aihunter.AIHunterMediator;
	import com.crowdpark.sushiman.views.aihunter.AIHunterView;
	import com.crowdpark.sushiman.commands.ShowLeaderboardCommand;
	import com.crowdpark.sushiman.views.friends.FriendsListMediator;
	import com.crowdpark.sushiman.views.friends.FriendsListView;
	import com.crowdpark.sushiman.commands.LoadLevelCommand;
	import com.crowdpark.sushiman.events.LevelEvent;
	import com.crowdpark.core.robotlogger.IRobotLoggerService;
	import com.crowdpark.core.robotlogger.RobotLoggerCommand;
	import com.crowdpark.core.robotlogger.RobotLoggerEvent;
	import com.crowdpark.core.robotlogger.RobotLoggerTraceService;
	import com.crowdpark.sushiman.commands.LeaderboardCommand;
	import com.crowdpark.sushiman.commands.PlayGameCommand;
	import com.crowdpark.sushiman.commands.ScoreCommand;
	import com.crowdpark.sushiman.commands.StartupCommand;
	import com.crowdpark.sushiman.model.AssetsModel;
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.model.SushimanModel;
	import com.crowdpark.sushiman.model.level.LevelProxy;
	import com.crowdpark.sushiman.model.user.UserAppFriendsModel;
	import com.crowdpark.sushiman.model.user.UserVo;
	import com.crowdpark.sushiman.services.EmbeddedLevelService;
	import com.crowdpark.sushiman.services.MockLeaderboardService;
	import com.crowdpark.sushiman.services.ScoreService;
	import com.crowdpark.sushiman.services.UserService;
	import com.crowdpark.sushiman.services.interfaces.ILeaderboardService;
	import com.crowdpark.sushiman.services.interfaces.ILevelService;
	import com.crowdpark.sushiman.services.interfaces.IScoreService;
	import com.crowdpark.sushiman.services.interfaces.IUserService;
	import com.crowdpark.sushiman.views.hud.HudMediator;
	import com.crowdpark.sushiman.views.hud.HudView;
	import com.crowdpark.sushiman.views.leaderboard.LeaderboardEvent;
	import com.crowdpark.sushiman.views.leaderboard.LeaderboardMediator;
	import com.crowdpark.sushiman.views.leaderboard.LeaderboardView;
	import com.crowdpark.sushiman.views.main.MainContainerEvent;
	import com.crowdpark.sushiman.views.main.MainContainerMediator;
	import com.crowdpark.sushiman.views.main.MainContainerView;
	import com.crowdpark.sushiman.views.player.PlayerEvent;
	import com.crowdpark.sushiman.views.player.PlayerMediator;
	import com.crowdpark.sushiman.views.player.PlayerView;
	import com.crowdpark.sushiman.views.tiles.TilesMediator;
	import com.crowdpark.sushiman.views.tiles.TilesView;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.StarlingContext;
	import starling.display.DisplayObjectContainer;



	/**
	 * @author sandberg
	 */
	public class SushimanContext extends StarlingContext
	{
		public function SushimanContext(contextView : DisplayObjectContainer = null, autoStartup : Boolean = true) : void
		{
			super(contextView, autoStartup);
		}

		override public function startup() : void
		{
			// model
			this.injector.mapSingletonOf(ISushimanModel, SushimanModel);
			this.injector.mapSingleton(AssetsModel);
			this.injector.mapSingleton(UserVo);
			this.injector.mapSingleton(UserAppFriendsModel);
			this.injector.mapSingleton(LevelProxy);
			
			// services
			this.injector.mapSingletonOf(IScoreService, ScoreService);
			this.injector.mapSingletonOf(ILeaderboardService, MockLeaderboardService);
			//this.injector.mapSingletonOf(ILevelService, LevelService);
			this.injector.mapSingletonOf(ILevelService, EmbeddedLevelService);
			this.injector.mapSingletonOf(IUserService, UserService);
			this.injector.mapSingletonOf(IRobotLoggerService, RobotLoggerTraceService);

			// view & mediatorsr
			this.mediatorMap.mapView(MainContainerView, MainContainerMediator);
			this.mediatorMap.mapView(HudView, HudMediator);
			this.mediatorMap.mapView(LeaderboardView, LeaderboardMediator);
			this.mediatorMap.mapView(PlayerView, PlayerMediator);
			this.mediatorMap.mapView(AIHunterView, AIHunterMediator);
			this.mediatorMap.mapView(TilesView, TilesMediator);
			this.mediatorMap.mapView(FriendsListView, FriendsListMediator);

			// events & commands
			this.commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCommand);
			this.commandMap.mapEvent(PlayerEvent.COLLISION, ScoreCommand);
			this.commandMap.mapEvent(LevelEvent.LOAD, LoadLevelCommand);
			this.commandMap.mapEvent(LeaderboardEvent.GET_ALL_USERS_LEADERBOARD, LeaderboardCommand);
			this.commandMap.mapEvent(LeaderboardEvent.GET_FRIENDS_LEADERBOARD, LeaderboardCommand);
			this.commandMap.mapEvent(MainContainerEvent.PLAY, PlayGameCommand);
			this.commandMap.mapEvent(RobotLoggerEvent.LOG, RobotLoggerCommand);
			this.commandMap.mapEvent(LeaderboardEvent.SHOW_LEADERBOARD, ShowLeaderboardCommand);

			super.startup();
		}
	}
}
