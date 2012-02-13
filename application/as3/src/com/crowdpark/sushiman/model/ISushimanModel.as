package com.crowdpark.sushiman.model
{
	import com.crowdpark.sushiman.model.user.UserVo;

	/**
	 * @author sandberg
	 */
	public interface ISushimanModel
	{
		function updateScoreByCollisionObject(assetType:String) : void;

		function resetAllValues() : void;
		
		function get user():UserVo;
		
		function set user(user:UserVo):void;

		function get currentGameState() : String;

		function set currentGameState(value : String) : void;

		function get score() : int;

		function set score(value : int) : void;

		function get numLives() : int;

		function set numLives(value : int) : void;

		function get numOctopussies() : int;

		function set numOctopussies(value : int) : void;

		function get leaderboardFriends() : Vector.<UserVo>;

		function set leaderboardFriends(leaderboardFriends : Vector.<UserVo>) : void;

		function get leaderboardAll() : Vector.<UserVo>;

		function set leaderboardAll(leaderboardAll : Vector.<UserVo>) : void;
	}
}