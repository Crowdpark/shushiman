package com.crowdpark.sushiman.views.player
{

	import flash.geom.Rectangle;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	/**
	 * @author sandberg
	 */
	public class PlayerView extends MovieClip
	{
		public static const SPEED : int = 2;
		
		public function PlayerView(textures : Vector.<Texture>, fps : Number)
		{
			var adjusted:Vector.<Texture> = adjustTextureFrames(textures);
			super(textures, fps);
			
			this.scaleX = 0.8;
			this.scaleY = 0.8;
		}
		
		
		public function adjustTextureFrames(textures : Vector.<Texture>):Vector.<Texture>
		{
			var coll:Vector.<Texture> = new Vector.<Texture>();
			
			for each (var texture:Texture in textures)
			{
				coll.push(Texture.fromTexture(texture, null, new Rectangle(0,0,50,50)));
			}
			return coll;
		}
		
	}
}
