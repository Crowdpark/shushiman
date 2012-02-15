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
			if (model.currentGameState == GameState.PLAYING)
			{
				model.currentGameState = GameState.PAUSED;
			} else if(model.currentGameState == GameState.PAUSED)
			{
				model.currentGameState = GameState.PLAYING;
			}
			
		}
	}
}
