package com.lowoui_as.component 
{
	import com.greensock.TweenLite;
	import com.greensock.easing.*;
	import com.lowoui_as.core.UIComponent;
	import com.lowoui_as.events.DragBarEvent;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	[Event(name = "drag", type = "com.lowoui_as.events.DragBarEvent")]

	public class ScrollBar extends UIComponent
	{
		private var thumbObj     :Object;
		private var trackObj     :Object;
		private var w            :uint;
		private var h            :uint;
		private var _rect        :Rectangle;
		private var top          :Number;
		private var left         :Number;
		private var scrollU      :Number;
		private var scrollV      :Number;
		
		protected var _position:Number;
		
		public function ScrollBar() 
		{
			thumbObj = this["thumb"];
			trackObj = this["track"];
			w        = trackObj.width;
			h        = trackObj.height;
			updateDragRect();
			_position = 0;
			
			thumbObj.addEventListener(MouseEvent.MOUSE_DOWN,fMouseDown);
		}
		
		private function updateDragRect()
		{
			top      = 2;
			left     = 1;
			scrollU  = 0;
			scrollV  = h - thumbObj.height- 4;
			_rect = new Rectangle(left, top, scrollU, scrollV);
		}
		private function fMouseDown(e:MouseEvent):void 
		{
			thumbObj.startDrag(false, _rect);
			stage.addEventListener(MouseEvent.MOUSE_MOVE,fMouseMove);
			stage.addEventListener(MouseEvent.MOUSE_UP,fMouseUp);
		}
		private function fMouseMove(e:MouseEvent):void 
		{
			trace("scroll bar...");
			_position = Math.round((thumbObj.y-2)*100/(h - thumbObj.height- 4))/100;
			dispatchEvent(new DragBarEvent(DragBarEvent.DRAG));//,true
		}
		private function fMouseUp(e:MouseEvent):void 
		{
			thumbObj.stopDrag();
			stage.removeEventListener(MouseEvent.MOUSE_MOVE,fMouseMove);
			stage.removeEventListener(MouseEvent.MOUSE_UP,fMouseUp);
		}
		private function updateThumbPos(position:Number):void 
		{
			//thumbObj.y = 2 + position * ((h - thumbObj.height) - 4);
			var _tarY:Number = 2 + position * ((h - thumbObj.height) - 4);
			TweenLite.to(thumbObj, 0.3, { delay:0, y:_tarY, ease:Sine.easeOut } );
		}
		
		public function set sWidth(value:uint) : void
		{
			w = value;
		}		
		public function get sWidth() : uint
		{
			return w;
		}
		public function set sHeight(value:uint) : void
		{
			h = value;
			
			trackObj.height = h;
			updateDragRect();
		}		
		public function get sHeight() : uint
		{
			return h;
		}
		public function setHeight(value:uint) : void
		{
			h = value;
			
			trackObj.height = h;
			updateDragRect();
		}		
		public function getHeight() : uint
		{
			return h;
		}
		
		public function set position(n:Number) : void
		{
			if (n > 1)      { _position = 1; }
			else if (n < 0) { _position = 0; }
			else            { _position = n; }
			updateThumbPos(_position);
		}		
		public function get position() : Number
		{
			return _position;
		}
	}
}