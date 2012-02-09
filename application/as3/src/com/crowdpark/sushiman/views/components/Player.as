package com.crowdpark.sushiman.views.components
{
	import starling.display.MovieClip;
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
