package com.lowoui_as.utils 
{	
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class TextStyle extends TextField
	{
		private static var tf:TextFormat;
		
		public function TextStyle() 
		{
		}
		
		public static function setColorYellow(tt:TextField):void
		{
			tf = new TextFormat();
			tf.color = 0xFFCC00;
			tt.setTextFormat(tf);
		}
		public static function setColorGreen(tt:TextField):void
		{
			tf = new TextFormat();
			tf.color = 0x33FF00;
			tt.setTextFormat(tf);
		}
		public static function setColorRed(tt:TextField):void
		{
			tf = new TextFormat();
			tf.color = 0xFF0000;
			tt.setTextFormat(tf);
		}
	}
}