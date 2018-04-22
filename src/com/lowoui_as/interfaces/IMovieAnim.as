package com.lowoui_as.interfaces
{
	public interface IMovieAnim
	{
		function movieIn():void;
		function movieOut():void;
		function setActiveState():void;
		function setInactiveState():void;
		
		function get data():Object;
		function set data(value:Object);
		function get content():Sprite;
		function set content(value:Sprite):void;
		
		function handleDropEvent(e:MovieEvent):Boolean;
		function handleDragStartEvent(e:MovieEvent):void;
		function handleDragEndEvent(e:MovieEvent, wasValidDrop:Boolean):void;
	}
}