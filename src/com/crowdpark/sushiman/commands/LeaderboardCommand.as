package com.crowdpark.sushiman.commands
{
	import com.crowdpark.sushiman.services.ILeaderboardService;
	import com.crowdpark.sushiman.events.LeaderboardEvent;
	import com.crowdpark.sushiman.services.LeaderboardService;
	import org.robotlegs.mvcs.StarlingCommand;

	/**
	 * @author sandberg
	 */
	public class LeaderboardCommand extends StarlingCommand
	{
		[Inject]
		public var service:ILeaderboardService;
		[Inject]
		public var event:LeaderboardEvent;
		
		override public function execute():void
		{
			switch(event.type)
			{
				case LeaderboardEvent.GET_ALL_USERS_LEADERBOARD:
					service.getAllUserLeaderboard();
					break;
				case LeaderboardEvent.GET_FRIENDS_LEADERBOARD:
					service.getFriendsLeaderboard();
					break;
			}
			
		}
	}
}
