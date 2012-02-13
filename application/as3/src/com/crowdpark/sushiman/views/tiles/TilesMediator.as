package com.crowdpark.sushiman.views.tiles
{
	import com.crowdpark.sushiman.events.LevelEvent;
	import com.crowdpark.sushiman.model.level.TileData;
	import com.crowdpark.sushiman.model.AssetsModel;
	import com.crowdpark.sushiman.model.level.LevelModelEvent;
	import com.crowdpark.sushiman.model.level.LevelModel;
	import org.robotlegs.mvcs.StarlingMediator;

	/**
	 * @author sandberg
	 */
	public class TilesMediator extends StarlingMediator
	{
		[Inject]
		public var view:TilesView;
		
		[Inject]
		public var levelModel:LevelModel;
		
		[Inject]
		public var assets:AssetsModel;
		
		override public function onRegister():void
		{
			this.eventMap.mapListener(this.eventDispatcher, LevelModelEvent.UPDATED, levelUpdatedHandler);
			
			this.dispatch(new LevelEvent(LevelEvent.LOAD, 1));
		}

		private function levelUpdatedHandler(event: LevelModelEvent ) : void
		{
			
//			var whiteData:TileData = new TileData();
//			whiteData.type = TileData.TYPE_WHITE_POINT;
//			whiteData.colId = 10;
//			whiteData.rowId = 10;
//			view.addTile(AssetsModel.PATH_WHITE, assets.getTexture(AssetsModel.PATH_WHITE),whiteData);
//			
//			var wallData:TileData = new TileData();
//			wallData.type = TileData.TYPE_WALLBRICK;
//			wallData.colId = 15;
//			wallData.rowId = 6;
//			view.addTile(AssetsModel.PATH_WALL, assets.getTexture(AssetsModel.PATH_WALL),wallData);
			
			for each (var data:TileData in levelModel.levels[0].tiles)
			{
				switch(data.type)
				{
					case TileData.TYPE_WALLBRICK:
						view.addTile(AssetsModel.PATH_WALL, assets.getTexture(AssetsModel.PATH_WALL),data);
						break;
					case TileData.TYPE_WHITE_POINT:
						view.addTile(AssetsModel.PATH_WHITE, assets.getTexture(AssetsModel.PATH_WHITE),data);
						break;
					case TileData.TYPE_YELLOW_POINT:
						view.addTile(AssetsModel.PATH_YELLOW, assets.getTexture(AssetsModel.PATH_YELLOW),data);
						break;
					default:
						break;
				}
			}
		}
	}
}
