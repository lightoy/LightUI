package com.lowoui_as.events
{
	import com.lowoui_as.interfaces.IDragSlot;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class DragEvent extends Event
	{
		// Constants:
		public static const DROP:String = "drop";
		public static const DRAG_START:String = "dragStart";
		public static const DRAG_END:String = "dragEnd";
		
		// Public Properties:
		public var dragData:Object;
		public var dragTarget:IDragSlot;
		public var dropTarget:IDragSlot;
		public var dragSprite:Sprite;
		
		// Protected Properties:
		
		// Initialization:
		public function DragEvent(type:String, data:Object, drag:IDragSlot, drop:IDragSlot, sprite:Sprite, bubbles:Boolean = true, cancelable:Boolean = true)
		{
			dragData = data;
			dragTarget = drag;
			dropTarget = drop;
			dragSprite = sprite;
			super(type, bubbles, cancelable);
		}
	
		// Public Getter / Setters:
	
		// Public Methods:
	
		// Protected Methods:
	
	}
}