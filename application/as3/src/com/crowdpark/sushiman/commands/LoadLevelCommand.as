package com.crowdpark.sushiman.commands
{
	import com.crowdpark.sushiman.services.ILevelService;
	import com.crowdpark.sushiman.events.LevelEvent;

	import org.robotlegs.mvcs.StarlingCommand;

	/**
	 * @author sandberg
	 */
	public class LoadLevelCommand extends StarlingCommand
	{
		[Inject]
		public var event : LevelEvent;
		[Inject]
		public var service : ILevelService;

		override public function execute() : void
		{
			service.getLevelById(event.levelNum);
		}
	}
}
