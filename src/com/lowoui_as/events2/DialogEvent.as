package com.lowoui_as.events2
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class DialogEvent extends Event
	{
		// Constants:
		public static const CLOSE:String = "dialogClose";
		public static const SUBMIT:String = "dialogSubmit";
		
		// Public Properties:
		
		// Protected Properties:
		
		// Initialization:
		public function DialogEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = true)
		{
			super(type, bubbles, cancelable);
		}
		
		// Public getter / setters:
		
		// Public Methods:
		
		// Protected Methods:
	}
}