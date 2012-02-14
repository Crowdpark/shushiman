package com.crowdpark.sushiman.views.friends
{
	import starling.display.Image;
	import starling.display.Button;
	import starling.display.Sprite;

	/**
	 * @author sandberg
	 */
	public class FriendsListView extends Sprite
	{
		public static const DISPLAY_NUM:int = 5;
		public static const COMPONENTS_MARGIN:int = 10;
		public var background:Image;
		public var arrowLeft:Button;
		public var arrowRight:Button;
		public var btnPopupScores:Button;
		
		public function FriendsListView()
		{
		}

		public function get friendWindows():Vector.<FriendWindow>
		{
			var windows:Vector.<FriendWindow> = new Vector.<FriendWindow>();
			var n:int = this.numChildren;
			for (var i:int = 0; i<n;i++)
			{
				if (this.getChildAt(i) is FriendWindow)
				{
					windows.push(this.getChildAt(i) as FriendWindow);
				}
			}
			return windows;
		}
	}
}
