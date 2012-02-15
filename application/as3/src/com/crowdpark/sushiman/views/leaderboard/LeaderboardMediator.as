package com.crowdpark.sushiman.views.leaderboard
{
	import com.crowdpark.sushiman.model.AssetsModel;
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.model.SushimanModelEvent;
	import com.crowdpark.sushiman.model.user.UserVo;
	import org.robotlegs.mvcs.StarlingMediator;


	/**
	 * @author sandberg
	 */
	public class LeaderboardMediator extends StarlingMediator
	{
		[Inject]
		public var model : ISushimanModel;
		[Inject]
		public var assetsModel:AssetsModel;
		[Inject]
		public var view : LeaderboardView;

		override public function onRegister() : void
		{
			this.eventMap.mapListener(this.eventDispatcher, SushimanModelEvent.UPDATED_LEADERBOARD_ALL, leaderboardUpdateHandler);
			this.eventMap.mapListener(this.eventDispatcher, SushimanModelEvent.UPDATED_LEADERBOARD_FRIENDS, leaderboardUpdateHandler);

			this.view.background = assetsModel.getBackgroundScores();
			this.view.background.alpha = 0.8;
			this.view.addChild(this.view.background);
			
			this.dispatch(new LeaderboardEvent(LeaderboardEvent.GET_ALL_USERS_LEADERBOARD));
		}

		private function leaderboardUpdateHandler(event : SushimanModelEvent) : void
		{
			var counter : int = 0;
			for each (var user:UserVo in model.leaderboardAll)
			{
				counter++;
				var field : LeaderboardField = new LeaderboardField(user);
				field.y = (counter * field.height) + 10;
				view.addChild(field);
			}
		}
	}
}
