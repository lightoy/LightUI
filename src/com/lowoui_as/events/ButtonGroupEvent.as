package com.lowoui_as.events
{
	import com.lowoui_as.events.ButtonGroupEvent;
	import com.lowoui_as.events.ButtonBarEvent;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class ButtonGroupEvent extends Event
	{
		
		// Constants:
		public static const BUTTON_SELECT:String = "buttonSelect";
		
		// Public Properties:
		public var index:int = -1;
		
		// Protected Properties:
		
		// Initialization:
		public function ButtonGroupEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = true, index:int = -1)
		{
			super(type, bubbles, cancelable);
			this.index = index;
		}
		
		// Public getter / setters:
		
		// Public Methods:
		override public function clone():Event
		{
			return new ButtonBarEvent(type, bubbles, cancelable, index);
		}
		
		override public function toString():String
		{
			return formatToString("ButtonBarEvent", "type", "bubbles", "cancelable", "index");
		}
		// Protected Methods:
	}
}