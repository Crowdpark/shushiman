package com.crowdpark.sushiman.commands
{
	import com.crowdpark.sushiman.model.gamestate.GameState;
	import com.crowdpark.sushiman.model.ISushimanModel;
	import org.robotlegs.mvcs.StarlingCommand;

	/**
	 * @author sandberg
	 */
	public class ShowLeaderboardCommand extends StarlingCommand
	{
		[Inject]
		public var model:ISushimanModel;
		
		override public function execute():void
		{
			model.currentGameState = GameState.PAUSED;
		}
	}
}
