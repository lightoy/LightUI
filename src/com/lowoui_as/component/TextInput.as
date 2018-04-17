package com.lowoui_as.component 
{
	import com.lowoui_as.core.UIComponent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	public class TextInput extends UIComponent
	{
		public var textType:String;
		public var textValue:String;
		public var textFocus:Boolean;
		
		private var iName:TextField;
		private var iTT:TextField;
		private var iBg:MovieClip;
		
		public function TextInput()
		{
			iName = this["name_"];
			iTT   = this["tt"];
			iBg   = this["bg"];
			
			var ttLength:uint = (iTT.text).length;
			iTT.setSelection(ttLength, ttLength);
			
			this.addEventListener(MouseEvent.MOUSE_OVER, onBtn);
			iTT.addEventListener(KeyboardEvent.KEY_UP, checkInputKeyForSubmit, false, 0, true);
		}
		override protected function addedToStage(evt:Event = null) : void
		{
			super.addedToStage(null);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, checkInputKeyForState, false, 0, true);
		}
		
		private function onBtn(e:MouseEvent):void 
		{
			switch (e.type) 
			{
				case "mouseOver":
					if (!textFocus)
					{
						iBg.gotoAndStop("over");
						this.addEventListener(MouseEvent.MOUSE_OUT, onBtn);
					}
					break;
				case "mouseOut":
					if (!textFocus) { iBg.gotoAndStop("defocus"); }
					this.removeEventListener(MouseEvent.MOUSE_OUT, onBtn);
					
					break;
				default:
			}
		}
		private function checkInputKeyForState( event:MouseEvent ) : void 
		{
			if (event.target == iTT)
			{
				iBg.gotoAndPlay("focus");
				textFocus = true;
			}
			else
			{
				iBg.gotoAndStop("defocus");
				textFocus = false;
			}
		}
		private function checkInputKeyForSubmit( event:KeyboardEvent ) : void 
		{            
			/*var TargetTextInput:TextInput = event.target.parent as TextInput; // Retrieve a reference to the textInput.*/            
            if ( event.keyCode == 13 ) 
			{
				trace( iTT.text );
				
                //EventLog.appendText( "\n" + TargetTextInput.text ); // Append the text to the log.
                //updateEventLog(); // Update the EventLog(), scrolling it if necessary.
                //trace( TargetTextInput + ".text: " + TargetTextInput.text);
                //TargetTextInput.text = ""; // Clear the textField.
			}
        }
		
		/**
		 * ---------------------------------------
		 *     set this component's parameters
		 * ---------------------------------------
		 */
		public function set value(str:String):void
		{
			iTT.text = str;
		}
		public function get value():String
		{
			return iTT.text;
		}
		public function set focus(bool:Boolean):void
		{
			setFocus(bool);
		}
		public function get focus():Boolean
		{
			return textFocus;
		}
		public function set type(str:String):void
		{
			textType = str;
			
			if (textType == "Username")
			{ iTT.maxChars = 15; }
			else if (textType == "Password")
			{
				iTT.maxChars = 15;
				iTT.displayAsPassword = true;
			}
		}
		public function get type():String
		{
			return textType;
		}
		
		
		override public function setName(str:String) : void 
		{
			iName.text = str;
		}
		override public function setSize(wid:uint, hei:uint) : void
		{
			iBg.width = wid;
			iBg.hei   = hei;
			
			//tt.width    = wid;
			//tt.fontSize = hei-2;
		}
		override public function setType(str:String) : void
		{
			textType = str;
			if (textType == "Username")
			{
				iTT.maxChars = 15; 
			}
			else if (textType == "Password")
			{
				iTT.maxChars = 15;
				iTT.displayAsPassword = true;
			}
		}
		override public function setFocus(bool:Boolean) : void
		{
			textFocus = bool;
			
			if (stage) { _setFocus(); }
			else       { addEventListener(Event.ADDED_TO_STAGE, _setFocus, false, 0, true); }
		}
		
		private function _setFocus():void 
		{
			if (textFocus) 
			{
				stage.focus = iTT; 
				iBg.gotoAndPlay("focus"); 
			}
			else
			{ 
				stage.focus = null;
				iBg.gotoAndStop("defocus"); 
			}
		}
}