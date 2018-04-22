package com.lowoui_as 
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;

	public class Extension 
	{
		public static function setMcDisabled(...args):void
		{
			for (var i:uint = 0; i < args.length; i++) 
			{
				args[i].mouseChildren   = false;
				args[i].mouseEnabled = false;
			}
		}
		public static function setTextDisabled(...args):void
		{
			for (var i:uint = 0; i < args.length; i++) 
			{
				args[i].selectable   = false;
				args[i].mouseEnabled = false;
			}
		}
		public static function setViewRect(obj:Object,posX:int,posY:int,width:int,height:int):void
		{
			var rectView:Rectangle = new Rectangle(posX, posY, width, height);
			obj.scrollRect = rectView;
		}
		public static function setInvisible(obj:Object):void
		{
			obj.alpha = 1;
			obj.gotoAndStop(1);
			obj.visible = false;
		}
		public static function getInsClass(instanceName:String):Class
		{
			var _instanceClass:Class = getDefinitionByName(instanceName) as Class;
			
			return _instanceClass;
		}
		public static function getInstanceObj(instanceName:String):Object
		{
			var _instanceClass:Class = getDefinitionByName(instanceName) as Class;
			var _item:Object = new _instanceClass();
			
			return _item;
		}
		public static function clearContainerItems(con:Object, arr:Array):void 
		{
			for (var i:uint = 0; i < arr.length; i++) 
				con.removeChild(arr[i]);
		}
		public static function localToGlobalPos(localObj:Object,toObj:Object):Point
		{
			var _pt:Point = toObj.localToGlobal(new Point(localObj.x, localObj.y));
			
			return _pt;
		}
	}
}