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
		
		public function PlayerView(textures : Vector.<Texture>, fps : Number)
		{
			super(textures, fps);
			
			this.scaleX = 0.5;
			this.scaleY = 0.5;
			
<<<<<<< HEAD
			for each (var texture:Texture in textures)
			{
				coll.push(Texture.fromTexture(texture, null, new Rectangle(0,0,50,50)));
			}
			return coll;
=======
			this.x = 100;
>>>>>>> 010fef347a88e75c4c3010efa4009b43acf79315
		}

		
	}
}
