package com.lowoui_as
{
	public class BasicController
	{
		protected var _target:*;

		public function BasicController()  { }

		public function set target(obj:gameObject):void
		{
			_target = obj
		}

		public function die():void { }
		public function autoRun():void { }
	}
}
