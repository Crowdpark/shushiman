package com.crowdpark.sushiman.services
{
	import com.crowdpark.sushiman.model.level.Level;
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
		
	    [Embed(source="../assets/levels/output/level001.json",mimeType="application/octet-stream")]
	    private const JsonData : Class;
		
		
		public function getLevelById(levelNum : int) : void
		{
			onResult(new JsonData());
		}

		public function onResult(data:Object) : void
		{
			var ba : ByteArray = data as ByteArray;
			var dataStr:String = ba.readUTFBytes(ba.length);
			var obj:Object = JSON.parse(dataStr);
			if (obj.hasOwnProperty("level") && obj.level != null)
			{
				if (obj.level.fields != null && obj.level.fields is Array)
				{
					var level:Level = new Level();
					level.fields = obj.level.fields;
					if (obj.level.id != null)
					{
						level.id = obj.level.id;
						model.addLevel(level);
					}
				}
			}
			
//			level.fields = obj.fields;
//			level.id = obj.id;
			
			
			var msg:String = "Level data received";
			dispatch(new RobotLoggerEvent(RobotLoggerEvent.LOG, RobotLoggerEvent.LEVEL_INFO, LevelService, msg));
		}
	}
}
