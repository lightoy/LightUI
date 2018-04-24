package com.lowoui_as.events
{
	import com.lowoui_as.component.InputDetails;
	import flash.events.Event;

	public class InputEvent extends Event
	{
		public static const INPUT:String = "input";
		public var details:InputDetails;

		public function InputEvent(type:String, details:InputDetails)
		{
			super(type, true, true);
			this.details = details;
		}
		
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