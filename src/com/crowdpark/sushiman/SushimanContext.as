package com.crowdpark.sushiman
{
	import com.crowdpark.sushiman.views.leaderboard.LeaderboardMediator;
	import com.crowdpark.sushiman.views.leaderboard.LeaderboardView;
	import com.crowdpark.sushiman.commands.ScoreCommand;
	import com.crowdpark.sushiman.events.ScoreEvent;
	import com.crowdpark.sushiman.services.ScoreService;
	import com.crowdpark.sushiman.services.IScoreService;
	import com.crowdpark.sushiman.views.hud.HudMediator;
	import com.crowdpark.sushiman.views.hud.HudView;
	import com.crowdpark.sushiman.model.SushimanModel;
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.services.UserService;
	import starling.display.DisplayObjectContainer;
	import com.crowdpark.sushiman.commands.StartupCommand;
	import com.crowdpark.sushiman.views.main.MainContainerView;
	import com.crowdpark.sushiman.views.main.MainContainerMediator;

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
			this.injector.mapSingletonOf(ISushimanModel, SushimanModel);
			this.injector.mapSingletonOf(IScoreService, ScoreService);
			this.injector.mapSingleton(UserService);

			this.mediatorMap.mapView(MainContainerView, MainContainerMediator);
			this.mediatorMap.mapView(HudView, HudMediator);
			this.mediatorMap.mapView(LeaderboardView, LeaderboardMediator);

			this.commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCommand);
			this.commandMap.mapEvent(ScoreEvent.UPDATE, ScoreCommand);

			super.startup();
		}
	}
}
