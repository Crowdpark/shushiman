package com.crowdpark.sushiman
{
	import starling.display.DisplayObjectContainer;

	import com.crowdpark.core.robotlogger.IRobotLoggerService;
	import com.crowdpark.core.robotlogger.RobotLoggerCommand;
	import com.crowdpark.core.robotlogger.RobotLoggerEvent;
	import com.crowdpark.core.robotlogger.RobotLoggerTraceService;
	import com.crowdpark.sushiman.commands.FacebookLoginCommand;
	import com.crowdpark.sushiman.commands.LeaderboardCommand;
	import com.crowdpark.sushiman.commands.LoadLevelCommand;
	import com.crowdpark.sushiman.commands.PlayGameCommand;
	import com.crowdpark.sushiman.commands.ScoreCommand;
	import com.crowdpark.sushiman.commands.StartupCommand;
	import com.crowdpark.sushiman.events.FacebookEvent;
	import com.crowdpark.sushiman.events.LevelEvent;
	import com.crowdpark.sushiman.model.AssetsModel;
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.model.SushimanModel;
	import com.crowdpark.sushiman.model.level.LevelModel;
	import com.crowdpark.sushiman.model.user.UserAppFriendsModel;
	import com.crowdpark.sushiman.model.user.UserVo;
	import com.crowdpark.sushiman.services.ILeaderboardService;
	import com.crowdpark.sushiman.services.ILevelService;
	import com.crowdpark.sushiman.services.IScoreService;
	import com.crowdpark.sushiman.services.IUserService;
	import com.crowdpark.sushiman.services.LevelService;
	import com.crowdpark.sushiman.services.MockLeaderboardService;
	import com.crowdpark.sushiman.services.ScoreService;
	import com.crowdpark.sushiman.services.UserService;
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

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.StarlingContext;

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
			this.injector.mapSingleton(LevelModel);

			// services
			this.injector.mapSingletonOf(IScoreService, ScoreService);
			this.injector.mapSingletonOf(ILeaderboardService, MockLeaderboardService);
			this.injector.mapSingletonOf(ILevelService, LevelService);
			this.injector.mapSingletonOf(IUserService, UserService);
			this.injector.mapSingletonOf(IRobotLoggerService, RobotLoggerTraceService);

			// view & mediatorsr
			this.mediatorMap.mapView(MainContainerView, MainContainerMediator);
			this.mediatorMap.mapView(HudView, HudMediator);
			this.mediatorMap.mapView(LeaderboardView, LeaderboardMediator);
			this.mediatorMap.mapView(PlayerView, PlayerMediator);

			// events & commands
			this.commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCommand);
			this.commandMap.mapEvent(PlayerEvent.COLLISION, ScoreCommand);
			this.commandMap.mapEvent(FacebookEvent.LOGIN, FacebookLoginCommand);
			this.commandMap.mapEvent(LevelEvent.LOAD, LoadLevelCommand);
			this.commandMap.mapEvent(LeaderboardEvent.GET_ALL_USERS_LEADERBOARD, LeaderboardCommand);
			this.commandMap.mapEvent(LeaderboardEvent.GET_FRIENDS_LEADERBOARD, LeaderboardCommand);
			this.commandMap.mapEvent(MainContainerEvent.PLAY, PlayGameCommand);
			this.commandMap.mapEvent(RobotLoggerEvent.LOG, RobotLoggerCommand);

			super.startup();
		}
	}
}