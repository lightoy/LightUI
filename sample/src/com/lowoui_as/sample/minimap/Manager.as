package com.lowoui_as.sample.minimap 
{
	import com.lowoui_as.core.UIMovie;
	
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class Manager extends UIMovie
	{
		private var __minimap:Object;
		
		public function Manager() 
		{
			super(0, 0, 0, 0, 0, 0);
		}
		override protected function initialize()
		{
			super.initialize();
			
			__minimap = this["minimapCon"];
		}
		
		/**public functions*/
		public function SetMinimapInfo(name:String)
		{
			__minimap.setMinimapInfo(name);
		}
		public function UpdatePlayerPosition(wX:Number,wY:Number)
		{
			__minimap.updatePlayerPosition(wX,wY);
		}
		public function UpdatePlayerRotation(angle:Number)
		{
			__minimap.updatePlayerRotation(angle);
		}
		public function SetMinimapFriends(minimapFriendsArr:Array)
		{
			__minimap.setMinimapFriends(minimapFriendsArr);
		}
		public function SetMinimapEnemies(minimapEnemiesArr:Array)
		{
			__minimap.setMinimapEnemies(minimapEnemiesArr);
		}
		
		
		/**inherit functions*/
		override protected function movieIn()
		{
			//super.movieIn();
			__minimap.openView();
		}
		override protected function movieOut()
		{
			//super.movieOut();
			__minimap.closeView();
		}
		
		override public function inactiveView()
		{
			super.inactiveView();
			__minimap.inactiveView();
		}
		override public function activeView()
		{
			super.activeView();
			__minimap.activeView();
		}
	}
}