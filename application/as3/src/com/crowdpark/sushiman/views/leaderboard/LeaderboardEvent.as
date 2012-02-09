package com.crowdpark.sushiman.views.leaderboard
{
	import flash.events.Event;

	/**
	 * @author sandberg
	 */
	public class LeaderboardEvent extends Event
	{
		public static const GET_FRIENDS_LEADERBOARD:String = "LeaderboardEvent.GET_FRIENDS_LEADERBOARD";
		public static const GET_ALL_USERS_LEADERBOARD:String = "LeaderboardEvent.GET_ALL_USERS_LEADERBOARD";
		
		public function LeaderboardEvent(type : String)
		{
			super(type);
		}
	}
}
