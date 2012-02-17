package com.crowdpark.sushiman.views.player
{

	import starling.display.MovieClip;
	import starling.textures.Texture;
	/**
	 * @author sandberg
	 */
	public class PlayerView extends MovieClip
	{
		public static const SPEED : int = 2;
		public static const START_X:int = 10;
		public static const START_Y:int = 200;
		
		public function PlayerView(textures : Vector.<Texture>, fps : Number)
		{
			super(textures, fps);
		}
		
		
		public function resetPosition():void
		{
			x = START_X;
			y = START_Y;
		}
	}
}
