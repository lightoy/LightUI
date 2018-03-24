package com.lowoui_as.events
{
	import com.lowoui_as.component.InputDetails;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class InputEvent extends Event
	{
		
		// Constants:
		public static const INPUT:String = "input";
		
		// Public Properties:
		public var details:InputDetails;
		
		// Protected Properties:
		
		// Initialization:
		public function InputEvent(type:String, details:InputDetails)
		{
			super(type, true, true);
			this.details = details;
		}
		
		// Public getter / setters:
		// This can be modified to use preventDefault, stopPropagation, or any other internal property depending on needs.
		public function get handled():Boolean
		{
			return isDefaultPrevented();
		}
		
		public function set handled(value:Boolean):void
		{
			if (value)
			{
				preventDefault();
			}
		}
		
		// Public Methods:	
		override public function clone():Event
		{
			return new InputEvent(type, details);
		}
		
		override public function toString():String
		{
			return formatToString("InputEvent", "type", "details");
		}
	}
}