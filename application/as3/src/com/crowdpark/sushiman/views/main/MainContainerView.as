package com.crowdpark.sushiman.views.main
{
	import com.crowdpark.sushiman.views.tiles.TilesView;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;

	import com.crowdpark.sushiman.views.components.PillSmall;
	import com.crowdpark.sushiman.views.leaderboard.LeaderboardView;
	import com.crowdpark.sushiman.views.player.PlayerView;

	/**
	 * @author francis
	 */
	public class MainContainerView extends Sprite
	{
		public var player : PlayerView;
		public var pills : Vector.<PillSmall>;
		public var leaderBoard : LeaderboardView;
		public var tilesView:TilesView;
		
		public var playButton:Button;
		private var _background : Image;
		private var _logo : Image;
		

		public function MainContainerView()
		{


		}

		public function addBackgroundImage(image : Image) : void
		{
			_background = image;
			addChild(_background);
		}

		public function addLogo(image : Image) : void
		{
			_logo = image;
			_logo.x = 545;
			_logo.y = 32;
			addChild(_logo);
		}
		
		public function addPlayButton(texture:Texture):void
		{
			playButton = new Button(texture, "PLAY");
			addChild(playButton);
		}

		public function addPlayer(textures : Vector.<Texture>) : void
		{
			player = new PlayerView(textures, 24);
			addChild(player);
			Starling.juggler.add(player);
		}
		
		
		public function addTilesView():void
		{
			tilesView = new TilesView();
			tilesView.x = 0;
			tilesView.y = 0;
			tilesView.width = 760;
			tilesView.height = 650;
			this.addChild(tilesView);			
		}

		/*
		 * Remove pills from stage and returns num of pills left
		 */
		public function removePillSmall(pillToRemove : PillSmall) : int
		{
			var n : int = pills.length;
			var pill : PillSmall;

			for (var i : int = 0; i < n;i++)
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
