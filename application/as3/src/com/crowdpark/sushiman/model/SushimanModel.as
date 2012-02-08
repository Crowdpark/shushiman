package com.crowdpark.sushiman.model
{
	import com.crowdpark.sushiman.model.gamestate.GameStateEvent;
	import com.crowdpark.sushiman.model.gamestate.GameState;
	import com.crowdpark.sushiman.views.components.CollisionObject;
	import com.crowdpark.sushiman.views.components.PillSmall;
	import org.robotlegs.mvcs.Actor;


	/**
	 * @author sandberg
	 */
	public class SushimanModel extends Actor implements ISushimanModel
	{
		public static const INIT_SCORE : int = 0;
		public static const INIT_NUM_LIVES : int = 3;
		public static const INIT_NUM_OCTOPUSSIES : int = 10;

		private var _currentGameState:String = GameState.INIT;
		private var _currentGameLevel : int;
		private var _score : int;
		private var _numLives : int;
		private var _numOctopussies : int;
		private var _leaderboardFriends : Vector.<User>;
		private var _leaderboardAll : Vector.<User>;

		public function resetAllValues() : void
		{
			this.score = INIT_SCORE;
			this.numLives = INIT_NUM_LIVES;
			this.numOctopussies = INIT_NUM_OCTOPUSSIES;
		}

		public function updateScoreByCollisionObject(collisionObject : CollisionObject) : void
		{
			if (collisionObject is PillSmall)
			{
				this.score++;
			}
		}

		private function sortUsersByHighscore(firstUser : User, secondUser : User) : Number
		{
			if (firstUser.score > secondUser.score)
			{
				return -1;
			}
			else if (firstUser.score < secondUser.score)
			{
				return 1;
			}
			else
			{
				return 0;
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
			if (numLives <= 0)
			{
				this.currentGameState = GameState.GAME_OVER;
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
			leaderboardFriends.sort(sortUsersByHighscore);
			_leaderboardFriends = leaderboardFriends;
			dispatch(new SushimanModelEvent(SushimanModelEvent.UPDATED_LEADERBOARD_FRIENDS));
		}

		public function get leaderboardAll() : Vector.<User>
		{
			return _leaderboardAll;
		}

		public function set leaderboardAll(leaderboardAll : Vector.<User>) : void
		{
			leaderboardAll.sort(sortUsersByHighscore);
			_leaderboardAll = leaderboardAll;
			dispatch(new SushimanModelEvent(SushimanModelEvent.UPDATED_LEADERBOARD_ALL));
		}

		public function get currentGameState() : String
		{
			return _currentGameState;
		}

		public function set currentGameState(currentGameState : String) : void
		{
			_currentGameState = currentGameState;
			
			switch(currentGameState)
			{
				case GameState.INIT:
					break;
				case GameState.PLAY:
					break;
				case GameState.GAME_OVER:
					break;
				default:
					break;
			}
			dispatch(new GameStateEvent(GameStateEvent.CHANGE, currentGameState));
		}
	}
}
