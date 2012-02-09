package com.crowdpark.sushiman.model.level
{
	import org.robotlegs.mvcs.Actor;

	/**
	 * @author sandberg
	 */
	public class LevelModel extends Actor
	{
		private var _levels : Vector.<Level>;

		public function addLevel(level:Level):void
		{
			if (_levels == null)
			{
				_levels = new Vector.<Level>();
			}
			_levels.push(level);
		}
		public function get levels() : Vector.<Level>
		{
			return _levels;
		}

		public function set levels(levels : Vector.<Level>) : void
		{
			_levels = levels;
		}
	}
}
