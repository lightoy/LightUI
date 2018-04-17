package com.lowoui_as.component 
{
	import com.lowoui_as.Extension;
	import com.lowoui_as.core.UIComponent;
	import com.lowoui_as.events.ButtonEvent;
	import com.lowoui_as.utils.PlaySound;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	[Event(name = "buttonOver", type = "com.lowoui_as.events.ButtonEvent")]
	[Event(name = "buttonOut", type = "com.lowoui_as.events.ButtonEvent")]
	[Event(name = "releaseOutside", type = "com.lowoui_as.events.ButtonEvent")]
	[Event(name = "buttonClick", type = "com.lowoui_as.events.ButtonEvent")]
	[Event(name = "select", type = "com.lowoui_as.events.ButtonEvent")]

	public class Button extends UIComponent
	{
		private const bNameMarginU:int = 4;
		
		protected var _beDeselect:Boolean;
		protected var __bName:TextField;
		protected var __bBg  :Object;
		
		private var _isSelected:Boolean;
        private var _isMouseDown:Boolean;
		private var _isButtonGroup:Boolean;
		private var _value:String;
		
		public function Button() 
		{
			super();
			
			_beDeselect    = false;
			_isSelected    = false;
            _isMouseDown = false;
			_isButtonGroup = false;
			
			if (this["tt"] != null)  
			{
				__bName = this["tt"];
				Extension.setTextDisabled(__bName);
			}
			if (this["bg"] != null)
			{
				__bBg = this["bg"];
				__bBg.addEventListener(MouseEvent.MOUSE_OVER, onBtn);
				__bBg.addEventListener(MouseEvent.MOUSE_DOWN, onBtn);
			}
		}
		private function onBtn(e:MouseEvent):void 
		{
			switch (e.type)
			{
				case "mouseOver":
					dispatchEvent(new ButtonEvent(ButtonEvent.OVER));
					PlaySound.sounder.play("Btn_Hover", "onClick");
					__bBg.gotoAndPlay("over");
					__bBg.addEventListener(MouseEvent.MOUSE_OUT,onBtn);
					break;
				case "mouseOut":
					dispatchEvent(new ButtonEvent(ButtonEvent.OUT));
					__bBg.gotoAndPlay("out");
					__bBg.removeEventListener(MouseEvent.MOUSE_OUT,onBtn);
					break;
				case "mouseDown":
					dispatchEvent(new ButtonEvent(ButtonEvent.PRESS));
					PlaySound.sounder.play("Btn_Click_Common", "onClick");
					__bBg.gotoAndPlay("down");
                    if (_isSelected && _beDeselect) { _isMouseDown = true;}
					stage.addEventListener(MouseEvent.MOUSE_UP, onBtn);
					__bBg.removeEventListener(MouseEvent.MOUSE_OUT,onBtn);
					break;
				case "mouseUp":
					stage.removeEventListener(MouseEvent.MOUSE_UP, onBtn);
					trace("dispatchEvent ButtonEvent");
					if (e.target == __bBg)
					{
						dispatchEvent(new ButtonEvent(ButtonEvent.CLICK));
						if (!_isSelected)
						{
							__bBg.gotoAndPlay("up");
							__bBg.addEventListener(MouseEvent.MOUSE_OUT, onBtn);
						}
                        else
						{
							if (_isMouseDown&&_beDeselect) 
							{
								setIsSelected(false); 
							}
						}
					}
					else 
					{
						dispatchEvent(new ButtonEvent(ButtonEvent.RELEASE_OUTSIDE));
						__bBg.gotoAndPlay("up_out"); 
					}
					
                    if(_beDeselect) _isMouseDown = false;
					break;
				default:
			}
		}
		private function setIsSelected(bool:Boolean):void
		{
			if (bool)
			{
				if (_beDeselect){__bBg.removeEventListener(MouseEvent.MOUSE_OVER, onBtn);}
				else{disableEvent();}
				__bBg.gotoAndPlay("down");
			}
			else
			{
				if (_beDeselect){__bBg.addEventListener(MouseEvent.MOUSE_OVER, onBtn);}
				else{enableEvent();}
				__bBg.gotoAndPlay("up_out");
			}
			
			_isSelected = bool;
		}
		private function enableEvent()
		{
			__bBg.mouseChildren = true;
			__bBg.mouseEnabled = true;
		}
		private function disableEvent()
		{
			__bBg.mouseChildren = false;
			__bBg.mouseEnabled = false;
		}
		
		override public function setName(str:String):void 
		{
			__bName.htmlText = str;
			//todo:additional
			_value = str;
		}
		override public function setSize(wid:uint, hei:uint):void
		{
			__bBg.width = wid;
			__bBg.height = hei;
			__bBg.x = __bBg.y = 0;
			
			__bName.width  = wid - bNameMarginU * 2;
			__bName.height = __bName.textHeight + 2;
			__bName.x = bNameMarginU;
			__bName.y = (hei - __bName.height) / 2;
		}
		
		public function setActiveStatus(bool:Boolean):void
		{
			this.mouseChildren = bool;
			this.mouseEnabled = bool;
		}
		public function setEnabled(bool:Boolean):void
		{
			if (bool)
			{
				__bName.alpha = 1;
				__bBg.gotoAndStop("default");
				enableEvent();
			}
			else
			{
				__bName.alpha = 0.3;
				__bBg.gotoAndStop("disabled");
				disableEvent();
			}
		}
		public function set value(str:String):void
		{
			_value = str;
			//todo:additional
			__bName.htmlText = str;
		}
		public function get value():String
		{
			return _value;
		}
		public function set selected(bool:Boolean):void
		{
			_isSelected = bool;
			setIsSelected(_isSelected);
			dispatchEvent(new ButtonEvent(ButtonEvent.SELECT));
		}
		public function get selected():Boolean
		{
			return _isSelected;
		}
		public function set beDeselect(bool:Boolean):void
		{
			_beDeselect = bool;
		}
		public function get beDeselect():Boolean
		{
			return _beDeselect;
		}
		public function setTextSize(n:uint):void
		{
			var tf:TextFormat = new TextFormat();
			tf.size = n;
			__bName.setTextFormat(tf);
		}
		public function setTextAlign(str:String):void
		{
			if(str=="center")    {__bName.autoSize = TextFieldAutoSize.CENTER;}
			else if(str=="left") {__bName.autoSize = TextFieldAutoSize.LEFT;}
			else if(str=="right"){__bName.autoSize = TextFieldAutoSize.RIGHT;}
		}
	}
}