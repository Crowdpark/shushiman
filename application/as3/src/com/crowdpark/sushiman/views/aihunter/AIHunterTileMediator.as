package com.crowdpark.sushiman.views.aihunter
{
	import com.crowdpark.sushiman.views.components.AIHunterTile;
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
		
		private var _lastPosition:Point;
		
		override public function onRegister():void
		{
			run();
		}
		
		
		public function run():void
		{
			this.view.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		private function walkRandomDirection():void
		{
			_lastPosition = new Point(view.x, view.y);
			
			var deviation:int = 1;
			var direction:int = int(Math.random()* 4);
			var deviationPt:Point = new Point();

			switch(direction)
			{
				case 0:
					view.x = view.x + AIHunterTileView.SPEED;
					break;
				case 1:
					view.x = view.x - AIHunterTileView.SPEED;;
					break;
				case 2:
					view.y = view.y + AIHunterTileView.SPEED;;
					break;
				case 3:
					view.y = view.y - AIHunterTileView.SPEED;;
					break;
				default:
					break;
					
			}

		}

		private function enterFrameHandler(event : Event) : void
		{
			//walkRandomDirection();
			//dispatch(new AIHunterTileEvent(AIHunterTileEvent.MOVING));
		}
	}
}
