package com.crowdpark.sushiman.views.aihunter
{
	import com.crowdpark.sushiman.utils.GameUtil;
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
		private var _lastDirection:String = "";
		
		override public function onRegister():void
		{
			run();
		}
		
		
		public function run():void
		{
			this.view.stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		

		private function enterFrameHandler(event : Event) : void
		{
			_lastPosition = new Point(view.x, view.y);
			
			// continue last direction if no collision is detected
			if ( _lastDirection.length == 0) 
			{
				var newDirection:String = GameUtil.getRandomDirection();
			} else
			{
				newDirection = _lastDirection; 
			}
			
				switch(newDirection)
				{
					case GameUtil.DIRECTION_RIGHT:
						view.x -= AIHunterTileView.SPEED;
						break;
					case GameUtil.DIRECTION_LEFT:
						view.x += AIHunterTileView.SPEED;
						break;
					case GameUtil.DIRECTION_UP:
						view.y -= AIHunterTileView.SPEED;
						break;
					case GameUtil.DIRECTION_DOWN:
						view.y += AIHunterTileView.SPEED;
						break;
				}	
				
				_lastDirection = newDirection;			


			//dispatch(new AIHunterTileEvent(AIHunterTileEvent.MOVING));
		}
	}
}
