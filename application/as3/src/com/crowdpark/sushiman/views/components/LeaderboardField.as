package com.crowdpark.sushiman.views.components
{
	import com.crowdpark.sushiman.model.User;
	import starling.text.TextField;

	/**
	 * @author sandberg
	 */
	public class LeaderboardField extends TextField
	{
		private var _user:User;
		
		public function LeaderboardField(user:User)
		{
			super(400, 60, "", "Verdana", 16);
			this.user = user;
		}

		public function get user() : User
		{
			return _user;
		}

		public function set user(user : User) : void
		{
			_user = user;
			this.text = user.firstName + " " + user.lastName + " " + user.score.toString();
		}
	}
}
