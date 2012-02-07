package com.crowdpark.sushiman.views.player
{
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.textures.Texture;

	/**
	 * @author sandberg
	 */
	public class Player extends MovieClip
	{
		public function Player(textures:Vector.<Texture>,fps:Number)
		{
			super(textures,fps);
		}
	}
}
