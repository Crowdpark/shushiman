package com.crowdpark.sushiman.views.tiles
{
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
			
		}
	}
}
