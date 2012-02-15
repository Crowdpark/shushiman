package com.crowdpark.sushiman.views.friends
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.events.Event;

	import com.crowdpark.sushiman.model.AssetsModel;
	import com.crowdpark.sushiman.views.leaderboard.LeaderboardEvent;

	import org.robotlegs.mvcs.StarlingMediator;

	/**
	 * @author sandberg
	 */
	public class FriendsListMediator extends StarlingMediator
	{
		
		[Inject]
		public var view:FriendsListView;
		
		[Inject]
		public var assetsModel:AssetsModel;
		
		override public function onRegister():void
		{
			addComponents();
		}
		
		
		public function addComponents():void
		{

			view.arrowLeft = new Button(assetsModel.getArrowButtonTexture(),"",assetsModel.getArrowButtonTexture(true));
			view.arrowLeft.y = (view.background.height/2) - (view.arrowLeft.height/2);
			view.addChild(view.arrowLeft);

			var fWindow:FriendWindow;
			var fImage:Image;
			
			for (var i:int = 0; i<FriendsListView.DISPLAY_NUM; i++)
			{
				fImage = assetsModel.getFriendWindow();
				fWindow = new FriendWindow(fImage);
				fWindow.x = view.arrowLeft.x + view.arrowLeft.width + (FriendsListView.COMPONENTS_MARGIN * i) + (fImage.width * i);
				view.addChild(fWindow);
			}
			
			view.arrowRight = new Button(assetsModel.getArrowButtonTexture(false, AssetsModel.ARROW_DIRECTION_RIGHT),"",assetsModel.getArrowButtonTexture(true, AssetsModel.ARROW_DIRECTION_RIGHT));
			view.addChild(view.arrowRight);
			view.arrowRight.x = fWindow.x + fWindow.width;
			view.arrowRight.y = (view.background.height/2) - (view.arrowRight.height/2);
			
			
			view.btnPopupScores = new Button(assetsModel.getPlayButtonTexture(),"SCORES");
			view.addChild(view.btnPopupScores);
			view.btnPopupScores.x = view.arrowRight.x + view.arrowRight.width + FriendsListView.COMPONENTS_MARGIN;
			view.btnPopupScores.y = (view.background.height/2) - (view.btnPopupScores.height/2);
			
			addListeners();
		}

		private function addListeners():void
		{
			view.arrowLeft.addEventListener(Event.TRIGGERED, triggerArrowHandler);
			view.arrowRight.addEventListener(Event.TRIGGERED, triggerArrowHandler);	
			view.btnPopupScores.addEventListener(Event.TRIGGERED, triggerScoresHandler);			
		}
		
		private function removeListeners():void
		{
			view.arrowLeft.addEventListener(Event.TRIGGERED, triggerArrowHandler);
			view.arrowRight.addEventListener(Event.TRIGGERED, triggerArrowHandler);	
			view.btnPopupScores.addEventListener(Event.TRIGGERED, triggerScoresHandler);			
		}

		private function triggerScoresHandler(event : Event) : void
		{
			dispatch(new LeaderboardEvent(LeaderboardEvent.SHOW_LEADERBOARD));
		}

		private function triggerArrowHandler(event : Event) : void
		{
			
		}
	}
}
