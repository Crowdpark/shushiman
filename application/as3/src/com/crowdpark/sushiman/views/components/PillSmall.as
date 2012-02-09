package com.crowdpark.sushiman.views.components
{
	import starling.display.Image;
	import starling.textures.Texture;

	import flash.display.BitmapData;
	import flash.display.Sprite;

	/**
	 * @author sandberg
	 */
	public class PillSmall extends CollisionObject
	{
		public function PillSmall()
		{
			var s : flash.display.Sprite = new flash.display.Sprite();
			var color : uint = Math.random() * 0xFFFFFF;
			s.graphics.beginFill(color);
			var radius : uint = 20;
			s.graphics.drawCircle(radius, radius, radius);
			s.graphics.endFill();
			var bmd : BitmapData = new BitmapData(radius * 2, radius * 2, true, color);

			bmd.draw(s);
			var texture : Texture = Texture.fromBitmapData(bmd);
			var image : Image = new Image(texture);
			addChild(image);
		}
	}
}
