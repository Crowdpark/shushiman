package com.crowdpark.sushiman.model
{
	/**
	 * @author sandberg
	 */
	public interface ISushimanModel
	{
		function updateScoreByCollisionObject(collisionObject:Class):void;
		function resetAllValues():void;
		function get score():int;
		function set score(value:int):void;
		function get numLives():int;
		function set numLives(value:int):void;
		function get numOctopussies():int;
		function set numOctopussies(value:int):void;
		function get currentGameLevel():int;
		function set currentGameLevel(value:int):void;
	}
}
