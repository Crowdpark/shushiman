package com.crowdpark.sushiman.commands
{
	import com.crowdpark.sushiman.model.ISushimanModel;

	import org.robotlegs.mvcs.StarlingCommand;

	/**
	 * @author sandberg
	 */
	public class LevelCommand extends StarlingCommand
	{
		[Inject]
		public var model : ISushimanModel;

		override public function execute() : void
		{
		}
	}
}
