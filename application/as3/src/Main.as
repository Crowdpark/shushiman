package 
{
	import starling.core.Starling;

	import com.crowdpark.sushiman.SushimanContext;
	import com.crowdpark.sushiman.SushimanGame;

	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width="760", height="650", frameRate="60", backgroundColor="#000000")]
	public class Main extends Sprite
	{
	
		private var _starling:Starling;
		private var _starlingContext:SushimanContext;
		
		public function Main()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, stageHandler); 
		}
		
		private function stageHandler(event:Event):void
		{
			_starling = new Starling(SushimanGame, stage);
			_starling.start();
		}
	}
}

