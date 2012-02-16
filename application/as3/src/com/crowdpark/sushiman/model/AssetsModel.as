package com.crowdpark.sushiman.model
{

	import com.fnicollet.BitmapDataCacher;
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	import org.robotlegs.mvcs.Actor;

	import flash.display.Bitmap;

	public class AssetsModel extends Actor
	{
		public static const CACHE_ID:String = "TILES";
		public static const PATH_PLAYER:String = "hero_knife_right";
		public static const PATH_OCTOPUSSY:String = "octopus_angry_left";
		public static const PATH_WALL:String = "others0002";
		public static const PATH_YELLOW:String = "others0004";
		public static const PATH_WHITE:String = "others0001";
		
		public static const ARROW_DIRECTION_RIGHT:String = "right";
		public static const ARROW_DIRECTION_LEFT:String = "left";

		[Embed(source="../assets/spritesheets/character.xml",mimeType="application/octet-stream")]
		public var AtlasXML:Class;
		[Embed(source="../assets/spritesheets/character.png")]
		public var AtlasTexture:Class;
		[Embed(source="../assets/background.png")]
		public var Background : Class;
		[Embed(source="../assets/background_mask.png")]
		public var BackgroundMask : Class;
		[Embed(source="../assets/background_hud.png")]
		public var BackgroundHud : Class;
		[Embed(source="../assets/background_friendsview.png")]
		public var BackgroundFriendsView : Class;
		
		[Embed(source="../assets/crowdpark.png")]
		public var CrowdparkLogo : Class;
		[Embed(source="../assets/btn_play.png")]
		public var PlayButton : Class;
		
		[Embed(source="../assets/friend_window.png")]
		public var FriendWindow : Class;
		
		[Embed(source="../assets/arrow_right_normal.png")]
		public var ArrowRightNormal : Class;
		
		[Embed(source="../assets/arrow_right_mouseover.png")]
		public var ArrowRightMouseOver : Class;
		
		[Embed(source="../assets/arrow_left_normal.png")]
		public var ArrowLeftNormal : Class;
		
		[Embed(source="../assets/arrow_left_mouseover.png")]
		public var ArrowLeftMouseOver : Class;
		
		[Embed(source="../assets/background_scores.png")]
		public var BackgroundScores : Class;

		private var _characters:Bitmap;
		private var _atlas : TextureAtlas;
		private var _xml : XML;
		private var _texture : Texture;

		public function AssetsModel()
		{
			_characters = new AtlasTexture();
			_xml = XML(new AtlasXML());
			BitmapDataCacher.cacheBitmap(CACHE_ID, _characters,_xml);			
			_texture = Texture.fromBitmap(_characters);
			_atlas = new TextureAtlas(_texture, _xml);
		}

		public function getBackground() : Image
		{
			var bitmap : Bitmap = new Background();
			return createImage(bitmap);
		}
		
		public function getBackgroundMask() : Image
		{
			var bitmap : Bitmap = new BackgroundMask();
			return createImage(bitmap);
		}

		public function getCrowdparkLogo() :Image
		{	
			var bitmap : Bitmap = new CrowdparkLogo();
			return createImage(bitmap);
		}
		
		public function getFriendWindow():Image
		{
			var bitmap:Bitmap = new FriendWindow();
			return createImage(bitmap);
		}
		
		public function getBackgroundHud():Image
		{
			var bitmap:Bitmap = new BackgroundHud();
			return createImage(bitmap);
		}
		public function getBackgroundFriendsView():Image
		{
			var bitmap:Bitmap = new BackgroundFriendsView();
			return createImage(bitmap);
		}
		
		public function getBackgroundScores():Image
		{
			var bitmap:Bitmap = new BackgroundScores();
			return createImage(bitmap);			
		}
		
		public function getPlayButtonTexture():Texture
		{
			var bitmap:Bitmap = new PlayButton();
			return Texture.fromBitmap(bitmap);
		}
		
		
		public function getArrowButtonTexture(mouseOverType:Boolean=false, direction:String = ARROW_DIRECTION_LEFT):Texture
		{
			var bitmap:Bitmap;
			
			if (direction == ARROW_DIRECTION_LEFT)
			{
				if (mouseOverType)
				{
					bitmap = new ArrowLeftMouseOver();
				} else
				{
					bitmap = new ArrowLeftNormal();
				}
				
			} else if (direction == ARROW_DIRECTION_RIGHT)
			{
				if (mouseOverType)
				{
					bitmap = new ArrowRightMouseOver();
				} else
				{
					bitmap = new ArrowRightNormal();
				}				
			}
			
			return Texture.fromBitmap(bitmap);
		}

		public function getTexture(string : String) : Texture
		{
			var texture:Texture = _atlas.getTexture(string);
			return texture;
		}

		public function getTextures(string : String) : Vector.<Texture>
		{
			return _atlas.getTextures(string);
		}

		private function createImage(bitmap : Bitmap) : Image
		{
			var texture : Texture = Texture.fromBitmap(bitmap,true);
			return new Image(texture);
		}
	}
}