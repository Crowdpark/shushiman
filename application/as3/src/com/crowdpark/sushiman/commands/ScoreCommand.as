package com.crowdpark.sushiman.commands
{
	import com.crowdpark.sushiman.model.SushimanModel;
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.services.interfaces.IScoreService;
	import com.crowdpark.sushiman.views.player.PlayerEvent;
	import org.robotlegs.mvcs.StarlingCommand;


	/**
	 * @author sandberg
	 */
	public class ScoreCommand extends StarlingCommand
	{
		[Inject]
		public var model : ISushimanModel;
		[Inject]
		public var event : PlayerEvent;
		[Inject]
		public var service : IScoreService;

		override public function execute() : void
		{
			if (event.type == PlayerEvent.COLLISION)
			{
				model.updateScoreByCollisionObject(event.assetType);
							
			} else if (event.type == PlayerEvent.AI_KILLED)
			{
				model.score += SushimanModel.KILLING_AI_SCORE;
			}
			service.setScore(model.score);	

		}
	}
}
