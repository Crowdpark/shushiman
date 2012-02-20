package com.crowdpark.sushiman.views.aihunter
{
	import com.crowdpark.sushiman.views.player.PlayerEvent;
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
		
		private var _lastDirection : String = GameUtil.DIRECTION_DOWN;//"";
		
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
			var deviation:Point = GameUtil.getRandomDeviationFromPosition(1);
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
			
			newPosition.x += deviation.x;
			newPosition.y += deviation.y;

			if (newPosition.x > view.stageArea.x &&
				newPosition.x < view.stageArea.x + view.stageArea.width &&
				newPosition.y > view.stageArea.y &&
				newPosition.y < view.stageArea.y + view.stageArea.height)
			{
				view.x = newPosition.x;
				view.y = newPosition.y;
				_lastDirection = direction;	
			} else
			{
				moveInNewDirection();
			}
		}
	}
}
