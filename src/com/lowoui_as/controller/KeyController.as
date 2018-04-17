package com.lowoui_as.controller {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.display.Stage;

	public class KeyController extends Sprite
	{
		public static const ENTER:String = "ENTER";
		public static const ESC:String   = "ESC";
		public static const F3:String    = "F3";
		public static const F5:String    = "F5";
		public static const F6:String    = "F6";
		public static const TAB:String   = "TAB";
		public static const ALT:String   = "ALT";
		public static const Q:String     = "Q";
		public static const NUM0:String  = "0";
		public static const NUM1:String  = "1";
		public static const NUM2:String  = "2";
		public static const NUM3:String  = "3";
		public static const NUM4:String  = "4";
		public static const NUM5:String  = "5";
		public static const NUM6:String  = "6";
		public static const NUM7:String  = "7";
		public static const NUM8:String  = "8";
		public static const NUM9:String  = "9";
		public static const W:String  = "W";
		public static const A:String  = "A";
		public static const S:String  = "S";
		public static const D:String  = "D";
		
		public static var isCtrl:Boolean  = false;
		public static var isShift:Boolean = false;
		public static var isAlt:Boolean   = false;
		
		
		private var confineKeyEvent:Boolean;
		private var keyPressedValue:String;
		
		public function KeyController() 
		{
			confineKeyEvent = false;
			setupListener();
		}
		/**
		 * add listeners
		 */
		public function setupListener()
		{
			if (stage) initStageEvents();
			else this.addEventListener(Event.ADDED_TO_STAGE, initStageEvents);
		}
		private function initStageEvents(e:Event = null) : void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, fKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, fKeyUp);
		}
		/**
		 * remove listeners
		 */
		public function removeListener()
		{
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, fKeyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, fKeyUp);
		}
		
		/**
		 * when key down
		 * @param	e
		 */
		protected function fKeyDown(e:KeyboardEvent):void
		{
			keyPressedValue = "";
			if (e.altKey || keyPressedValue != ALT) 
				keyPressedValue = ALT;
			switch(e.keyCode)
			{				
				case 13:
					keyPressedValue = ENTER;
					break;
				case 27:
					keyPressedValue = ESC;
					break;
				case 114:
					keyPressedValue = F3;
					break;
				case 116:
					keyPressedValue = F5;
					break;
				case 117:
					keyPressedValue = F6;
					break;
				case 9:
					keyPressedValue = TAB;
					break;
				case 81:
					keyPressedValue = Q;
					break;
				case 49:
					keyPressedValue = NUM0;
					break;
				case 50:
					keyPressedValue = NUM1;
					break;
				case 51:
					keyPressedValue = NUM2;
					break;
				case 52:
					keyPressedValue = NUM3;
					break;
				case 53:
					keyPressedValue = NUM4;
					break;
				case 54:
					keyPressedValue = NUM5;
					break;
				case 55:
					keyPressedValue = NUM6;
					break;
				case 87:
					keyPressedValue = W;
					break;
				case 65:
					keyPressedValue = A;
					break;
				case 83:
					keyPressedValue = S;
					break;
				case 68:
					keyPressedValue = D;
					break;
			}
			
			dispatchEvent(new Event("onKeyDown", true));
		}
		
		/**
		 * when key up
		 * @param	e
		 */
		protected function fKeyUp(e:KeyboardEvent):void
		{
			confineKeyEvent = false;
			
			dispatchEvent(new Event("onKeyUp", true));
		}
		
		public function get value():String
		{
			return keyPressedValue;
		}
	}
}
