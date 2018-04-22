package com.lowoui_as.sample.config 
{	
	public class Scene 
	{
		//scene
		//public static var s_Login:String            = "Login";
		//public static var s_Lobby:String            = "Lobby";
		public static var s_Demo:String               = "Demo";
		
		/**
		 * -----------------------
		 * 	stage widget level
		 * -----------------------
		 * 
		 * Dialog : 999
		 * pop-up : 3
		 * Widget : 1
		 * Bg     : 0
		 */
		
		//scene default widgets to load 
		public static var scene_Demo:Array            = [[ConfigWidget.w_Minimap,0],[ConfigWidget.w_Chapter, 1]];
	}
}