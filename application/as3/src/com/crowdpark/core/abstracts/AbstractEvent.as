package com.crowdpark.core.abstracts
{
	import flash.events.Event;

	/**
	 * @author Francis Varga
	 */
	public class AbstractEvent extends Event
	{
		private var _dataProvider : Object;

		public function AbstractEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

		public function get dataProvider() : Object
		{
			return _dataProvider;
		}

		public function set dataProvider(dataProvider : Object) : void
		{
			_dataProvider = dataProvider;
		}
	}
}
