package com.lowoui_as.events
{
	import flash.events.Event;
	
	public class DragBarEvent extends Event
	{
		public static const DRAG:String = "drag";
		
		public function DragBarEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = true)
		{
			super(type, bubbles, cancelable);
		}
	}
}