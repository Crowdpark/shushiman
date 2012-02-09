package com.crowdpark.sushiman.services
{
	import flash.utils.ByteArray;
	import com.crowdpark.core.robotlogger.RobotLoggerEvent;
	import com.crowdpark.sushiman.model.level.LevelModel;
	import org.robotlegs.mvcs.Actor;

	/**
	 * @author sandberg
	 */
	public class LevelService extends Actor implements ILevelService
	{
		[Inject]
		public var model:LevelModel;
		
	    //[Embed(source="data.json",mimeType="application/octet-stream")]
	    //private const JsonData : Class;
		
		
		public function getLevelById(levelNum : int) : void
		{
			//onResult(new JsonData());
		}

		public function onResult(data:Object) : void
		{
			var ba : ByteArray = data as ByteArray;
			
			var msg:String = "Level data received";
			dispatch(new RobotLoggerEvent(RobotLoggerEvent.LOG, RobotLoggerEvent.LEVEL_INFO, LevelService, msg));
		}
	}
}
