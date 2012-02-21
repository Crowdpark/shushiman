package com.crowdpark.sushiman.views.aihunter
{
	import flash.geom.Point;
	import com.crowdpark.sushiman.utils.GameUtil;
	import org.robotlegs.mvcs.StarlingMediator;

	/**
	 * @author sandberg
	 */
	public class AIHunterMediator extends StarlingMediator
	{
		[Inject]
		public var view:AIHunterView;
		
		private var _lastDirection : String = GameUtil.DIRECTION_DOWN;
		
		override public function onRegister():void
		{
			this.view.currentView = this.view.angryLeft;
			eventMap.mapListener(eventDispatcher, AIHunterEvent.COLLISION_WALL, collisionHandler);
			eventMap.mapListener(eventDispatcher, AIHunterEvent.NO_COLLISION, collisionHandler);
		}
		
		private function collisionHandler(event:AIHunterEvent):void
		{
			if (event.type == AIHunterEvent.COLLISION_WALL)
			{
				moveInNewDirection();
			} else
			{
				moveInOldDirection();
			}
		}
		private function moveInNewDirection() : void
		{
			var newDirection:String = GameUtil.getRandomDirection(_lastDirection);
			move(newDirection);
		}
		
		private function moveInOldDirection():void
		{
			move(_lastDirection);
		}

		private function move(direction:String):void
		{
			//var deviation:Point = GameUtil.getRandomDeviationFromPosition(1);
			var newPosition:Point = new Point(view.x, view.y);
			
			switch(direction)
			{
				case GameUtil.DIRECTION_RIGHT:
					newPosition.x -= AIHunterView.SPEED;
					break;
				case GameUtil.DIRECTION_LEFT:
					newPosition.x += AIHunterView.SPEED;
					break;
				case GameUtil.DIRECTION_UP:
					newPosition.y -= AIHunterView.SPEED;
					break;
				case GameUtil.DIRECTION_DOWN:
					newPosition.y += AIHunterView.SPEED;
					break;
			}
			

			if (newPosition.x >= 0 && newPosition.x <= view.stageArea.width &&
				newPosition.y >= 0 && newPosition.y <= view.stageArea.width)
			{
				view.x = newPosition.x;// + deviation.x;
				view.y = newPosition.y;// + deviation.y;
				_lastDirection = direction;	
			} else
			{
				moveInNewDirection();
			}
		}
	}
}
