package com.lowoui_as.events2 
{
    import flash.events.Event;

    public class IndexEvent extends Event {
        
        public static const INDEX_CHANGE:String = "clikIndexChange"; //LM: Evaluate.
        
        public var index:int = -1;
        public var lastIndex:int = -1;
        public var data:Object;
        
        public function IndexEvent (type:String, bubbles:Boolean=false, cancelable:Boolean=true, 
                                    index:int=-1, lastIndex:int=-1, data=null) {
            super(type, bubbles, cancelable);
            
            this.index = index;
            this.lastIndex = lastIndex;
            this.data = data;
        }
        
        override public function clone():Event {
            return new IndexEvent(type, bubbles, cancelable, index, lastIndex, data);
        }
        
        override public function toString():String {
            return formatToString("IndexEvent", "type", "bubbles", "cancelable", "index", "lastIndex", "data");
        }
    }
}