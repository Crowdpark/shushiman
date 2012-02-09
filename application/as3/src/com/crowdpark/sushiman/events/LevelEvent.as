package com.crowdpark.sushiman.events
{
	import flash.events.Event;

	/**
	 * @author sandberg
	 */
	public class LevelEvent extends Event
	{
		public static const LOAD:String = "LevelEvent.LOAD";
		
		private var _levelNum:int;
		
		public function LevelEvent(type : String, levelNum:int)
		{
			this.levelNum = levelNum;
			super(type);
		}

		public function get levelNum() : int
		{
			return _levelNum;
		}

		public function set levelNum(levelNum : int) : void
		{
			_levelNum = levelNum;
		}
	}
}
