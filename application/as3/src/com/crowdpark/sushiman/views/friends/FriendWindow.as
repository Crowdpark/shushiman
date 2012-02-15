package com.crowdpark.sushiman.views.friends
{
	import starling.display.Image;
	import starling.display.Sprite;


	/**
	 * @author sandberg
	 */
	public class FriendWindow extends Sprite
	{
		
		public function FriendWindow(window:Image)
		{
			/*
			 * NOTE: Facebook image should be added behind window image
			 */
			this.addChild(window);
		}
	}
}
