package com.crowdpark.sushiman.views.leaderboard
{
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.model.SushimanModelEvent;
	import com.crowdpark.sushiman.model.User;
	import com.crowdpark.sushiman.views.components.LeaderboardField;

	import org.robotlegs.mvcs.StarlingMediator;

	import utils.display.addChild;

	/**
	 * @author sandberg
	 */
	public class LeaderboardMediator extends StarlingMediator
	{
		[Inject]
		public var model : ISushimanModel;
		[Inject]
		public var view : LeaderboardView;

		override public function onRegister() : void
		{
			this.eventMap.mapListener(this.eventDispatcher, SushimanModelEvent.UPDATED_LEADERBOARD_ALL, leaderboardUpdateHandler);
			this.eventMap.mapListener(this.eventDispatcher, SushimanModelEvent.UPDATED_LEADERBOARD_FRIENDS, leaderboardUpdateHandler);
			this.dispatch(new LeaderboardEvent(LeaderboardEvent.GET_ALL_USERS_LEADERBOARD));
		}

		private function leaderboardUpdateHandler(event : SushimanModelEvent) : void
		{
			var counter : int = 0;
			for each (var user:User in model.leaderboardAll)
			{
				counter++;
				var field : LeaderboardField = new LeaderboardField(user);
				field.y = (counter * field.height) + 10;
				view.addChild(field);
			}
		}
	}
}
