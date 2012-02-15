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

					var rowLength : int = (obj.level.fields as Array).length;
					for (var i : int = 0; i < rowLength;i++)
					{
						var field : Array = (obj.level.fields as Array)[i];
						var colLength : int = field.length;
						for (var j : int = 0;j < colLength;j++) 
						{
							var tileData : Object = field[j];
							var tile : TileData = new TileData();
							tile.id = tileData.id;
							tile.type = tileData.type;
							tile.rowId = i + 1;
							tile.colId = j + 1;
							level.tiles.push(tile);
						}
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
