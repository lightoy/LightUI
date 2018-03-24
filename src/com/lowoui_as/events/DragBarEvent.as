package com.lowoui_as.events
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class DragBarEvent extends Event
	{
		// Constants:
		public static const DRAG:String = "drag";
		
		/*public function MovieEvent(type:String, bubbles:Boolean = true, cancelable:Boolean = false,
		   controllerIdx:uint = 0, buttonIdx:uint = 0, isKeyboard:Boolean = false,
		   isRepeat:Boolean = false)
		   {
		   super(type, bubbles, cancelable);
		 }*/
		
		public function DragBarEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = true)
		{
			super(type, bubbles, cancelable);
		}
	}
}