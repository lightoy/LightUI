﻿package com.lowoui_as.events 
{
	import flash.events.Event;
    import flash.events.MouseEvent;

    public class ButtonEvent extends Event 
	{
        public static const OVER:String = "buttonOver";
        public static const OUT:String = "buttonOut";
        public static const PRESS:String = "buttonPress";
        public static const CLICK:String = "buttonClick";
        public static const DRAG_OVER:String = "dragOver";
        public static const DRAG_OUT:String = "dragOut";
        public static const RELEASE_OUTSIDE:String = "releaseOutside";
        public static const SELECT:String = "select";
        
        /** The index of the controller/mouse used to generate the event (applicable only for multi-mouse cursor environments). */
        public var controllerIdx:uint = 0;
        /** The index of the button on the controller/mouse used to generate the event. */
        public var buttonIdx:uint = 0;
        /** true if the event was generated by a keyboard/gamepad; false if the event was generated by a mouse. */
        public var isKeyboard:Boolean = false;
        /** true if the event was generated by an autoRepeating button being held down; false the button is not currently repeating. */
        public var isRepeat:Boolean = false;
        
        public function ButtonEvent(type:String, bubbles:Boolean = true, cancelable:Boolean = false) {
            super(type, bubbles, cancelable);
        }
        // override public function clone():Event {
        //     return new ButtonEvent(type, bubbles, cancelable);
        // }
        
        // override public function toString():String {
        //     return formatToString("ButtonEvent", "type", "bubbles", "cancelable");
        // }
    }
}