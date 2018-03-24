package com.lowoui_as.events2
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class ComponentEvent extends Event
	{
		// Constants:
		public static const STATE_CHANGE:String = "stateChange";
		public static const SHOW:String = "show";
		public static const HIDE:String = "hide";
		
		// Public Properties:
		
		// Protected Properties:
		
		// Initialization:
		public function ComponentEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = true)
		{
			super(type, bubbles, cancelable);
		}
	
		// Public getter / setters:
	
		// Public Methods:
	
		// Protected Methods:
	}
}