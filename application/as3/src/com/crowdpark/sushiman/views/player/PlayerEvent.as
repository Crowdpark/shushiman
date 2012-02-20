package com.crowdpark.sushiman.views.player
{
	import flash.events.Event;

	/**
	 * @author sandberg
	 */
	public class PlayerEvent extends Event
	{
		public static const MOVING : String = "PlayerEvent.MOVING";
		public static const COLLISION : String = "PlayerEvent.COLLISION";
		public static const AI_KILLED : String = "PlayerEvent.AI_KILLED";
		
		private var _assetType:String;
		
		public function PlayerEvent(type : String, assetType:String="")
		{
			this.assetType = assetType;
			super(type);
		}

		public function get assetType() : String
		{
			return _assetType;
		}

		public function set assetType(assetType : String) : void
		{
			_assetType = assetType;
		}
	}
}
