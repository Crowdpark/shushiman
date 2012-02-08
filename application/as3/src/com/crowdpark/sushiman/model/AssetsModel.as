package com.crowdpark.sushiman.model
{
	import flash.display.Bitmap;
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	import org.robotlegs.mvcs.Actor;

	public class AssetsModel extends Actor
	{
		[Embed(source="../assets/character/character.xml",mimeType="application/octet-stream")]
		public var AtlasXML:Class;
		
		[Embed(source="../assets/character/character.png")]
		public var AtlasTexture:Class;
		
		[Embed(source="../assets/background.png")]
		public var Background:Class;
		
		[Embed(source="../assets/crowdpark.png")]
		public var CrowdparkLogo:Class;
		
		private var _atlas : TextureAtlas;
		private var _xml : XML;
		private var _texture : Texture;
		
		public function AssetsModel()
		{
			_texture = Texture.fromBitmap(new AtlasTexture());
			_xml = XML(new AtlasXML());
			_atlas = new TextureAtlas(_texture,_xml);
		}
		
		public function getBackgroundImage():Image
		{
			var bitmap:Bitmap = new Background();
			return createImage(bitmap);
		}
		
		public function getCrowdparkLogo():Image
		{
			var bitmap:Bitmap = new CrowdparkLogo();
			return createImage(bitmap);
		}
		
		public function getTexture(string:String):Texture
		{
			return _atlas.getTexture(string);
		}
		
		public function getTextures(string:String):Vector.<Texture>
		{
			return _atlas.getTextures(string);
		}
		
		
		private function createImage(bitmap:Bitmap):Image
		{
			var texture:Texture = Texture.fromBitmap(bitmap);
			return new Image(texture);			
		}
	}
}