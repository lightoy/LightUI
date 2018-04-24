package com.lowoui_as
{
	import com.lowoui_as.WidgetManager;
	import com.lowoui_as.config.ConfigScene;
	import flash.display.Sprite;

	public class SceneManager extends Sprite
	{
		private static var _ins:SceneManager = null;
		public static function get ins():SceneManager {
			if (_ins == null)
				_ins = new SceneManager();

			return _ins;
		}

		public var curScene:String;

		public function SceneManager(){}

		public function LoadScene(sName:String) : void
		{
			if (Global.hudManager != null)
				Global.hudManager.UpdateChatMsg("scene name:" + sName);

			WidgetManager.ins.UnloadAllWidget();
			WidgetManager.ins.loadWidgets(ConfigScene["scene_" + sName]);

			curScene = sName;
		}
	}
}
