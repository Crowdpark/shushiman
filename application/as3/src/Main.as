package {
	import flash.display.Stage3D;
	import com.crowdpark.sushiman.views.flashgui.FlashGUIView;
	import flash.geom.Rectangle;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;

	import starling.core.Starling;
	import com.crowdpark.sushiman.StarlingGame;

	import flash.display.Sprite;
	import flash.events.Event;

	/*
	 * TODO: 
	 * Understand why the swf metadata does not work.
	 * Is it because of fdt, wmode, Starling?
	 * Position of player + octopussies should be in the level json
	 */
	[SWF(width="760", height="650", frameRate="60", backgroundColor="#000000")]
	public class Main extends Sprite
	{
		private var _starling : Starling;
		private var _gui:FlashGUIView;
		private var _starlingGame:StarlingGame;

		public function Main()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			this.addEventListener(Event.ADDED_TO_STAGE, stageHandler);
		}

		private function stageHandler(event : Event) : void
		{
			_gui = new FlashGUIView();
			addChild(_gui);
			
			_starling = new Starling(StarlingGame, stage);
			_starling.start();
			
			var stage3D:Stage3D = stage.stage3Ds[0];
			stage3D.addEventListener(Event.CONTEXT3D_CREATE, onContextCreated);
			
			var viewPortRectangle:Rectangle = new Rectangle();
			viewPortRectangle.width = stage.stageWidth;
			viewPortRectangle.height = stage.stageHeight;
			Starling.current.viewPort = viewPortRectangle;
			_starling.stage.stageWidth = stage.stageWidth;
			_starling.stage.stageHeight = stage.stageHeight;
		}

		private function onContextCreated(event : Event) : void
		{
			_starlingGame = Starling.current.stage.getChildAt(0) as StarlingGame;
			_starlingGame.flashGUI = _gui;
		}
	}
}

