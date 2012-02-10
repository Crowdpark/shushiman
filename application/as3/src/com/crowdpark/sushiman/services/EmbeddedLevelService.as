package com.crowdpark.sushiman.services
{
	import com.crowdpark.sushiman.model.level.Level;
	import com.crowdpark.sushiman.model.level.LevelModel;
	import com.crowdpark.sushiman.model.level.TileData;
	import com.crowdpark.sushiman.services.interfaces.ILevelService;

	import org.robotlegs.mvcs.Actor;

	import flash.utils.ByteArray;

	/**
	 * @author sandberg
	 */
	public class EmbeddedLevelService extends Actor implements ILevelService
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
					level.tiles = new Vector.<TileData>();

					for each (var field:Object in obj.level.fields)
					{
						var tile : TileData = new TileData();
						tile.id = int(field.id);
						tile.type = field.type;
						tile.x = int(field.x);
						tile.y = (field.y);
						level.tiles.push(tile);
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