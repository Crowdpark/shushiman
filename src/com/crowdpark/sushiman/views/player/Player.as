package com.crowdpark.sushiman.views.player
{
	import com.crowdpark.sushiman.utils.Assets;
	import starling.display.Image;
	import starling.display.Sprite;

	/**
	 * @author sandberg
	 */
	public class Player extends Image
	{
		public function Player()
		{
			super(Assets.getTexture("Test"));
		}
	}
}
