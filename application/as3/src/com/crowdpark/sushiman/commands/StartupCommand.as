package com.crowdpark.sushiman.commands
{
	import com.crowdpark.sushiman.services.interfaces.ILevelService;
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.model.gamestate.GameState;
	import com.crowdpark.sushiman.services.interfaces.IUserService;
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
		public var userService : IUserService;
		[Inject]
		public var levelService: ILevelService;

		override public function execute() : void
		{
			userService.getInitialData();
			levelService.getLevelById(1);
			
			this.dispatch(new MainContainerEvent(MainContainerEvent.INIT));
			this.dispatch(new HudEvent(HudEvent.INIT));
			
			model.currentGameState = GameState.INIT;
		}
	}
}
