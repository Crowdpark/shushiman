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
		public static const PATH_PLAYER:String = "hero/knife_right/";
		public static const PATH_OCTOPUSSY:String = "octopus/walk_left/";
		public static const PATH_WALL:String = "others/output/others0002";
		public static const PATH_YELLOW:String = "others/output/others0004";
		public static const PATH_WHITE:String = "others/output/others0001";

//		public static const PATH_OCTOPUS:String = "octopus/walk_left/output/walking_left0001";
//		public static const PATH_WALL:String = "others/others";
//		public static const PATH_YELLOW:String = "others/others";
//		public static const PATH_WHITE:String = "others/others";
		
		[Embed(source="../assets/spritesheets/character.xml",mimeType="application/octet-stream")]
		public var AtlasXML:Class;
		
		[Embed(source="../assets/spritesheets/character.png")]
		public var AtlasTexture:Class;
		
		private var _bmpCharacters:Bitmap;
		
		[Embed(source="../assets/background.png")]
		public var Background : Class;
		[Embed(source="../assets/crowdpark.png")]
		public var CrowdparkLogo : Class;
		[Embed(source="../assets/btn_play.png")]
		public var PlayButton : Class;

		private var _atlas : TextureAtlas;
		private var _xml : XML;
		private var _texture : Texture;

		public function AssetsModel()
		{
			_bmpCharacters = new AtlasTexture();
			_xml = XML(new AtlasXML());
			
			// BitmapDataCacher is for collision detection
			BitmapDataCacher.cacheBitmap(CACHE_ID, _bmpCharacters,_xml);
			
			_texture = Texture.fromBitmap(_bmpCharacters);
			
			_atlas = new TextureAtlas(_texture, _xml);
		}

		public function getBackgroundImage() : Image
		{
			var bitmap : Bitmap = new Background();
			return createImage(bitmap);
		}

		public function getCrowdparkLogo() :Image
		{
			var bitmap : Bitmap = new CrowdparkLogo();
			return createImage(bitmap);
		}
		
		public function getPlayButtonTexture():Texture
		{
			var bitmap:Bitmap = new PlayButton();
			return Texture.fromBitmap(bitmap);
		}

		public function getTexture(string : String) : Texture
		{
			//_atlas.
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