package com.crowdpark.sushiman.model.gamestate
{
	import flash.events.Event;

	/**
	 * @author sandberg
	 */
	public class GameStateChangedEvent extends Event
	{
		public static const CHANGE : String = "GameStateEvent.CHANGE";
		private var _newState : String;
		private var _previousState:String;

		public function GameStateChangedEvent(type : String, newState : String, previousState:String)
		{
			_newState = newState;
			_previousState = previousState;
			super(type);
		}

		public function get newState() : String
		{
			return _newState;
		}

		public function set newState(newState : String) : void
		{
			_newState = newState;
		}

		public function get previousState() : String
		{
			return _previousState;
		}

		public function set previousState(previousState : String) : void
		{
			_previousState = previousState;
		}
	}
}
