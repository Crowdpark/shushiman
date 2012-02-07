package com.crowdpark.sushiman.model
{
	import com.crowdpark.sushiman.views.components.SimplePill;

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author sandberg
	 */
	public class SushimanModel extends Actor implements ISushimanModel
	{
		public static const INIT_SCORE : int = 0;
		public static const INIT_NUM_LIVES : int = 3;
		public static const INIT_NUM_OCTOPUSSIES : int = 10;
		private var _currentGameLevel : int;
		private var _score : int;
		private var _numLives : int;
		private var _numOctopussies : int;

		public function resetAllValues() : void
		{
			this.score = INIT_SCORE;
			this.numLives = INIT_NUM_LIVES;
			this.numOctopussies = INIT_NUM_OCTOPUSSIES;
		}

		public function updateScoreByCollisionObject(collisionObject : Class) : void
		{
			switch(collisionObject)
			{
				case SimplePill:
					this.score++;
					break;
				default:
					break;
			}
		}

		public function get score() : int
		{
			return _score;
		}

		public function set score(score : int) : void
		{
			_score = score;
			dispatch(new SushimanModelEvent(SushimanModelEvent.UPDATED_SCORE));
		}

		public function get numLives() : int
		{
			return _numLives;
		}

		public function set numLives(numLives : int) : void
		{
			_numLives = numLives;
			dispatch(new SushimanModelEvent(SushimanModelEvent.UPDATED_NUM_LIVES));
		}

		public function get numOctopussies() : int
		{
			return _numOctopussies;
		}

		public function set numOctopussies(numOctopussies : int) : void
		{
			_numOctopussies = numOctopussies;
			dispatch(new SushimanModelEvent(SushimanModelEvent.UPDATED_NUM_OCTOPUSSIES));
		}

		public function get currentGameLevel() : int
		{
			return _currentGameLevel;
		}

		public function set currentGameLevel(currentGameLevel : int) : void
		{
			_currentGameLevel = currentGameLevel;
		}
	}
}
