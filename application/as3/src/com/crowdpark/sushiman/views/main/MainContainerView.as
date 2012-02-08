package com.crowdpark.sushiman.views.main
{
	import com.crowdpark.sushiman.views.components.PillSmall;
	import com.crowdpark.sushiman.views.player.PlayerView;
	import starling.display.Sprite;

	
	/**
	 * @author francis
	 */
	 
	public class MainContainerView extends Sprite
	{
		public var player:PlayerView;
		public var pills:Vector.<PillSmall>;
		
		public function MainContainerView()
		{
			pills = new Vector.<PillSmall>();
			var pill:PillSmall = new PillSmall();
			this.addChild(pill);
			pills.push(pill);
		}
		
		/*
		 * Remove pills from stage and returns num of pills left
		 */
		public function removePillSmall(pillToRemove:PillSmall):int
		{
			var n:int = pills.length;
			var pill:PillSmall;
			
			for (var i:int = 0; i<n;i++)
			{
				pill = pills[i];
				if (pill == pillToRemove)
				{
					pills.splice(i,1); 
					if (contains(pill))
					{
						removeChild(pill);
					}
				}
			}
			return pills.length;
		}
	}
}
