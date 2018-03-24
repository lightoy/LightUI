package com.lowoui_as.events2 
{
    import flash.events.Event;
	
    /**
	 * ...
	 * @author www.loywong.com
	 */
    public final class FocusHandlerEvent extends Event
    {
        
    // Constants:
        public static const FOCUS_IN:String = "CLIK_focusIn";
        public static const FOCUS_OUT:String = "CLIK_focusOut";
        
    // Public Properties:
        public var controllerIdx:uint = 0;
        
    // Protected Properties:
    
    // Initialization:
        public function FocusHandlerEvent(type:String, bubbles:Boolean = true, cancelable:Boolean = false, controllerIdx:uint = 0) { 
           super(type, bubbles, cancelable); 
           this.controllerIdx = controllerIdx;
        }
        
    // Public Methods:
        override public function clone():Event {
            return new FocusHandlerEvent(type, bubbles, cancelable, controllerIdx);
        }
        
        override public function toString():String {
            return formatToString("FocusHandlerEvent", "type", "bubbles", "cancelable", "controllerIdx");
        }
        
    // Protected Methods:
    
    }
    
}