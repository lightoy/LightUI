package com.lowoui_as.controller 
{
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class BasicController
	{
		protected var _target:*;//gameObject
		
		public function BasicController() 
		{
			//
		}
		
		/**
		 * set control target object
		 */
		public function set target(obj:gameObject):void
		{
			_target = obj
		}
		
		public function die():void { }
		public function autoRun():void { }
	}
}