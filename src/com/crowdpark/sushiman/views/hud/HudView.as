package com.crowdpark.sushiman.views.hud
{
	import flash.geom.Point;
	import starling.text.TextField;
	import starling.display.Sprite;

	/**
	 * @author sandberg
	 */
	public class HudView extends Sprite
	{

		private var _tfNumOctopussies:TextField = new TextField(100, 80,"10","Verdana",36);
		private var _tfScore:TextField = new TextField(100, 80,"0","Verdana",36);
		private var _tfNumLives:TextField = new TextField(100, 80,"3","Verdana",36);
		
		public function HudView()
		{
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
