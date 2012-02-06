package com.crowdpark.sushiman.views.main
{
	import com.crowdpark.sushiman.views.components.Pill;
	import com.crowdpark.sushiman.views.player.Player;
	import starling.display.Sprite;

	/**
	 * @author francis
	 */
	public class MainContainerView extends Sprite
	{
		public var player:Player = new Player();
		public var pills:Vector.<Pill>;
		
		public function MainContainerView()
		{
			this.addChild(player);
		}

	}
}
