package com.crowdpark.sushiman.events
{
	import com.crowdpark.sushiman.views.components.CollisionObject;
	import flash.events.Event;

	/**
	 * @author sandberg
	 */
	public class PlayerEvent extends Event
	{
		public static const UPDATE:String = "PlayerEvent.UPDATE";
		public static const LEVEL_COMPLETE:String = "PlayerEvent.LEVEL_COMPLETE";

		private var _collisionObject:CollisionObject;
		
		public function PlayerEvent(type : String, collisionObject:CollisionObject=null)
		{
			this.collisionObject = collisionObject;
			
			super(type);
		}

		public function get collisionObject() :CollisionObject
		{
			return _collisionObject;
		}

		public function set collisionObject(collisionObject : CollisionObject ): void
		{
			_collisionObject = collisionObject;
		}

	}
}
