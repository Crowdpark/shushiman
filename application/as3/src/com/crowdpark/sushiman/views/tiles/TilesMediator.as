package com.crowdpark.sushiman.views.tiles
{
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
		
		override public function onRegister():void
		{
			this.eventMap.mapListener(this.eventDispatcher, LevelModelEvent.UPDATED, levelUpdatedHandler);
		}

		private function levelUpdatedHandler(event: LevelModelEvent ) : void
		{
			
		}
	}
}
