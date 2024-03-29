package com.crowdpark.sushiman
{
	import fr.kouma.starling.utils.Stats;
	import com.crowdpark.sushiman.views.main.MainContainerView;

	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	import starling.events.Event;

	/**
	 * @author sandberg
	 */
	public class SushimanGame extends Sprite
	{
		private var _context : SushimanContext;
		private var _mainView : MainContainerView;
		private var _stats : Stats;

		public function SushimanGame()
		{
			_context = new SushimanContext(this as DisplayObjectContainer);
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(event : Event) : void
		{
			_stats = new Stats();
			_mainView = new MainContainerView();
			addChild(_mainView);
			addChild(_stats);
		}
	}
}
