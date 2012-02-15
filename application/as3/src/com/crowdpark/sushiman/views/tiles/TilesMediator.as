package com.crowdpark.sushiman.views.tiles
{
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.events.LevelEvent;
	import com.crowdpark.sushiman.model.level.TileData;
	import com.crowdpark.sushiman.model.AssetsModel;
	import com.crowdpark.sushiman.model.level.LevelModelEvent;
	import com.crowdpark.sushiman.model.level.LevelProxy;
	import org.robotlegs.mvcs.StarlingMediator;

	/**
	 * @author sandberg
	 */
	public class TilesMediator extends StarlingMediator
	{
		[Inject]
		public var view:TilesView;
		
		[Inject]
		public var model:ISushimanModel;
		
		[Inject]
		public var levelModel:LevelProxy;
		
		[Inject]
		public var assets:AssetsModel;
		
		override public function onRegister():void
		{
			this.eventMap.mapListener(this.eventDispatcher, LevelModelEvent.UPDATED, levelUpdatedHandler);
			
			this.dispatch(new LevelEvent(LevelEvent.LOAD, levelModel.currentLevelNum));
		}

		private function levelUpdatedHandler(event: LevelModelEvent ) : void
		{
			for each (var data:TileData in levelModel.currentLevel.tiles)
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
