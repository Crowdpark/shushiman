package com.crowdpark.sushiman
{

	import com.crowdpark.sushiman.views.flashgui.FlashGUIView;
	import fr.kouma.starling.utils.Stats;
	import com.crowdpark.sushiman.views.main.MainContainerView;

	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	import starling.events.Event;

	/**
	 * @author sandberg
	 */
	public class StarlingGame extends starling.display.Sprite
	{
		private var _context : MainContext;
		private var _mainView : MainContainerView;
		private var _stats : Stats;
		

		public function StarlingGame()
		{
			_context = new MainContext(this as DisplayObjectContainer);
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(event : Event) : void
		{
			_stats = new Stats();
			_mainView = new MainContainerView();
			addChild(_mainView);
			// addChild(_stats);
		}


		public function set flashGUI(flashGUI : FlashGUIView) : void
		{
			_mainView.flashGUI = flashGUI;
		}

	}
}
