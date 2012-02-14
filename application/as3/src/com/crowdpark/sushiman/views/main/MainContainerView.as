package com.crowdpark.sushiman.views.main
{
	import com.crowdpark.sushiman.model.level.TileData;
	import com.crowdpark.sushiman.views.aihunter.AIHunterTileView;
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
		public var player : PlayerView;
		public var leaderBoard : LeaderboardView;
		public var tilesView:TilesView;
		public var hudView:HudView = new HudView();
		
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
			if (playButton == null)
			{
				playButton = new Button(texture, "PLAY");
			}
			/* TODO: Find out why stageWidth is 1440 & stageHeight 838
			 * 
			 */
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
		
		public function addHudView():void
		{
			addChild(hudView);
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
			this.addChild(tilesView);			
		}
		
		
		public function addAITile(textures : Vector.<Texture>, data:TileData):void
		{
			var hunter:AIHunterTileView = new AIHunterTileView(textures, data);
			addChild(hunter);
			Starling.juggler.add(hunter);
		}
		
		
		public function get hunters():Vector.<AIHunterTileView>
		{
			var hunters:Vector.<AIHunterTileView> = new Vector.<AIHunterTileView>();
			var n:int = this.numChildren;
			for (var i:int = 0; i<n;i++)
			{
				if (this.getChildAt(i) is AIHunterTileView)
				{
					hunters.push(this.getChildAt(i));
				}
			}
			return hunters;
		}

	}
}
