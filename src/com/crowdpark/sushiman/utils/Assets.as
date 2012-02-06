package com.crowdpark.sushiman.utils
{
	import starling.textures.Texture;

	import flash.display.Bitmap;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class Assets
	{
		// Bitmaps
		[Embed(source = "../../../../../assets/test.png")]
		private static const Test : Class;
		// Texture cache
		private static var _sTextures : Dictionary = new Dictionary();

		public static function getTexture(name : String) : Texture
		{
			if (_sTextures[name] == undefined)
			{
				var data : Object = new Assets[name]();

				if (data is Bitmap)
				{
					_sTextures[name] = Texture.fromBitmap(data as Bitmap);
				}
				else if (data is ByteArray)
				{
					_sTextures[name] = Texture.fromAtfData(data as ByteArray);
				}
			}

			return _sTextures[name];
		}
	}
}
