package com.crowdpark.sushiman.views.main
{
	import com.crowdpark.sushiman.views.components.Player;
	import com.crowdpark.sushiman.views.components.PillSmall;
	import starling.display.Sprite;

	/**
	 * @author francis
	 */
	public class MainContainerView extends Sprite
	{
		public var player:Player = new Player();
		public var pills:Vector.<PillSmall>;
		
		public function MainContainerView()
		{
			this.addChild(player);
		}

	}
}
