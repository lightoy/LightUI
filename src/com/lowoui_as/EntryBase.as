package com.lowoui_as
{
	import com.lowoui_as.WidgetManager;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;

	public class EntryBase extends Sprite
	{
		protected var widgetController:WidgetManager;
		//protected var keyboardEvents:KeyController;

		//cunstom
		//protected var __cursor:Cursor_con;

		public function EntryBase()
		{
			Global.manager = this;

			/**Extensions of scaleform GFx*/
			//Extensions.enabled = true;
			//Extensions.noInvisibleAdvance = true;

			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			//TODO: import for updating as3 class library when some basic class had been updated
			//loadSceneWidget.LoadWidget(SceneWidget.w_Component,1);
			//loadSceneWidget.UnloadWidget(SceneWidget.w_Component);

			//set container for loading swf files
			widgetController = WidgetManager.ins;// new WidgetController();
			WidgetManager.container = this;

			//add keyboard event listener
			//keyboardEvents = new KeyController();
			//addChild(keyboardEvents);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, fKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, fKeyUp);

			// setup the custom cursor.
			//Mouse.hide();
			//__cursor = new Cursor_con();
			//stage.addChild(__cursor);// MOUSE_DEPTH.
			//Extension.setMcDisabled(__cursor);
			//InteractiveObjectEx.setHitTestDisable(__cursor, true);
			//stage.addEventListener(MouseEvent.MOUSE_MOVE, updateMouse, false, 0, true);
		}

		/*private function updateMouse(e:MouseEvent):void
		{
			if (__cursor != null) {
				__cursor.x = this.mouseX;
				__cursor.y = this.mouseY;

				//empty stub is added, no need to do anything in it.
				//e.updateAfterEvent();
			}
		}*/

		private function fKeyUp(e:KeyboardEvent):void
		{
			//if (Global.hudManager != null)
				//Global.hudManager.playerMoveStatus(false);

			Global.isAltKeyPressed = false;
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
			//if (Global.isTabPanelShow) {
				//loadSceneWidget.CloseWidget(SceneWidget.w_TABPanel);
			//}
			//else {
				//toggleGameOptionPanel();
			//}
		}
	}
}
