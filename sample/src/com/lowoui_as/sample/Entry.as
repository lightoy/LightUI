package com.lowoui_as.sample
{
	import com.lowoui_as.Global;
	import com.lowoui_as.EntryBase;
	import com.lowoui_as.SceneManager;
	import com.lowoui_as.WidgetManager;
	import com.lowoui_as.config.ConfigScene;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class Entry extends EntryBase
	{
		private var __testBtns1:Object;
		private var __testBtns2:Object;

		public var isGameOptionShow:Boolean;

		public function Entry()
		{
			super();

			//initialize:load default scene
			//if (Global.isGfxMode) {
				//ExternalInterface.call("A2U_ManagerInitialized");
				//
				//if (Extensions.isGFxPlayer)
					//U2A_LoadScene(Scene.s_Login);
			//}
			//else {
				U2A_LoadScene(ConfigScene.s_Demo);
			//}

			if(Global.isTestMode)
				addTestButtons();

			//add listener for game options
			this.addEventListener("gameSettings", onGameSettings);
			this.addEventListener("prevScene", onPrevScene);
			this.addEventListener("quitGame", onQuitGame);
			this.addEventListener("closeGameoptions", onCloseGameOptions);
		}

		//keyboard control events
		private function openTabPanel(menu:String):void{}

		private function openChatPanel(){}

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


		/********************************************
		   UE call AS functions
		 ********************************************/
		//widget controller
		public function U2A_OpenWidget(wName:String)
		{
			widgetController.LoadWidget(wName, 1);
		}
		public function U2A_CloseWidget(wName:String)
		{
			WidgetManager.getWidgetByName(wName).closeView();
		}

		public function U2A_SceneMovieOut(sceneName:String)
		{
			widgetController.SceneMovieOut(sceneName);
		}
		public function U2A_LoadScene(sName:String):void
		{
			SceneManager.ins.LoadScene(sName);
		}
		public function U2A_OpenDialogYes(title:String, info:String, yesCallFun:String)
		{
			widgetController.OpenDialogYes(title, info, yesCallFun);
		}

		public function U2A_OpenDialogYesNo(title:String, info:String, yesCallFun:String, noCallFun:String)
		{
			widgetController.OpenDialogYesNo(title, info, yesCallFun, noCallFun);
		}

		public function U2A_OpenDialogNotice(title:String, info:String, time:Number)
		{
			widgetController.OpenDialogNotice(title, info, time);
		}

		public function U2A_CloseDialog(dialogName:String)
		{
			widgetController.CloseDialog(dialogName);
		}

		public function U2A_IsWidgetOpened(widgetName:String):int
		{
			var _widget:Object = WidgetManager.getWidgetByName(widgetName);
			if (_widget == null) return 0;
			else                 return 1;
		}

		/////////////////////////////////////////////////////
		//                     Minimap
		/////////////////////////////////////////////////////
		public function SetMinimapInfo(name:String)
		{
			WidgetManager.getWidgetByName("Minimap").SetMinimapInfo(name);
		}
		public function UpdatePlayerPosition(wX:Number,wY:Number)
		{
			WidgetManager.getWidgetByName("Minimap").UpdatePlayerPosition(wX, wY);
			if (Global.hudManager != null)
				Global.hudManager.UpdatePlayerPosition( wX, wY);
		}
		public function UpdatePlayerRotation(angle:Number)
		{
			WidgetManager.getWidgetByName("Minimap").UpdatePlayerRotation(angle);
			if (Global.hudManager != null)
				Global.hudManager.UpdatePlayerRotation( angle );
		}
		public function SetMinimapFriends(minimapFriendsArr:Array)
		{
			WidgetManager.getWidgetByName("Minimap").SetMinimapFriends(minimapFriendsArr);
		}
		public function SetMinimapEnemies(minimapEnemiesArr:Array)
		{
			WidgetManager.getWidgetByName("Minimap").SetMinimapEnemies(minimapEnemiesArr);
		}

		/////////////////////////////////////////////////////
		//                     Test
		/////////////////////////////////////////////////////
		private function addTestButtons():void
		{
			__testBtns1 = this["testBtns1"];
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
			}
		}

		private function onBtnMouseDown(evt:MouseEvent):void
		{
			switch (evt.currentTarget.name)
			{
				case "btnLoadComponent":
					widgetController.LoadWidget("Component", 1);
					break;
				case "btnUnLoadComponent":
					widgetController.UnloadWidget("Component");
					break;
				case "btnLoadSceneLogin":
					SceneManager.ins.LoadScene("Login");
					break;
				case "btnLoadSceneSelectCharacter":
					SceneManager.ins.LoadScene("SelectCharacter");
					break;
				case "btnLoadSceneLobby":
					SceneManager.ins.LoadScene("SafeHouse");
					break;
				case "btnLoadSceneHud":
					SceneManager.ins.LoadScene("Hud");
					break;
				case "btnLoadWidgetMinimap":
					widgetController.LoadWidget("Minimap", 1);
					break;
				case "btnUnloadWidgetMinimap":
					widgetController.UnloadWidget("Minimap");
					break;
				case "btnUnloadWidgetAll":
					widgetController.UnloadAllWidget();
					break;
				case "btnOpenDialogYes":
					//ExternalInterface.call("A2U_OpenDialogYes");
					//if (Extensions.isGFxPlayer)
					widgetController.OpenDialogYes("NOTICE", "Welcome to mercury world!", "yesCallFun");
					break;
				case "btnOpenDialogYesNo":
					//ExternalInterface.call("A2U_OpenDialogYesNo");
					//if (Extensions.isGFxPlayer)
					widgetController.OpenDialogYesNo("NOTICE", "Are you sure to quit now?", "yesCallFun", "noCallFun");
					break;
				case "btnCloseDialog":
					//ExternalInterface.call("A2U_CloseDialog");
					//if (Extensions.isGFxPlayer)
					widgetController.CloseDialog("YesNoDialog");
					break;
				default:
			}
		}
	}
}
