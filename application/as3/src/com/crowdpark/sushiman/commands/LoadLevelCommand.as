package com.crowdpark.sushiman.commands
{
	import com.crowdpark.sushiman.services.interfaces.ILevelService;
	import com.crowdpark.sushiman.events.LevelEvent;
	import org.robotlegs.mvcs.StarlingCommand;

	/**
	 * @author sandberg
	 */
	public class LoadLevelCommand extends StarlingCommand
	{
		[Inject]
		public var service:ILevelService;
		[Inject]
		public var event:LevelEvent;
		
		override public function execute():void
		{
			service.getLevelById(event.levelNum);
		}
	}
}
