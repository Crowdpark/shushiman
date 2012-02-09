package com.crowdpark.sushiman.commands
{
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
			model.updateScoreByCollisionObject(event.collisionObject);
			service.setScore(model.score);
		}
	}
}
