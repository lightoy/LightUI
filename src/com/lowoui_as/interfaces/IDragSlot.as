package com.lowoui_as.interfaces 
{
	import com.lowoui_as.events.DragEvent;
    import flash.display.Sprite;

    public interface IDragSlot extends IUIComponent 
	{
		// Public Getter / Setters:
        function get data():Object;
        function set data(value:Object):void;
        
        function get content():Sprite;
        function set content(value:Sprite):void;
        
		// Public Methods:
        function handleDropEvent(e:DragEvent):Boolean;
        function handleDragStartEvent(e:DragEvent):void;
        function handleDragEndEvent(e:DragEvent, wasValidDrop:Boolean):void;
    }
}