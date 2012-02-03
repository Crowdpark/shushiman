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

			this.addEventListener(Event.ADDED_TO_STAGE, stageHandler);
			
		}
		
		
		private function stageHandler(event:Event):void
		{
			trace("hej");
			_starling = new Starling(SushimanGame, stage);
			_starling.start();
		}

	}
}
