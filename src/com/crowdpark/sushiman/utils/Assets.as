package com.crowdpark.sushiman.utils
{
	import flash.display.Bitmap;
	import flash.media.Sound;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{
		// Bitmaps
		[Embed(source = "../../../../../assets/test.png")]
		private static const Test : Class;
		// Texture cache
		private static var sTextures : Dictionary = new Dictionary();

		public static function getTexture(name : String) : Texture
		{
			if (sTextures[name] == undefined)
			{
				var data : Object = new Assets[name]();

				if (data is Bitmap)
					sTextures[name] = Texture.fromBitmap(data as Bitmap);
				else if (data is ByteArray)
					sTextures[name] = Texture.fromAtfData(data as ByteArray);
			}

			return sTextures[name];
		}
	}
}
