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
			// Remove Stats inst prior to deployment
			_stats = new Stats();
			_stats.x = 0;
			
			_mainView = new MainContainerView();
			_mainView.x = 0;//(stage.stageWidth - _mainView.width >> 1 ) + (_mainView.width >> 1); 
			_mainView.y = 0;//(stage.stageHeight - _mainView.height >> 1) + (_mainView.height >> 1);
			addChild(_mainView);
			
			//addChild(_stats);
		}
	}
}
