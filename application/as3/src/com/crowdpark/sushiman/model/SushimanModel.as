package com.crowdpark.sushiman.model
{
	import com.crowdpark.sushiman.model.user.UserAppFriendsModel;
	import com.crowdpark.core.robotlogger.RobotLoggerEvent;
	import com.crowdpark.sushiman.model.gamestate.GameState;
	import com.crowdpark.sushiman.model.gamestate.GameStateChangedEvent;
	import com.crowdpark.sushiman.model.user.UserVo;
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
		
		private var _user:UserVo;
		private var _currentGameState : String = GameState.INIT;
		private var _currentGameLevel : int;
		private var _score : int;
		private var _numLives : int;
		private var _numOctopussies : int;
		private var _leaderboardFriends : Vector.<UserVo>;
		private var _leaderboardAll : Vector.<UserVo>;

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

		private function sortUsersByHighscore(firstUser : UserVo, secondUser : UserVo) : Number
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

		public function get leaderboardFriends() : Vector.<UserVo>
		{
			return _leaderboardFriends;
		}

		public function set leaderboardFriends(leaderboardFriends : Vector.<UserVo>) : void
		{
			leaderboardFriends.sort(sortUsersByHighscore);
			_leaderboardFriends = leaderboardFriends;
			dispatch(new SushimanModelEvent(SushimanModelEvent.UPDATED_LEADERBOARD_FRIENDS));
		}

		public function get leaderboardAll() : Vector.<UserVo>
		{
			return _leaderboardAll;
		}

		public function set leaderboardAll(leaderboardAll : Vector.<UserVo>) : void
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
				case GameState.PLAYING:
					break;
				case GameState.LEVEL_COMPLETE:
					break;
				case GameState.LIFE_LOST:
					numLives--;
					break;
				case GameState.GAME_OVER:
					break;
				default:
					break;
			}
			var msg:String = "Current gamestate changed to " + currentGameState;
			dispatch(new GameStateChangedEvent(GameStateChangedEvent.CHANGE, currentGameState));
			dispatch(new RobotLoggerEvent(RobotLoggerEvent.LOG, RobotLoggerEvent.LEVEL_INFO, SushimanModel, msg));
		}

		public function get user() : UserVo
		{
			return _user;
		}

		public function set user(user : UserVo) : void
		{
			_user = user;
		}
	}
}
