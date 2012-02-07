package com.crowdpark.sushiman.events
{
	import flash.events.Event;

	/**
	 * @author sandberg
	 */
	public class PlayerEvent extends Event
	{
		public static const UPDATE:String = "ScoreEvent.UPDATE";

		private var _collisionObject:Class;
		
		public function PlayerEvent(type : String, collisionObject:Class)
		{
			this.collisionObject = collisionObject;
			
			super(type);
		}

		public function get collisionObject() : Class
		{
			return _collisionObject;
		}

		public function set collisionObject(collisionObject : Class) : void
		{
			_collisionObject = collisionObject;
		}

	}
}
