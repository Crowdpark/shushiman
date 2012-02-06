package com.crowdpark.sushiman.commands
{
	import org.robotlegs.mvcs.StarlingCommand;
	import com.crowdpark.sushiman.services.IScoreService;
	import com.crowdpark.sushiman.events.ScoreEvent;
	import com.crowdpark.sushiman.model.ISushimanModel;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author sandberg
	 */
	public class ScoreCommand extends StarlingCommand
	{
		[Inject]
		public var model:ISushimanModel;
		[Inject]
		public var event:ScoreEvent;
		[Inject]
		public var service:IScoreService;
		
		override public function execute():void
		{
			model.updateScoreByCollisionObject(event.collisionObject);
			service.setScore(model.score);
		}
	}
}
