package com.crowdpark.sushiman.commands
{
	import com.crowdpark.sushiman.events.LevelEvent;
	import com.crowdpark.sushiman.events.FacebookEvent;
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.model.gamestate.GameState;
	import com.crowdpark.sushiman.services.IUserService;
	import com.crowdpark.sushiman.views.hud.HudEvent;
	import com.crowdpark.sushiman.views.main.MainContainerEvent;

	import org.robotlegs.mvcs.StarlingCommand;

	/**
	 * @author sandberg
	 */
	public class StartupCommand extends StarlingCommand
	{
		[Inject]
		public var model : ISushimanModel;
		[Inject]
		public var service : IUserService;

		override public function execute() : void
		{
			this.dispatch(new FacebookEvent(FacebookEvent.LOGIN));
			this.dispatch(new LevelEvent(LevelEvent.LOAD, 1));
			service.getInitialData();
			this.dispatch(new MainContainerEvent(MainContainerEvent.INIT));
			this.dispatch(new HudEvent(HudEvent.INIT));
			model.currentGameState = GameState.INIT;
		}
	}
}
