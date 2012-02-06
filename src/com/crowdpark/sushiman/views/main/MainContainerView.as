package com.crowdpark.sushiman.views.main
{
	import com.crowdpark.sushiman.views.components.SimplePill;
	import com.crowdpark.sushiman.views.player.Player;
	import starling.display.Sprite;

	/**
	 * @author francis
	 */
	public class MainContainerView extends Sprite
	{
		public var player:Player = new Player();
		public var pills:Vector.<SimplePill>;
		
		public function MainContainerView()
		{
			this.addChild(player);
		}

	}
}
