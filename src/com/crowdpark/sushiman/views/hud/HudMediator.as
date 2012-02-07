package com.crowdpark.sushiman.views.hud
{
	import com.crowdpark.sushiman.model.ISushimanModel;
	import com.crowdpark.sushiman.model.SushimanModelEvent;

	import org.robotlegs.mvcs.StarlingMediator;

	/**
	 * @author sandberg
	 */
	public class HudMediator extends StarlingMediator
	{
		[Inject]
		public var view:HudView;
		
		[Inject]
		public var model : ISushimanModel;
		
		public function HudMediator()
		{
		}

		override public function onRegister():void
		{
			this.eventMap.mapListener(this.eventDispatcher, SushimanModelEvent.UPDATED_SCORE, scoreUpdateHandler);
			this.eventMap.mapListener(this.eventDispatcher, SushimanModelEvent.UPDATED_NUM_LIVES, numLivesUpdateHandler);
			this.eventMap.mapListener(this.eventDispatcher, SushimanModelEvent.UPDATED_NUM_OCTOPUSSIES, numOctopussiesUpdateHandler);
		}

		private function numLivesUpdateHandler(event:SushimanModelEvent) : void
		{
			view.tfNumLives.text = model.numLives.toString();
		}

		private function scoreUpdateHandler(event:SushimanModelEvent) : void
		{
			view.tfScore.text = model.score.toString();
		}

		private function numOctopussiesUpdateHandler(event:SushimanModelEvent) : void
		{
			view.tfNumOctopussies.text = model.numOctopussies.toString();
		}

	}
}