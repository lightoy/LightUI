package com.lowoui_as.events
{
	import flash.events.Event;

	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class DropMenuEvent extends Event
	{
		// Constants:
		public static const SELECT:String = "select";

		public function DropMenuEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = true) 
		{
            super(type, bubbles, cancelable);
        }
	}

}