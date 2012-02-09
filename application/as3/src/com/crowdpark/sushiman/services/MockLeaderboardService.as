package com.crowdpark.sushiman.services
{
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.model.user.UserVo;
	import com.crowdpark.sushiman.services.interfaces.ILeaderboardService;
	import com.crowdpark.sushiman.utils.StringGenerator;
	import org.robotlegs.mvcs.Actor;

	/**
	 * @author sandberg
	 */
	public class MockLeaderboardService extends Actor implements ILeaderboardService
	{
		[Inject]
		public var model : ISushimanModel;

		public function MockLeaderboardService()
		{
		}

		public function getFriendsLeaderboard() : void
		{
			var users:Vector.<UserVo> = generateUsers(); 
			model.leaderboardFriends = users;
		}

		public function getAllUserLeaderboard() : void
		{
			var users:Vector.<UserVo> = generateUsers(); 
			model.leaderboardAll = users;
		}
		
		private function generateUsers():Vector.<UserVo>
		{
			var n:int = 10;
			var users:Vector.<UserVo> = new Vector.<UserVo>();
			var fname:String;
			var lname:String;
			var score:int;
			
			for (var i:int = 0; i<n; i++)
			{
				fname = StringGenerator.generateString(10);
				lname = StringGenerator.generateString(10);
				score = Math.random() * 1000;
				
				var userVo : UserVo = new UserVo();
				userVo.firstName = fname;
				userVo.lastName = lname;
				userVo.score = score;
				
				users.push(userVo);
			}
			return users;
		}
	}
}
