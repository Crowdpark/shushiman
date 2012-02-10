package com.crowdpark.sushiman.views.components
{
	import flash.display.Bitmap;
	import starling.display.Image;
	import starling.textures.Texture;

	/**
	 * @author sandberg
	 */
	public class CollisionImage extends Image
	{
		private var _bitmap:Bitmap;
		
		public function CollisionImage(texture:Texture)
		{
			super(texture);
		}

		public function get bitmap() : Bitmap
		{
			return _bitmap;
		}

		public function set bitmap(bitmap : Bitmap) : void
		{
			_bitmap = bitmap;
		}
	}
}
