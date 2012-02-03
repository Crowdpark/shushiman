package com.crowdpark.sushiman.commands {
	import org.robotlegs.mvcs.StarlingCommand;

	/**
	 * @author sandberg
	 */
	public class TestCommand extends StarlingCommand {
		public function TestCommand() {
		}
		
		override public function execute():void
		{
			//do something here
			trace("hej");
		}
	}
}
