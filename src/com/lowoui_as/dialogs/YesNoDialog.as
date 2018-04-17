package com.lowoui_as.dialogs 
{
	import com.lowoui_as.dialogs.Dialog;

	public class YesNoDialog extends Dialog
	{
		public function YesNoDialog() 
		{
			super(0, 0, 0, 0, 1, 1);
		}
		override protected function initialize()
		{
			super.initialize();
			//this["btnYes"]["tt"].text = "Confirm";
			//this["btnNo"]["tt"].text = "Cancel";
		}
		/*private function onBtn(e:MouseEvent):void 
		{
			switch (e.target.name) 
			{
				case "btnYes":
					callUS(a2u_yesFun);
					break;
				case "btnNo":
					trace("a2u_noFun:"+a2u_noFun);
					callUS(a2u_noFun);
					break;
				default:
			}
			
			closeDialog();
		}*/
		
		override public function openAndUpdate()
		{
			super.openAndUpdate();
			
			a2u_yesFun = dialogBtnYesFun;
			a2u_noFun = dialogBtnNoFun;
		}
	}

}