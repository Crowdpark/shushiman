package 
{
	import com.crowdpark.sushiman.SushimanGame;
	import org.robotlegs.mvcs.StarlingContext;
	import starling.core.Starling;
	import flash.events.Event;
	import flash.display.Sprite;
	


	[SWF (backgroundColor="0xff0000")]
	public class Main extends Sprite
	{
	
		private var _starling:Starling;
		private var _starlingContext:StarlingContext;
		public function Main()
		{
<<<<<<< HEAD

			this.addEventListener(Event.ADDED_TO_STAGE, stageHandler);
			
=======
			trace("Hello World!");
			// Launch your application by right clicking within this class and select: Debug As > FDT SWF Application
>>>>>>> 32d12c75c9d7e48f45462d80b17707453322b41e
		}
		
		
		private function stageHandler(event:Event):void
		{
			trace("hej");
			_starling = new Starling(SushimanGame, stage);
			_starling.start();
		}

	}
}

