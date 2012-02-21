package com.crowdpark.sushiman.views.flashgui
{
	import flash.display.Sprite;

	/**
	 * @author sandberg
	 */
	public class FriendsWindow extends Sprite
	{
		private var _graphics:GraphicFriendWindow = new GraphicFriendWindow();
		
		public static const MARGIN:int = 20;
		public function FriendsWindow()
		{
			addChild(_graphics);
		}
	}
}
