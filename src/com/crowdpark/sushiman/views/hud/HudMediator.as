package com.crowdpark.sushiman.views.hud
{
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.model.SushimanModel;
	import org.robotlegs.mvcs.StarlingMediator;

	/**
	 * @author sandberg
	 */
	public class HudMediator extends StarlingMediator
	{
		[Inject]
		public var view:HudView;
		
		[Inject]
		public var model:ISushimanModel;
		
		public function HudMediator()
		{
		}

		override public function onRegister():void
		{
			initTextFields();
		}

		private function initTextFields() : void 
		{
			view.tfNumOctopussies.text = "10";
			view.tfScore.text = "0";
			view.tfNumLives.text = "3";
		}
	}
}