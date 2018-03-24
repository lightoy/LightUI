package com.lowoui_as.controller 
{
	//TODO refactor
	import com.lowoui_as.sample.config.AssetPath;
	import com.lowoui_as.sample.Global;
	
	import flash.display.Sprite;
	import com.lowoui_as.component.LoaderSWF;
	import com.lowoui_as.sample.config.Scene;
	import com.lowoui_as.dialogs.Dialog;
	import com.greensock.TweenLite;
	import com.greensock.easing.*;
	
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class WidgetController extends Sprite
	{
		public static var _container:Object;	
		public static var widgetsArr:Array = [];
		
		private var yesnoDialog:LoaderSWF;
		private var yesDialog:LoaderSWF;
		private var noticeDialog:LoaderSWF;
		
		public function WidgetController() 
		{
		}
		
		/**
		 * Scene
		 * @param	sName
		 */
		public function LoadScene(sName:String) : void
		{			
			if (Global.hudManager != null) Global.hudManager.UpdateChatMsg("scene name:"+sName);
			
			UnloadAllWidget();
			loadWidgets(Scene["scene_" + sName]);
			
			Global.currScene = sName;
		}
		private function loadWidgets(arr:Array) : void 
		{
			for (var i:int = 0; i < arr.length; i++) 
			{ LoadWidget(arr[i][0], arr[i][1]); }
		}
		//Scene Out
		public function SceneMovieOut(sName:String):void 
		{
			for (var i:int = 0; i < widgetsArr.length; i++) 
			{
				if (widgetsArr[i].visible && widgetsArr[i].contentCon.beMovieView)
				{ widgetsArr[i].contentCon.closeView(); }
			}
		}
		
		/**
		 * Widget
		 * @param	wName
		 */
		public function LoadWidget(wName:String,depth:int) : void
		{			
			if (Global.hudManager != null) Global.hudManager.UpdateChatMsg("scene name:"+wName);
			
			for (var i:int = 0; i < widgetsArr.length; i++) 
			{
				if (widgetsArr[i].name == wName) 
				{
					trace("load widget exsit!");
					widgetsArr[i].contentCon.openView();
					
					return; 
				}
			}
			
			var widgetCon:LoaderSWF = new LoaderSWF();
			widgetCon.name = wName;
			widgetCon.loadSWF(AssetPath.swfURL(wName));
			_container.addChild(widgetCon);
			
			//set widget weight
			widgetCon.widgetWeight = depth;
			
			widgetsArr.push(widgetCon);
		}
		public function CloseWidget(wName:String) : void
		{
			if (widgetsArr.length == 0) { return; }
			
			for (var i:int = 0; i < widgetsArr.length; i++) 
			{
				if (widgetsArr[i].name == wName)
				{
					widgetsArr[i].contentCon.closeView();
				}
			}
		}
		public function CloseCurrSceneWidgets()
		{
			if (widgetsArr.length == 0) { return; }
			
			for (var i:int = 0; i < widgetsArr.length; i++) 
			{
				widgetsArr[i].contentCon.closeView();
			}
		}
		public function UnloadWidget(wName:String) : void
		{
			if (widgetsArr.length == 0) { return; }
			
			for (var i:int = 0; i < widgetsArr.length; i++) 
			{
				if (widgetsArr[i].name == wName)
				{					
					//var index:uint = widgetsArr.indexOf(wCon);
					widgetsArr[i].unloadSWF();
					_container.removeChild(widgetsArr[i]);
					widgetsArr[i] = null;
					
					widgetsArr.splice(i, 1);
				}
			}
		}
		public function UnloadAllWidget()
		{
			if (widgetsArr.length == 0) { return; }
			
			for (var i:int = 0; i < widgetsArr.length; i++) 
			{
				widgetsArr[i].unloadSWF();
				
				_container.removeChild(widgetsArr[i]);
				widgetsArr[i] = null;
			}
			widgetsArr = [];
		}
		//set visible status
		public function SetWidgetVisible(wName:String,visible:Boolean) : void
		{
		}
		//change widget property : size
		public function SetWidgetSize(wName:String, width:uint, height:uint) : void
		{
		}
		
		
		/**
		 * Dialog
		 */
		public function OpenDialogYesNo(title:String, info:String, yesCallFun:String, noCallFun:String) : void
		{
			Dialog.dialogTitle     = title;
			Dialog.dialogInfo      = info;
			Dialog.dialogBtnYesFun = yesCallFun;
			Dialog.dialogBtnNoFun  = noCallFun;
			
			openDialogToStage(yesnoDialog,"YesNoDialog");
		}
		public function OpenDialogYes(title:String, info:String, yesCallFun:String) : void
		{
			trace("yesCallFun:"+yesCallFun);
			Dialog.dialogTitle     = title;
			Dialog.dialogInfo      = info;
			Dialog.dialogBtnYesFun = yesCallFun;
			
			openDialogToStage(yesDialog,"YesDialog");
		}
		public function OpenDialogNotice(title:String, info:String, time:Number) : void
		{
			Dialog.dialogTitle        = title;
			Dialog.dialogInfo         = info;
			Dialog.dialogDurationTime = time;
			
			openDialogToStage(noticeDialog, "NoticeDialog");
		}
		public function CloseDialog(dialogName:String) : void
		{
			var _dialog:Object;
			
			switch (dialogName) 
			{
				case "YesNoDialog":
					_dialog = yesnoDialog.contentCon["dialog"];
					break;
				case "YesDialog":
					_dialog = yesDialog.contentCon["dialog"];
					break;
				case "NoticeDialog":
					_dialog = yesDialog.contentCon["dialog"];
					break;
				default:
			}
			
			_dialog.closeDialog();
		}
		private function openDialogToStage(dialogLoader:LoaderSWF, dialogLoaderName:String) : void 
		{
			if (dialogLoader == null)
			{
				dialogLoader = new LoaderSWF();
				dialogLoader.name = dialogLoaderName;
				dialogLoader.loadSWF(AssetPath.swfURL(dialogLoaderName));
				_container.addChild(dialogLoader);
			}
			else
			{
				dialogLoader.contentCon["dialog"].openAndUpdate();
			}
			//set dialog to max depth
			_container.setChildIndex(dialogLoader, _container.numChildren - 1);
		}
		
		
		//test exteral interface
		public static function callFunction(wName:String,arr:Array/*fName:String,param1,param2...*/) : void
		{
			trace("callFunction" + arr[0]);
			/*for (var i:int = 0; i < widgetsArr.length; i++) 
			{
				if (widgetsArr[i].contentCon.TestCall != undefined)
				{ widgetsArr[i].contentCon.TestCall(); }
			}*/
			
			var ff:String = arr[0];
			var _widget:Object = getWidgetByName(wName);
			if (_widget != null) 
			{ _widget[ff](); }
		}
		
		
		/**
		 * when dialog pop up
		 */
		public static function inactiveWidgetView()
		{
			trace("open dialog and inactive view.");
			for (var i:int = 0; i < widgetsArr.length; i++) 
			{
				if (widgetsArr[i].contentCon.TestCall != undefined)
				{ widgetsArr[i].contentCon.TestCall(); }
				
				if (widgetsArr[i].name!="ESCPanel" && widgetsArr[i].contentCon.isActiveState == true)
				{ widgetsArr[i].contentCon.inactiveView(); }
			}
		}
		public static function activeWidgetView()
		{
			trace("close dialog and active view.");
			for (var i:int = 0; i < widgetsArr.length; i++) 
			{
				if (widgetsArr[i].name!="ESCPanel" && widgetsArr[i].contentCon.isActiveState == false)
				{ widgetsArr[i].contentCon.activeView(); }
			}
		}
		
		/**
		 * active widget
		 */
		public static function activeWidget(wName:String):void
		{
			var _widget:Object = getWidgetByName(wName);
			if (_widget != null) { _widget.activeView(); }
		}
		public static function inactiveWidget(wName:String):void
		{
			var _widget:Object = getWidgetByName(wName);
			if (_widget != null) { _widget.inactiveView(); }
		}
		
		
		public static function getWidgetByName(wName:String):Object
		{
			for each(var _obj:Object in widgetsArr)
			{
				if (_obj.name == wName)
				{ return _obj.contentCon; }
			}
			
			return null;
		}
		public static function getWidgetConByName(wName:String):Object
		{
			for each(var _obj:Object in widgetsArr)
			{
				if (_obj.name == wName)
				{ return _obj; }
			}
			
			return null;
		}
		
		
		/**
		 * update widget depth
		 */
		public function checkWidgetDepth(wName:String):void
		{
		}
	}

}