package 
{
	import starling.core.Starling;

	import com.crowdpark.sushiman.SushimanGame;

	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(backgroundColor="#FFFFFF", frameRate="36", width="640", height="480")]
	public class Main extends Sprite
	{
	
		private var _starling:Starling;
		
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

