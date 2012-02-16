package com.crowdpark.sushiman.views.hud
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;

	/**
	 * @author sandberg
	 */
	public class HudView extends Sprite
	{
		public static const PREFIX_SCORE : String = "SCORE:";
		
		private var _tfNumOctopussies : TextField = new TextField(100, 80, "10", "Verdana", 36, 0xffffff);
		private var _tfScore : TextField = new TextField(260, 80, "0", "Verdana", 36, 0xffffff);
		private var _tfNumLives : TextField = new TextField(100, 80, "3", "Verdana", 36, 0xffffff);
		public  var background:Image;

		public function HudView(background:Image)
		{
			this.background = background;
			_tfNumOctopussies.x = 100;
			_tfScore.x = 250;
			_tfNumLives.x = 500;

			addChild(background);
			addChild(_tfNumOctopussies);
			addChild(_tfScore);
			addChild(_tfNumLives);
		}

		public function get tfNumOctopussies() : TextField
		{
			return _tfNumOctopussies;
		}

		public function set tfNumOctopussies(tfNumOctopussies : TextField) : void
		{
			_tfNumOctopussies = tfNumOctopussies;
		}

		public function get tfScore() : TextField
		{
			return _tfScore;
		}

		public function set tfScore(tfScore : TextField) : void
		{
			_tfScore = tfScore;
		}

		public function get tfNumLives() : TextField
		{
			return _tfNumLives;
		}

		public function set tfNumLives(tfNumLives : TextField) : void
		{
			_tfNumLives = tfNumLives;
		}
	}
}
