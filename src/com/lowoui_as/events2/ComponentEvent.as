package com.lowoui_as.events2
{
	import flash.events.Event;

	public class ComponentEvent extends Event
	{
		public static const STATE_CHANGE:String = "stateChange";
		public static const SHOW:String = "show";
		public static const HIDE:String = "hide";
		
		public function ComponentEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = true)
		{
			super(type, bubbles, cancelable);
		}
	}
}