package com.crowdpark.sushiman.model
{
	import com.crowdpark.sushiman.views.components.SimplePill;
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
		
		private var _currentGameLevel:int;
		private var _score : int;
		private var _numLives: int;
		private var _numOctopussies:int;
		private var _leaderboardFriends:Vector.<User>;
		private var _leaderboardAll:Vector.<User>;
		

		public function resetAllValues():void
		{
			this.score = INIT_SCORE;
			this.numLives = INIT_NUM_LIVES;
			this.numOctopussies = INIT_NUM_OCTOPUSSIES;
		}
		
		public function updateScoreByCollisionObject(collisionObject:Class):void
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
			if (numLives<=0)
			{
				dispatch(new SushimanModelEvent(SushimanModelEvent.GAME_OVER));
			}
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

		public function get leaderboardFriends() : Vector.<User>
		{
			return _leaderboardFriends;
		}

		public function set leaderboardFriends(leaderboardFriends : Vector.<User>) : void
		{
			_leaderboardFriends = leaderboardFriends;
			dispatch(new SushimanModelEvent(SushimanModelEvent.UPDATED_LEADERBOARD_FRIENDS));
		}

		public function get leaderboardAll() : Vector.<User>
		{
			return _leaderboardAll;
		}

		public function set leaderboardAll(leaderboardAll : Vector.<User>) : void
		{
			_leaderboardAll = leaderboardAll;
			dispatch(new SushimanModelEvent(SushimanModelEvent.UPDATED_LEADERBOARD_ALL));
		}

	}
}
