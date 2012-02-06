package com.crowdpark.sushiman.views.main
{
	import starling.animation.Transitions;
	import starling.core.Starling;
	import starling.animation.Tween;
	import starling.display.Image;
	import com.crowdpark.sushiman.utils.Assets;
	import starling.display.Sprite;

	/**
	 * @author francis
	 */
	public class MainContainerView extends Sprite
	{
		public function MainContainerView()
		{
			var n:int = 10;

			for (var i:int = 0;i<n;i++) 
			{
				var im:Image = new Image(Assets.getTexture("Test"));
				im.x = 50 * i;
				im.y = 50 * i;
				this.addChild(im);	
				
				var tween:Tween = new Tween(im, 4.0, Transitions.EASE_IN_OUT);
			    tween.animate("x", im.x + 50);
			    tween.fadeTo(0);
			    Starling.juggler.add(tween); 				
			}
	
		}

	}
}
