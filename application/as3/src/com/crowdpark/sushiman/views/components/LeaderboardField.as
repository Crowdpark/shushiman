package com.crowdpark.sushiman.views.components
{
	import starling.text.TextField;

	import com.crowdpark.sushiman.model.user.UserVo;
	/**
	 * @author sandberg
	 */
	public class LeaderboardField extends TextField
	{
		private var _user:UserVo;
		
		public function LeaderboardField(user:UserVo)
		{
			super(400, 60, "", "Verdana", 16);
			this.user = user;
		}

		public function get user() : UserVo
		{
			return _user;
		}

		public function set user(user : UserVo) : void
		{
			_user = user;
			this.text = user.firstName + " " + user.lastName + " " + user.score.toString();
		}
	}
}
