package com.loywong 
{
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class Global 
	{
		
		public function Global() 
		{
			
		}
		
		
		public static function setTextDisabled(...args):void
		{
			for (var i:uint = 0; i < args.length; i++) 
			{
				args[i].selectable = false;
				args[i].mouseEnabled = false;
			}
		}
		public static function setMcDisabled(...args):void
		{
			for (var i:uint = 0; i < args.length; i++) 
			{
				args[i].mouseChildren = false;
				args[i].mouseEnabled = false;
			}
		}
	}

}