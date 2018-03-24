package com.lowoui_as.component 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class CandiateList extends Sprite
	{
		
		public function CandiateList() 
		{
			trace("Candiate List Component!");
		}
		
		/**
		 * external interfaces 
		 */
		public function updateList(dataArr:Array, selectIdx:uint) : void
		{
			trace("dataArr:"+dataArr.length+":"+"selectedIdx:"+selectIdx);
		}
	}

}