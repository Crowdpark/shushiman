package com.crowdpark.sushiman.services
{
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.utils.StringGenerator;
	import com.crowdpark.sushiman.model.User;
	import org.robotlegs.mvcs.Actor;

	import com.crowdpark.sushiman.services.ILeaderboardService;

	/**
	 * @author sandberg
	 */
	public class MockLeaderboardService extends Actor implements ILeaderboardService
	{
		[Inject]
		public var model:ISushimanModel;
		
		public function MockLeaderboardService()
		{
		}

		public function getFriendsLeaderboard() : void
		{
			var users:Vector.<User> = generateUsers(); 
			model.leaderboardFriends = users;
		}

		public function getAllUserLeaderboard() : void
		{
			var users:Vector.<User> = generateUsers(); 
			model.leaderboardAll = users;
		}
		
		private function generateUsers():Vector.<User>
		{
			var n:int = 10;
			var users:Vector.<User> = new Vector.<User>();
			var fname:String;
			var lname:String;
			var score:int;
			
			for (var i:int = 0; i<n; i++)
			{
				fname = StringGenerator.generateString(10);
				lname = StringGenerator.generateString(10);
				score = Math.random() * 10;
				users.push(new User(fname,lname,score));
			}
			return users;
		}
	}
}
