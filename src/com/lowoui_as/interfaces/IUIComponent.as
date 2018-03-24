package com.lowoui_as.interfaces
{
	import com.lowoui_as.core.UIComponent;
	import com.lowoui_as.events.InputEvent;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public interface IUIComponent extends IEventDispatcher
	{
		// Public Getter / Setters:
		
		// DisplayObject
		function get x():Number;
		function set x(value:Number):void;
		
		function get y():Number;
		function set y(value:Number):void;
		
		function get width():Number;
		function set width(value:Number):void;
		
		function get height():Number;
		function set height(value:Number):void;
		
		function get enabled():Boolean;
		function set enabled(value:Boolean):void;
		
		function get tabEnabled():Boolean;
		function set tabEnabled(value:Boolean):void;
		
		function get scale9Grid():Rectangle;
		function set scale9Grid(value:Rectangle):void;
		
		function get alpha():Number;
		function set alpha(value:Number):void;
		
		function get doubleClickEnabled():Boolean;
		function set doubleClickEnabled(value:Boolean):void;
		
		// CLIK
		function get focusTarget():UIComponent;
		function set focusTarget(value:UIComponent):void;
		
		// Public Methods:
		function validateNow(event:Event = null):void;
		function handleInput(event:InputEvent):void;
	}
}