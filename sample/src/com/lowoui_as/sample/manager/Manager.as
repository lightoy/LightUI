package com.lowoui_as.sample.manager 
{
	import com.lowoui_as.controller.WidgetController;
	import com.lowoui_as.sample.config.Scene;
	import com.lowoui_as.sample.Global;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class Manager extends Sprite
	{
		private var loadSceneWidget:WidgetController;
		//private var keyboardEvents:KeyController;
		
		public var isGameOptionShow:Boolean;
		
		//private var __cursor:Cursor_con;
		private var __testBtns1:Object;
		private var __testBtns2:Object;
		
		public function Manager()
		{
			/**
			 * Extensions of scaleform GFx
			 */
			//Extensions.enabled = true;
			//Extensions.noInvisibleAdvance = true;
			
			Global.manager = this;
			
			//set container for loading swf files
			loadSceneWidget = new WidgetController();
			WidgetController._container = this;
			
			//add listener for game options
			this.addEventListener("gameSettings", onGameSettings);
			this.addEventListener("prevScene", onPrevScene);
			this.addEventListener("quitGame", onQuitGame);
			this.addEventListener("closeGameoptions", onCloseGameOptions);
			
			//add keyboard event listener
			//keyboardEvents = new KeyController();
			//addChild(keyboardEvents);
			//this.addEventListener("onKeyDown", fOnKeyDown);
			//this.addEventListener("onKeyUp", fOnKeyUp);
			
			if (stage) initStageEvents();
			else       addEventListener(Event.ADDED_TO_STAGE, initStageEvents);
			
			/**
			 * todo:
			 * import for updating as3 class library when some basic class had been updated
			 */
			//loadSceneWidget.LoadWidget(SceneWidget.w_Component,1);
			//loadSceneWidget.UnloadWidget(SceneWidget.w_Component);
			
			// setup the custom cursor.
			//Mouse.hide();
			//__cursor = new Cursor_con();
			//stage.addChild(__cursor);// MOUSE_DEPTH.
			//Extension.setMcDisabled(__cursor);
			//InteractiveObjectEx.setHitTestDisable(__cursor, true);
			//stage.addEventListener(MouseEvent.MOUSE_MOVE, updateMouse, false, 0, true);
			
			
			//initialize:load default scene
			/*if (Global.isGfxMode) {
				ExternalInterface.call("A2U_ManagerInitialized");
				if (Extensions.isGFxPlayer)	
					U2A_LoadScene(Scene.s_Login);
			}
			else*/ 
				U2A_LoadScene(Scene.s_Demo);
				
			if(Global.isTestMode)
				addTestButtons();
		}
		
		private function initStageEvents(e:Event = null):void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, fKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, fKeyUp);
		}
		
		private function updateMouse(e:MouseEvent):void
		{
			/*if (__cursor != null) {
				__cursor.x = this.mouseX;
				__cursor.y = this.mouseY;
				
				//empty stub is added, no need to do anything in it.
				//e.updateAfterEvent();
			}*/
		}
		
		private function addTestButtons():void
		{
			/*__testBtns1 = this["testBtns1"];
			__testBtns1.visible = false;
			__testBtns2 = this["testBtns2"];
			__testBtns2.y = 40;
			__testBtns2.visible = false;
			
			__testBtns1["btnLoadComponent"]["tt"].text = "LoadComponent";
			__testBtns1["btnUnLoadComponent"]["tt"].text = "UnLoadComponent";
			__testBtns1["btnLoadSceneLogin"]["tt"].text = "SceneLogin";
			__testBtns1["btnLoadSceneSelectCharacter"]["tt"].text = "SceneSelectCharacter";
			__testBtns1["btnLoadSceneLobby"]["tt"].text = "SceneSafeHouse";
			__testBtns1["btnLoadSceneHud"]["tt"].text = "SceneHud";
			__testBtns1["btnLoadWidgetMinimap"]["tt"].text = "LoadWidgetMinimap";
			__testBtns1["btnUnloadWidgetMinimap"]["tt"].text = "UnloadWidgetMinimap";
			__testBtns1["btnUnloadWidgetAll"]["tt"].text = "UnloadWidgetAll";
			__testBtns1["btnOpenDialogYes"]["tt"].text = "OpenDialogYes";
			__testBtns1["btnOpenDialogYesNo"]["tt"].text = "OpenDialogYesNo";
			__testBtns1["btnCloseDialog"]["tt"].text = "CloseDialog";
			var ___testBtns1Arr:Array = [];
			for (var i:uint = 0; i < __testBtns1.numChildren; i++) 
			{
				__testBtns1.getChildAt(i).addEventListener(MouseEvent.MOUSE_DOWN, onBtnMouseDown);
				___testBtns1Arr.push(__testBtns1.getChildAt(i));
			}*/
		}
		
		private function onBtnMouseDown(evt:MouseEvent):void
		{
			switch (evt.currentTarget.name)
			{
				case "btnLoadComponent": 
					loadSceneWidget.LoadWidget("Component", 1);
					break;
				case "btnUnLoadComponent": 
					loadSceneWidget.UnloadWidget("Component");
					break;
				case "btnLoadSceneLogin": 
					loadSceneWidget.LoadScene("Login");
					break;
				case "btnLoadSceneSelectCharacter": 
					loadSceneWidget.LoadScene("SelectCharacter");
					break;
				case "btnLoadSceneLobby": 
					loadSceneWidget.LoadScene("SafeHouse");
					break;
				case "btnLoadSceneHud": 
					loadSceneWidget.LoadScene("Hud");
					break;
				case "btnLoadWidgetMinimap": 
					loadSceneWidget.LoadWidget("Minimap", 1);
					break;
				case "btnUnloadWidgetMinimap": 
					loadSceneWidget.UnloadWidget("Minimap");
					break;
				case "btnUnloadWidgetAll": 
					loadSceneWidget.UnloadAllWidget();
					break;
				case "btnOpenDialogYes": 
					//ExternalInterface.call("A2U_OpenDialogYes");
					//if (Extensions.isGFxPlayer)
					loadSceneWidget.OpenDialogYes("NOTICE", "Welcome to mercury world!", "yesCallFun");
					break;
				case "btnOpenDialogYesNo": 
					//ExternalInterface.call("A2U_OpenDialogYesNo");
					//if (Extensions.isGFxPlayer)
					loadSceneWidget.OpenDialogYesNo("NOTICE", "Are you sure to quit now?", "yesCallFun", "noCallFun");
					break;
				case "btnCloseDialog": 
					//ExternalInterface.call("A2U_CloseDialog");
					//if (Extensions.isGFxPlayer)
					loadSceneWidget.CloseDialog("YesNoDialog");
					break;
				default: 
			}
		}
		
		private function fKeyDown(e:KeyboardEvent):void
		{
			/*switch (e.keyCode)
			{
				case Keyboard.ESCAPE:
					onPressESC();
					break;
				case Keyboard.ENTER:
					OpenChatPanel();
					break;
				case Keyboard.ALTERNATE:
					if (Global.hudManager != null&&!Global.isAltKeyPressed) Global.hudManager.showAltItemsCon();
					Global.isAltKeyPressed = true;
					break;
				case Keyboard.TAB:
					if (Global.currMenuSelect == null)
					{ Global.currMenuSelect = SceneWidget.w_LevelMap; }
					openTabPanel(Global.currMenuSelect);
					break;
				case Keyboard.B:
					openTabPanel(SceneWidget.w_Bag);
					break;
				case Keyboard.N://Conflict with screen drag event when refer to C.
					openTabPanel(SceneWidget.w_Character);
					break;
				case Keyboard.M:
					openTabPanel(SceneWidget.w_LevelMap);
					break;
				case Keyboard.J:
					openTabPanel(SceneWidget.w_MissionOwned);
					break;
				case Keyboard.K:
					openTabPanel(SceneWidget.w_Skills);
					break;
				case Keyboard.W: 
				case Keyboard.A: 
				case Keyboard.S: 
				case Keyboard.D: 
					if (Global.hudManager != null) Global.hudManager.playerMoveStatus(true);
					break;
				case Keyboard.Q: 
					break;
				case Keyboard.NUMBER_1: 
					break;
				case Keyboard.NUMBER_2: 
					break;
				case Keyboard.NUMBER_3: 
					break;
				case Keyboard.NUMBER_4: 
					break;
				case Keyboard.F5: 
					break;
				case Keyboard.F6: 
					break;
				default: 
			}*/
		}
		
		private function onPressESC():void 
		{
			if (Global.isTabPanelShow) {
				//loadSceneWidget.CloseWidget(SceneWidget.w_TABPanel);
			}
			else {
				//toggleGameOptionPanel();
			}
		}
		private function fKeyUp(e:KeyboardEvent):void
		{
			if (Global.hudManager != null)
				Global.hudManager.playerMoveStatus(false);
			
			Global.isAltKeyPressed = false;
		}
		
		
		//keyboard control events
		private function openTabPanel(menu:String):void{}
		private function openChatPanel(){}
		
		
		//Settings
		private function onGameSettings(e:Event):void
		{
			//loadSceneWidget.LoadWidget(SceneWidget.w_Settings, 3);
			//isGameOptionShow = false;
		}
		private function onPrevScene(e:Event):void
		{
			//ExternalInterface.call("A2U_ToggleUIMode", false);
			isGameOptionShow = false;
			
			/*if (Global.currScene == Scene.s_Hud)
			{
				loadSceneWidget.LoadScene(Scene.s_SafeHouse);
			}
			else if (Global.currScene == Scene.s_SafeHouse)
			{
				loadSceneWidget.LoadScene(Scene.s_SelectCharacter);
			}
			else
			   {
			   //{loadSceneWidget.CloseWidget(Global.currScene);}
			   //all widgets should be closeed which visible value is true
			   loadSceneWidget.CloseCurrSceneWidgets();
			 }*/
			
			//going out of "hud" scene when HudMenu is visible
			Global.isTabPanelShow = false;
		}
		private function onQuitGame(e:Event):void
		{
			//ExternalInterface.call("A2U_ToggleUIMode", false);
			isGameOptionShow = false;
			
			//ExternalInterface.call("A2U_QuitGame");
		}
		private function onCloseGameOptions(e:Event):void
		{
			//ExternalInterface.call("A2U_ToggleUIMode", false);
			isGameOptionShow = false;
		}
		
		
		
		/**public functions*/
		public function setToTheHighestDepth(objName:String):void
		{
			var _con:Object = WidgetController._container;
			var obj:MovieClip = WidgetController.getWidgetConByName(objName) as MovieClip;
			//var obj2:MovieClip = _con.getChildAt(_con.numChildren - 1);
			
			if (obj != null) _con.setChildIndex(obj, _con.numChildren - 1);
		}
		
		
		/********************************************
		   U call AS functions
		 ********************************************/
		//widget controller
		public function U2A_OpenWidget(wName:String)
		{
			loadSceneWidget.LoadWidget(wName, 1);
		}
		public function U2A_CloseWidget(wName:String)
		{
			WidgetController.getWidgetByName(wName).closeView();
		}
		
		public function U2A_SceneMovieOut(sceneName:String)
		{
			loadSceneWidget.SceneMovieOut(sceneName);
		}
		public function U2A_LoadScene(sName:String):void
		{
			loadSceneWidget.LoadScene(sName);
		}
		public function U2A_OpenDialogYes(title:String, info:String, yesCallFun:String)
		{
			loadSceneWidget.OpenDialogYes(title, info, yesCallFun);
		}
		
		public function U2A_OpenDialogYesNo(title:String, info:String, yesCallFun:String, noCallFun:String)
		{
			loadSceneWidget.OpenDialogYesNo(title, info, yesCallFun, noCallFun);
		}
		
		public function U2A_OpenDialogNotice(title:String, info:String, time:Number)
		{
			loadSceneWidget.OpenDialogNotice(title, info, time);
		}
		
		public function U2A_CloseDialog(dialogName:String)
		{
			loadSceneWidget.CloseDialog(dialogName);
		}
		
		//initialize widget data
		//public function U2A_UpdateRoleCandidateList(arr:Array, selectedIdx:uint):void
		//{
			//var _widgetMovie:MovieClip = WidgetController.getWidgetByName(Scene.w_SelectCharacter) as MovieClip;
			//_widgetMovie.U2A_UpdateRoleCandidateList(arr, selectedIdx);
		//}
		
		/////////////////////////////////////////////////////
		//                     Minimap
		/////////////////////////////////////////////////////
		//minimap
		public function SetMinimapInfo(name:String)
		{
			WidgetController.getWidgetByName("Minimap").SetMinimapInfo(name);
		}
		public function UpdatePlayerPosition(wX:Number,wY:Number)
		{
			WidgetController.getWidgetByName("Minimap").UpdatePlayerPosition(wX, wY);
			if (Global.hudManager != null)
				Global.hudManager.UpdatePlayerPosition( wX, wY);
		}
		public function UpdatePlayerRotation(angle:Number)
		{
			WidgetController.getWidgetByName("Minimap").UpdatePlayerRotation(angle);
			if (Global.hudManager != null)
				Global.hudManager.UpdatePlayerRotation( angle );
		}
		public function SetMinimapFriends(minimapFriendsArr:Array)
		{
			WidgetController.getWidgetByName("Minimap").SetMinimapFriends(minimapFriendsArr);
		}
		public function SetMinimapEnemies(minimapEnemiesArr:Array)
		{
			WidgetController.getWidgetByName("Minimap").SetMinimapEnemies(minimapEnemiesArr);
		}
		
		/////////////////////////////////////////////////////
		//                       Hud
		/////////////////////////////////////////////////////
		
		public function U2A_IsWidgetOpened(widgetName:String):int
		{
			var _widget:Object = WidgetController.getWidgetByName(widgetName);
			if (_widget == null) return 0;
			else                 return 1;
		}
		
		/////////////////////////////////////////////////////
		//                       Hud
		/////////////////////////////////////////////////////
		//character info
		
		//chat panel
		public function OpenChatPanel()
		{
			if(Global.hudManager!=null)
				Global.hudManager.OpenChatPanel();
		}
		public function U2A_UpdateChatMsg(msg:String):void
		{
			if(Global.hudManager!=null)
				Global.hudManager.UpdateChatMsg(msg);
		}
	}
}