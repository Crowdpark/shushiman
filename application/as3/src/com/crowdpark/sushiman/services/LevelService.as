package com.crowdpark.sushiman.services
{
	import com.crowdpark.sushiman.model.level.LevelModel;
	import org.robotlegs.mvcs.Actor;

	/**
	 * @author sandberg
	 */
	public class LevelService extends Actor implements ILevelService
	{
		[Inject]
		public var model:LevelModel;
		
		public function getLevelById(levelNum : int) : void
		{		
		}

		public function onResult(data:Object) : void
		{

		}
	}
}
