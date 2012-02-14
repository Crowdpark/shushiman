package com.crowdpark.sushiman.views.friends
{
	import starling.display.Button;
	import com.crowdpark.sushiman.model.AssetsModel;
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
			view.addChild(view.arrowLeft);
			
			
			view.arrowRight = new Button(assetsModel.getArrowButtonTexture(false, AssetsModel.ARROW_DIRECTION_RIGHT),"",assetsModel.getArrowButtonTexture(true, AssetsModel.ARROW_DIRECTION_RIGHT));
			view.addChild(view.arrowRight);
			view.x = 400;
			
//			var fWindow:FriendWindow;
//			for (var i:int = 0; i<FriendsListView.DISPLAY_NUM; i++)
//			{
//				fWindow = new FriendWindow(assetsModel.getFriendWindow());
//				view.addChild(fWindow);
//			}	
		}
	}
}
