package com.crowdpark.sushiman.model
{
	import com.crowdpark.sushiman.views.components.CollisionObject;
	/**
	 * @author sandberg
	 */
	public interface ISushimanModel
	{
		function updateScoreByCollisionObject(collisionObject:CollisionObject):void;
		function resetAllValues():void;
		function get score():int;
		function set score(value:int):void;
		function get numLives():int;
		function set numLives(value:int):void;
		function get numOctopussies():int;
		function set numOctopussies(value:int):void;
		function get currentGameLevel():int;
		function set currentGameLevel(value:int):void;
		function get leaderboardFriends() : Vector.<User>;
		function set leaderboardFriends(leaderboardFriends : Vector.<User>) : void;
		function get leaderboardAll() : Vector.<User>;
		function set leaderboardAll(leaderboardAll : Vector.<User>) : void;
	}
}
