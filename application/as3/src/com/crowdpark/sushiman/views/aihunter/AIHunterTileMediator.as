package com.crowdpark.sushiman.views.aihunter
{

	import com.crowdpark.sushiman.utils.GameUtil;
	import flash.geom.Point;
	import starling.events.Event;
	import org.robotlegs.mvcs.StarlingMediator;
	/**

	 * @author szalwinski
	 */
	 
	public class AIHunterTileMediator extends StarlingMediator
	{

		
		[Inject]
		public var view:AIHunterTileView;
		


		
		override public function onRegister():void
		{
			//eventMap.mapListener(eventDispatcher, AIHunterTileEvent.COLLISION_BORDER, borderHandler);
			run();
		}

		public function run():void
		{
			//this.view.stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
//		private function borderHandler(event:AIHunterTileEvent) : void
//		{
//			_isLastDirectionForbidden = true;
//		}
		

	}
}
