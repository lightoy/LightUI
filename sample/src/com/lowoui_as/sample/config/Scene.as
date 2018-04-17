package com.lowoui_as.sample.config 
{	
	public class Scene 
	{
		//scene
		//public static var s_Login:String              = "Login";
		//public static var s_Hud:String                = "Hud";
		public static var s_Demo:String               = "Demo";
		
		/**
		 * -----------------------
		 * 	stage widget weight
		 * -----------------------
		 * 
		 * Dialog : 999
		 * pop-up : 3
		 * Widget : 1
		 * Bg     : 0
		 */
		
		//scene default widgets to load 
		//public static var scene_SafeHouse:Array       = [[Widget.w_Hud, 1],[Widget.w_Minimap,1]];
		//public static var scene_Hud:Array             = [[Widget.w_Hud, 1],[Widget.w_Minimap,1]];
		public static var scene_Demo:Array            = [[Widget.w_Minimap,0],[Widget.w_Chapter, 1]];
	}
}