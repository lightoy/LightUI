package com.lowoui_as.sample 
{
	public class Global
	{
		public static var manager:Object;
		public static var hudManager:Object;
		public static var minimapManager:Object;
		public static var selectCharaterManager:Object;
		public static var lobbyManager:Object;
		public static var dialogManager:Object;
		
		public static var currMenuSelect:String;
		public static var currScene:String;
		public static var escObjArr:Array;
		
		public static var isTabPanelShow:Boolean;
		public static var isGameOptionShow:Boolean;
		public static var isAltKeyPressed:Boolean;
		
		public static var isKeyLock:Boolean;
		
		//settings
		public static var isGfxMode:Boolean = false;
		public static var isTestMode:Boolean = false;
		
		public function Global(){}
	}
}