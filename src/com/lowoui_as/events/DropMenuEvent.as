package com.lowoui_as.events
{
	import flash.events.Event;

	public class DropMenuEvent extends Event
	{
		public static const SELECT:String = "select";

		public function DropMenuEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = true) 
		{
            super(type, bubbles, cancelable);
        }
	}
}