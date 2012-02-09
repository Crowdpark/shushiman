package com.crowdpark.sushiman.model
{
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	import org.robotlegs.mvcs.Actor;

	public class AssetsModel extends Actor
	{
		[Embed(source="../assets/spritesheets/character.xml",mimeType="application/octet-stream")]
		public var AtlasXML:Class;
		
		[Embed(source="../assets/spritesheets/character.png")]
		public var AtlasTexture:Class;
		
		private var _atlas : TextureAtlas;
		private var _xml : XML;
		private var _texture : Texture;
		
		public function AssetsModel()
		{
			_texture = Texture.fromBitmap(new AtlasTexture());
			_xml = XML(new AtlasXML());
			_atlas = new TextureAtlas(_texture,_xml);
		}
		
		public function getTexture(string:String):Texture
		{
			return _atlas.getTexture(string);
		}
		
		public function getTextures(string:String):Vector.<Texture>
		{
			return _atlas.getTextures(string);
		}
	}
}