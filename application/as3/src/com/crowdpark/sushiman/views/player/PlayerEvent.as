package com.crowdpark.sushiman.views.player
{
	import com.crowdpark.sushiman.views.components.CollisionObject;

	import flash.events.Event;

	/**
	 * @author sandberg
	 */
	public class PlayerEvent extends Event
	{
		public static const MOVING : String = "PlayerEvent.MOVING";
		public static const COLLISION : String = "PlayerEvent.COLLISION";

		private var _collisionObject : CollisionObject;

		public function PlayerEvent(type : String, collisionObject : CollisionObject = null)
		{
			this.collisionObject = collisionObject;

			super(type);
		}

		public function get collisionObject() : CollisionObject
		{
			return _collisionObject;
		}

		public function set collisionObject(collisionObject : CollisionObject) : void
		{
			_collisionObject = collisionObject;
		}
	}
}
