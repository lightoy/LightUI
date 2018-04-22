package com.lowoui_as 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Main extends Sprite 
	{
		public function Main():void 
		{
			Global.manager = this;
			
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
			widgetController = new WidgetController();
			WidgetController.container = this;
			
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
	}
}