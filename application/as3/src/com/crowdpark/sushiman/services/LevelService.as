package com.crowdpark.sushiman.services
{
	import com.crowdpark.sushiman.model.level.Tile;
	import com.crowdpark.sushiman.model.level.Level;

	import flash.utils.ByteArray;

	import com.crowdpark.sushiman.model.level.LevelModel;

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author sandberg
	 */
	public class LevelService extends Actor implements ILevelService
	{
		[Inject]
		public var model : LevelModel;
		[Embed(source="../assets/levels/output/level001.json",mimeType="application/octet-stream")]
		private const JsonData : Class;

		public function getLevelById(levelNum : int) : void
		{
			onResult(new JsonData());
		}

		public function onResult(data : Object) : void
		{
			var ba : ByteArray = data as ByteArray;
			var dataStr : String = ba.readUTFBytes(ba.length);
			var obj : Object = JSON.parse(dataStr);
			if (obj.hasOwnProperty("level") && obj.level != null)
			{
				if (obj.level.fields != null && obj.level.fields is Array)
				{
					var level : Level = new Level();
					level.fields = new Vector.<Tile>();

					for each (var field:Object in obj.level.fields)
					{
						var tile : Tile = new Tile();
						tile.id = field.id;
						tile.type = field.type;
						tile.x = tile.x;
						tile.y = tile.y
						level.fields.push(tile);
					}

					if (obj.level.id != null)
					{
						level.id = obj.level.id;
						model.addLevel(level);
					}
				}
			}
		}
	}
}
