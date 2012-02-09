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
			for each (var data:TileData in levelModel.levels[0].tiles)
			{
				switch(data.type)
				{
					case TileData.TYPE_WALLBRICK:
						view.addTile(assets.getTexture("others/others.swf/0001"),data);
						break;
					case TileData.TYPE_WHITE_POINT:
						view.addTile(assets.getTexture("others/others.swf/0000"),data);
						break;
					case TileData.TYPE_YELLOW_POINT:
						view.addTile(assets.getTexture("others/others.swf/0004"),data);
						break;
				}
			}
		}
	}
}
