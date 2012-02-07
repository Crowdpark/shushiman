package com.crowdpark.sushiman.views.leaderboard
{
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.events.LeaderboardEvent;
	import com.crowdpark.sushiman.model.SushimanModelEvent;
	import org.robotlegs.mvcs.StarlingMediator;

	/**
	 * @author sandberg
	 */
	public class LeaderboardMediator extends StarlingMediator
	{
		[Inject]
		public var model:ISushimanModel;
		[Inject]
		public var view:LeaderboardView;
		
		override public function onRegister():void
		{
			this.eventMap.mapListener(this.eventDispatcher,SushimanModelEvent.UPDATED_LEADERBOARD_ALL, leaderboardUpdateHandler);
			this.eventMap.mapListener(this.eventDispatcher,SushimanModelEvent.UPDATED_LEADERBOARD_FRIENDS, leaderboardUpdateHandler);
			this.dispatch(new LeaderboardEvent(LeaderboardEvent.GET_ALL_USERS_LEADERBOARD));
		}

		private function leaderboardUpdateHandler(event:SushimanModelEvent) : void
		{
			
		}
	}
}
