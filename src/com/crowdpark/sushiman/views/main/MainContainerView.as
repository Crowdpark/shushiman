package com.crowdpark.sushiman.views.main
{
	import starling.display.Sprite;

	import com.crowdpark.sushiman.views.components.Player;
	import com.crowdpark.sushiman.views.components.SimplePill;

	/**
	 * @author francis
	 */
	public class MainContainerView extends Sprite
	{
		public var player : Player = new Player();
		public var pills : Vector.<SimplePill>;

		public function MainContainerView()
		{
			this.addChild(player);
		}
	}
}
