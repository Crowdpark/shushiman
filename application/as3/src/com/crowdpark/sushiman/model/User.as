package com.crowdpark.sushiman.model
{
	/**
	 * @author sandberg
	 */
	public class User
	{
		private var _firstName : String;
		private var _lastName : String;
		private var _score : int;

		public function User(firstName : String, lastName : String, score : int)
		{
			this.firstName = firstName;
			this.lastName = lastName;
			this.score = score;
		}

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
	}
}
