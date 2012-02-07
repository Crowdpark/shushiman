package com.crowdpark.sushiman.commands
{
	import com.facebook.graph.Facebook;

	import org.robotlegs.mvcs.StarlingCommand;

	/**
	 * @author Francis Varga
	 */
	public class FacebookLoginCommand extends StarlingCommand
	{
		override public function execute() : void
		{
			this.fbInit();
		}

		public function fbInit() : void
		{
			Facebook.init("219863614774631", _onFbInit);
		}

		private function _onFbInit(success : Object, fail : Object) : void
		{
			this.login();
		}

		public function login() : void
		{
			Facebook.login(this._loginComplete, {scope:"user_about_me, email"});
		}

		private function _loginComplete(success : Object, fail : Object) : void
		{
			if (success)
			{
				Facebook.api("/me", _onMeComplete);
			}
			else
			{
				this.login();
			}
		}

		private function _onMeComplete(success : Object, fail : Object) : void
		{
		}
	}
}
