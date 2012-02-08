package com.crowdpark.sushiman.views.main
{
	import starling.core.Starling;
	import starling.textures.Texture;
	import starling.display.Image;
	import com.crowdpark.sushiman.views.components.PillSmall;
	import com.crowdpark.sushiman.views.player.PlayerView;
	import starling.display.Sprite;

	
	/**
	 * @author francis
	 */
	 
	public class MainContainerView extends Sprite
	{
		private var _background:Image;
		public var _logo:Image;
		public var player:PlayerView;
		public var pills:Vector.<PillSmall>;
		
		public function MainContainerView()
		{
			pills = new Vector.<PillSmall>();
			var pill:PillSmall = new PillSmall();
			this.addChild(pill);
			pills.push(pill);
		}
		
		public function addBackgroundImage(image:Image):void
		{
			_background = image;
			addChild(_background);
		}	
		
		public function addLogo(image:Image):void
		{
			_logo = image;
			_logo.x = 545;
			_logo.y = 32;
			addChild(_logo);
		}
		
		public function addPlayer(textures:Vector.<Texture>):void
		{
			player = new PlayerView(textures, 24);
			addChild(player);
			Starling.juggler.add(player);			
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
