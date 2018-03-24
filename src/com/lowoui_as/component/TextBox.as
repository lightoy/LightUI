package com.lowoui_as.component 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class TextBox extends Sprite
	{
		private var tf:TextFormat;
		private var __tt:TextField;
		
		public function TextBox() 
		{
			tf = new TextFormat();
			__tt = this["tt"];
		}
		
		/**public functions*/
		public function setText(str:String):void
		{
			__tt.htmlText = str;
			
			__tt.width = __tt.textWidth;
		}
		public function setColor(n:uint):void
		{
			tf.color = n;
			__tt.setTextFormat(tf);
		}
	}

}