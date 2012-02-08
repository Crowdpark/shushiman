package com.crowdpark.sushiman.model.gamestate
{
	import flash.events.Event;

	/**
	 * @author sandberg
	 */
	public class GameStateChangedEvent extends Event
	{
		public static const CHANGE : String = "GameStateEvent.CHANGE";
		private var _state : String;

		public function GameStateChangedEvent(type : String, state : String)
		{
			this.state = state;
			super(type);
		}

		public function get state() : String
		{
			return _state;
		}

		public function set state(state : String) : void
		{
			_state = state;
		}
	}
}
