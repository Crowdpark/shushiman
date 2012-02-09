package com.crowdpark.sushiman.views.player
{
	import starling.display.MovieClip;
	import starling.textures.Texture;
	/**
	 * @author sandberg
	 */
	public class PlayerView extends MovieClip
	{
		public static const SPEED : int = 5;
		
		public function PlayerView(textures : Vector.<Texture>, fps : Number)
		{
			super(textures, fps);
		}


		
	}
}
