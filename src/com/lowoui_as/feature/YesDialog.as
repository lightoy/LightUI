package com.lowoui_as.feature 
{
	import com.lowoui_as.core.Dialog;
	
	public class YesDialog extends Dialog
	{
		
		public function YesDialog() 
		{
			super(0, 0, 0, 0, 1, 1);
		}
		override protected function initialize()
		{
			super.initialize();
			this["btnYes"].setName("OK");
			//this["btnYes"].setSize(100,24);
		}
		
		override public function openAndUpdate()
		{
			super.openAndUpdate();
			
			a2u_yesFun = dialogBtnYesFun;
		}
	}
}