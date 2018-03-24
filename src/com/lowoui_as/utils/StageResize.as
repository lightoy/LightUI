package com.lowoui_as.utils 
{
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class StageResize
	{
		public static var stageWidth:uint = 0;
		public static var stageHeight:uint = 0;
		
		//widget
		private static var widgetLoginArr:Array = [];
		private static var widgetSelectCharacterArr:Array = [];
		private static var widgetLobbyArr:Array = [];
		private static var widgetHudArr:Array = [];
		private static var widgetMinimapArr:Array = [];
		//protected var _managedSprites:Vector.<Sprite>;
		//_managedSprites = new Vector.<Sprite>();
		
		//scene
		//private static var sceneLoginArr:Array = [];
		//private static var sceneSelectCharacterArr:Array = [];
		//private static var sceneLobbyArr:Array = [];
		//private static var sceneHudArr:Array = [];
		
		public function StageResize() 
		{
		}
		public static function setStageElements(obj:Object, type:String, top:Number, right:Number, bottom:Number, left:Number, centerU:Number, centerV:Number):void
		{
			var _obj:Object = { };
			_obj = { "obj":obj, "top":top, "right":right, "bottom":bottom, "left":left, "centerU":centerU, "centerV":centerV };
			
			if (type == "widgetHud")
			{
				widgetHudArr.push(_obj);
			}
			else if (type == "widgetLobby")
			{
				widgetLobbyArr.push(_obj);
			}
		}
		
		public static function resizeStageElements(type:String):void
		{
			if (type == "widgetHud")
			{
				resizeElements(widgetHudArr);
			}
			else if (type == "widgetLobby")
			{
				resizeElements(widgetLobbyArr);
			}
			/*else if (type == "sceneHud")
			{
				resizeElements(sceneHudArr);
			}*/
		}
		private static function resizeElements(objArr:Array):void
		{
			for (var i:int = 0; i < objArr.length; i++) 
			{
				// margin
				if (objArr[i].top!=0 && objArr[i].left!=0)
				{
					objArr[i].obj.x = objArr[i].left;
					objArr[i].obj.y = objArr[i].top;
				}
				else if (objArr[i].top!=0 && objArr[i].right!=0)
				{
					objArr[i].obj.x = objArr[i].top;
					objArr[i].obj.x = stageWidth - objArr[i].right;
				}
				else if (objArr[i].bottom!=0 && objArr[i].left!=0)
				{
					objArr[i].obj.x = objArr[i].left;
					objArr[i].obj.y = stageHeight - objArr[i].bottom;
				}
				else if (objArr[i].bottom!=0 && objArr[i].right!=0)
				{
					objArr[i].obj.x = stageWidth - objArr[i].right;
					objArr[i].obj.y = stageHeight - objArr[i].bottom;
				}
				else if (objArr[i].centerU!=0 && objArr[i].centerV!=0)
				{
					objArr[i].obj.x = stageWidth/2;
					objArr[i].obj.y = stageHeight / 2;
				}
				else if (objArr[i].centerU!=0 && objArr[i].top!=0)
				{
					objArr[i].obj.x = stageWidth/2;
					objArr[i].obj.y = objArr[i].top;
				}
				else if (objArr[i].centerU!=0 && objArr[i].bottom!=0)
				{
					objArr[i].obj.x = stageWidth/2;
					objArr[i].obj.y = stageHeight - objArr[i].bottom;
				}
				else if (objArr[i].centerV!=0 && objArr[i].left!=0)
				{
					objArr[i].obj.x = objArr[i].left;
					objArr[i].obj.y = stageHeight/2;
				}
				else if (objArr[i].centerV!=0 && objArr[i].right!=0)
				{
					objArr[i].obj.x = stageWidth - objArr[i].right;
					objArr[i].obj.y = stageHeight/2;
				}
			}
		}
	}

}