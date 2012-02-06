package com.crowdpark.sushiman.model
{
	import org.robotlegs.mvcs.Actor;
	import com.crowdpark.sushiman.model.ISushimanModel;

	/**
	 * @author sandberg
	 */
	public class SushimanModel extends Actor implements ISushimanModel
	{
		public static const INIT_SCORE:int = 0;
		public static const INIT_NUM_LIVES:int = 3;
		public static const INIT_NUM_OCTOPUSSIES:int = 10;
		
		private var _score : int;
		private var _numLives: int;
		private var _numOctopussies:int;
		

		public function resetAllValues():void
		{
			this.score = INIT_SCORE;
			this.numLives = INIT_NUM_LIVES;
			this.numOctopussies = INIT_NUM_OCTOPUSSIES;
		}
		public function get score() : int
		{
			return _score;
		}

		public function set score(score : int) : void
		{
			_score = score;
		}

		public function get numLives() : int
		{
			return _numLives;
		}

		public function set numLives(numLives : int) : void
		{
			_numLives = numLives;
		}

		public function get numOctopussies() : int
		{
			return _numOctopussies;
		}

		public function set numOctopussies(numOctopussies : int) : void
		{
			_numOctopussies = numOctopussies;
		}
	}
}
