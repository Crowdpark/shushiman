package com.crowdpark.core.abstracts
{
	import org.robotlegs.mvcs.Actor;

	/**
	 * @author Francis Varga
	 */
	public class AbstractService extends Actor
	{
		private var _gatewayUrl : String;

		public function get gatewayUrl() : String
		{
			return _gatewayUrl;
		}

		public function set gatewayUrl(gatewayUrl : String) : void
		{
			_gatewayUrl = gatewayUrl;
		}
	
	}
}
