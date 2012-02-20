package com.crowdpark.sushiman.views.main
{
	import com.crowdpark.sushiman.views.friends.FriendsListView;
	import com.crowdpark.sushiman.views.aihunter.AIHunterView;
	import com.crowdpark.sushiman.views.hud.HudView;
	import com.crowdpark.sushiman.views.leaderboard.LeaderboardView;
	import com.crowdpark.sushiman.views.player.PlayerView;
	import com.crowdpark.sushiman.views.tiles.TilesView;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;

	/**
	 * @author francis
	 */
	 
	public class MainContainerView extends Sprite
	{
		public static const TRANSITION_SPEED:int = 2;
		
		public var player : PlayerView;
		public var leaderBoard : LeaderboardView;
		public var tilesView:TilesView;
		public var hudView:HudView;
		public var friendsView:FriendsListView;
		public var backgroundMask:Image;
		public var playButton:Button;
		public var background : Image;
		public var logo : Image;
		public var signDead:Image;
		public var signGameOver:Image;

		public function MainContainerView()
		{

		}

		public function addBackgroundImage(image : Image) : void
		{
			background = image;
			addChild(background);
		}

		public function addLogo(image : Image) : void
		{
			logo = image;
			logo.x = 545;
			logo.y = 32;
			addChild(logo);
		}
		
		public function addPlayButton(texture:Texture):void
		{
			if (playButton == null)
			{
				playButton = new Button(texture, "PLAY");
			}

			playButton.x = this.stage.stageWidth/2 - playButton.width;
			playButton.y = this.stage.stageHeight/2 - playButton.height;
			addChild(playButton);
		}
		
		public function removePlayButton():void
		{
			if(playButton != null && this.contains(playButton))
			{
				removeChild(playButton);
			}
		}
		
		public function addHudView(background:Image):void
		{
			if (hudView == null)
			{
				hudView = new HudView(background);
			}
			if (!this.contains(hudView))
			{
				addChild(hudView);
			}
		}

		public function addTilesView():void
		{
			if (tilesView == null)
			{
				tilesView = new TilesView();
				tilesView.y = 70;//this.hudView.background.height;
			}
			
			if (!this.contains(tilesView))
			{
				this.addChild(tilesView);
			}
						
		}

		public function addFriendsListView(background:Image):void
		{
			if (friendsView == null)
			{
				friendsView = new FriendsListView(background);
			}
			if (!this.contains(friendsView))
			{
				addChild(friendsView);
				friendsView.x = 0;
				friendsView.y = this.background.height - friendsView.background.height;				
			}
		}
		
		public function addBackgroundMask(image:Image):void
		{
			if (!this.contains(image))
			{
				addChild(image);
			}
			
		}
		
		
		public function get AITiles():Vector.<AIHunterView>
		{
			var tiles:Vector.<AIHunterView> = new Vector.<AIHunterView>();
			var n:int = this.numChildren;
			
			for(var i:int = 0; i<n;i++)
			{
				if (this.getChildAt(i) is AIHunterView)
				{
					tiles.push(this.getChildAt(i) as AIHunterView);
				}
			}
			return tiles;
		}
		

	}
}
