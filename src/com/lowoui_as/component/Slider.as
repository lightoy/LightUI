package com.lowoui_as.component 
{
	import com.lowoui_as.core.UIComponent;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;

	public class Slider extends UIComponent
	{
		//private var cName:TextField;
		//private var cBg:MovieClip;
		private var _value:Number;
		
		private var sThumb:Object;
		private var sTrack:Object;
		private var sValue:Object;
		private var rect:Rectangle;
		
		public function Slider() 
		{
			selectedState = false;
			enabledState  = false;
			
			_value = 0;
			sThumb = this["thumb"];
			sTrack = this["track"];
			sValue = this["valueText"];
			rect = new Rectangle(0, 0, sTrack.width, 0);
			
			sValue.selectable = false;
			sValue.mouseEnabled = false;
			
			//sThumb.addEventListener(MouseEvent.MOUSE_OVER, onBtn);
			sThumb.addEventListener(MouseEvent.MOUSE_DOWN, onBtn);
		}
		
		private function onBtn(e:MouseEvent):void 
		{
			switch (e.type) 
			{
				case "mouseOver":
					//if (_selectedState) { cBg.gotoAndStop("selected_over"); }
					//else                { cBg.gotoAndStop("over"); }
					//
					//cBg.addEventListener(MouseEvent.MOUSE_OUT,onBtn);
					break;
				case "mouseOut":
					//if (_selectedState) { cBg.gotoAndStop("selected_up"); }
					//else                { cBg.gotoAndStop("up"); }
					//
					//cBg.removeEventListener(MouseEvent.MOUSE_OUT,onBtn);
					break;
				case "mouseDown":
					sThumb.startDrag(false, rect);
					/*if (_selectedState)
					{
						_selectedState = false;
						cBg.gotoAndStop("down");
					}
					else
					{
						_selectedState = true;
						cBg.gotoAndStop("selected_down");
					}
					*/
					stage.addEventListener(MouseEvent.MOUSE_UP, onBtn);
					stage.addEventListener(MouseEvent.MOUSE_MOVE, onBtn);
					//cBg.removeEventListener(MouseEvent.MOUSE_OUT,onBtn);
					break;
				case "mouseUp":
					sThumb.stopDrag();
					updateValue();
					/*if (e.target == cBg) 
					{
						if (_selectedState) 
						{ cBg.gotoAndStop("selected_over");	}
						else                
						{ cBg.gotoAndStop("over"); }
						
						bg.addEventListener(MouseEvent.MOUSE_OUT,onBtn);
					}
					else 
					{
						if (_selectedState) 
						{ cBg.gotoAndStop("selected_up"); }
						else                
						{ cBg.gotoAndStop("up"); }
					}
					*/
					stage.removeEventListener(MouseEvent.MOUSE_UP, onBtn);
					stage.removeEventListener(MouseEvent.MOUSE_MOVE, onBtn);
					break;
				case "mouseMove":
					updateValue();
				    break;
				default:
			}
		}
		private function updateValue()
		{
			_value = Math.round(sThumb.x * 100 / sTrack.width) / 100;
			sValue.text = Math.round(_value * 100) + "%";
		}
		private function updateThumbPos(n:Number) : void 
		{
			sThumb.x = sTrack.width * n;
		}
		
		
		public function set value(n:Number) : void
		{
			_value = n;
			updateThumbPos(_value);
			updateValue();
		}		
		public function get value() : Number
		{
			return _value;
		}
	}

}