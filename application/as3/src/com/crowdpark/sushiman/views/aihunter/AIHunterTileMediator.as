package com.crowdpark.sushiman.views.aihunter
{
	import org.robotlegs.mvcs.StarlingMediator;
	/**

	 * @author szalwinski
	 */
	 
	public class AIHunterTileMediator extends StarlingMediator
	{
		[Inject]
		private var _view:AIHunterTileView;
		
		override public function onRegister():void
		{
			super.onRegister();
			trace(_view);
		}
	}
}
