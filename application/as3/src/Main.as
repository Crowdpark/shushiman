package {
	import flash.geom.Rectangle;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;

	import starling.core.Starling;

	import com.crowdpark.sushiman.SushimanContext;
	import com.crowdpark.sushiman.SushimanGame;

	import flash.display.Sprite;
	import flash.events.Event;

	/*
	 * TODO: Understand why the swf metadata does not work.
	 * Is it because of fdt, wmode, Starling?
	 */
	[SWF(width="760", height="650", frameRate="60", backgroundColor="#000000")]
	public class Main extends Sprite
	{
		private var _starling : Starling;
		private var _starlingContext : SushimanContext;

		public function Main()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			this.addEventListener(Event.ADDED_TO_STAGE, stageHandler);
		}

		private function stageHandler(event : Event) : void
		{
			_starling = new Starling(SushimanGame, stage);
			_starling.start();
			
			var viewPortRectangle:Rectangle = new Rectangle();
			viewPortRectangle.width = stage.stageWidth;
			viewPortRectangle.height = stage.stageHeight;
			Starling.current.viewPort = viewPortRectangle;
 
			_starling.stage.stageWidth = stage.stageWidth;
			_starling.stage.stageHeight = stage.stageHeight;
		}
	}
}

