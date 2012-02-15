package com.crowdpark.sushiman.model.level
{
	import com.crowdpark.core.robotlogger.RobotLoggerEvent;

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author sandberg
	 */
	public class LevelModel extends Actor
	{
		private var _levels : Vector.<Level> = new Vector.<Level>();;
		private var _number:int = 0;

		public function addLevel(level : Level) : void
		{
			_levels.push(level);
			var msg : String = "Level data received, including num tiles: " + level.tiles.length.toString();
			dispatch(new RobotLoggerEvent(RobotLoggerEvent.LOG, RobotLoggerEvent.LEVEL_INFO, LevelModel, msg));
			dispatch(new LevelModelEvent(LevelModelEvent.UPDATED));
		}

		public function get levels() : Vector.<Level>
		{
			return _levels;
		}
		
		public function get currentLevel():Level
		{
			return this.levels[this.currentLevelNum];
		}

		public function set levels(levels : Vector.<Level>) : void
		{
			_levels = levels;
		}

		public function get currentLevelNum() : int
		{
			return _number;
		}

		public function set currentLevelNum(currentLevelNum : int) : void
		{
			if (currentLevelNum < this.levels.length)
			{
				_number = currentLevelNum;
			} 
			else
			{
				dispatch(new RobotLoggerEvent(RobotLoggerEvent.LOG, RobotLoggerEvent.LEVEL_FATAL, LevelModel, "No more levels!"));
			}
		}
	}
}
