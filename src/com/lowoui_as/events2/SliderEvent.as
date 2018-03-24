package com.lowoui_as.events2 
{
    import flash.events.Event;

	/**
	 * ...
	 * @author www.loywong.com
	 */
    public class SliderEvent extends Event {
        
    // Constants:
        public static const VALUE_CHANGE:String = "valueChange";
        
    // Public Properties:
        public var value:Number = -1;
        
    // Protected Properties:
        
    // Initialization:
        public function SliderEvent( type:String, bubbles:Boolean=false, cancelable:Boolean=true, value:Number=-1) {
            super(type, bubbles, cancelable);
            this.value = value
        }
        
    // Public getter / setters:
        
    // Public Methods:
        override public function clone():Event {
            return new SliderEvent(type, bubbles, cancelable, value);
        }
        
        override public function toString():String {
            return formatToString("SliderEvent", "type", "bubbles", "cancelable", "value");
        }
        
    // Protected Methods:
        
    }
    
}