package com.crowdpark.sushiman.views.main
{
	import flash.geom.Rectangle;
	import com.crowdpark.sushiman.views.friends.FriendsListView;
	import com.crowdpark.sushiman.model.level.TileData;
	import com.crowdpark.sushiman.views.aihunter.AIHunter;
	import com.crowdpark.sushiman.views.hud.HudView;
	import com.crowdpark.sushiman.views.leaderboard.LeaderboardView;
	import com.crowdpark.sushiman.views.player.PlayerView;
	import com.crowdpark.sushiman.views.tiles.TilesView;
	import starling.core.Starling;
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

		public function addPlayer(textures : Vector.<Texture>) : void
		{
			player = new PlayerView(textures, 24);
			tilesView.addChild(player);
			Starling.juggler.add(player);

			if (player == null)
			{
				player = new PlayerView(textures, 24);
			}
			
			if (!this.contains(player))
			{
				addChild(player);
				Starling.juggler.add(player);
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
		
		public function addAITile(textures : Vector.<Texture>, texturePath:String,data:TileData, stageArea:Rectangle):void
		{
			var hunter:AIHunter = new AIHunter(textures, data, stageArea);
			addChild(hunter);
			Starling.juggler.add(hunter);
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
		
		
		public function get AITiles():Vector.<AIHunter>
		{
			var tiles:Vector.<AIHunter> = new Vector.<AIHunter>();
			var n:int = this.numChildren;
			
			for(var i:int = 0; i<n;i++)
			{
				if (this.getChildAt(i) is AIHunter)
				{
					tiles.push(this.getChildAt(i) as AIHunter);
				}
			}
			return tiles;
		}
		

	}
}
