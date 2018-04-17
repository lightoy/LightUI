﻿package com.lowoui_as.events
{
	import com.lowoui_as.component.Button;
	import flash.events.Event;

	public class ButtonBarEvent extends Event
	{
		public static const BUTTON_SELECT:String = "buttonSelect";
		public var index:int = -1;
		public var renderer:Button;
		
		public function ButtonBarEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = true, index:int = -1, renderer:Button = null)
		{
			super(type, bubbles, cancelable);
			this.index = index;
			this.renderer = renderer;
		}
		
		override public function clone():Event
		{
			return new ButtonBarEvent(type, bubbles, cancelable, index, renderer);
		}
		
		override public function toString():String
		{
			return formatToString("ButtonBarEvent", "type", "bubbles", "cancelable", "index", "renderer");
		}
	}
}