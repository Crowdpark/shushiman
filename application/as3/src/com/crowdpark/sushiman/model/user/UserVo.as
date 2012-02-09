package com.crowdpark.sushiman.model.user
{
	/**
	 * @author sandberg
	 */
	public class UserVo
	{
		private var _id : String;
		private var _userId : String;
		private var _firstName : String;
		private var _lastName : String;
		private var _fullName : String;
		private var _locale : String;
		private var _userName : String;
		private var isAppUser : Boolean;
		private var _score : int;

		public function get firstName() : String
		{
			return _firstName;
		}

		public function set firstName(firstName : String) : void
		{
			_firstName = firstName;
		}

		public function get lastName() : String
		{
			return _lastName;
		}

		public function set lastName(lastName : String) : void
		{
			_lastName = lastName;
		}

		public function get score() : int
		{
			return _score;
		}

		public function set score(score : int) : void
		{
			_score = score;
		}

		public function get id() : String
		{
			return _id;
		}

		public function set id(id : String) : void
		{
			_id = id;
		}

		public function get userId() : String
		{
			return _userId;
		}

		public function set userId(userId : String) : void
		{
			_userId = userId;
		}

		public function get fullName() : String
		{
			return _fullName;
		}

		public function set fullName(fullName : String) : void
		{
			_fullName = fullName;
		}

		public function get locale() : String
		{
			return _locale;
		}

		public function set locale(locale : String) : void
		{
			_locale = locale;
		}

		public function get userName() : String
		{
			return _userName;
		}

		public function set userName(userName : String) : void
		{
			_userName = userName;
		}

		public function get _isAppUser() : Boolean
		{
			return isAppUser;
		}

		public function set _isAppUser(isAppUser : Boolean) : void
		{
			this.isAppUser = isAppUser;
		}
	}
}
