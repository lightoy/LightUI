package com.lowoui_as.feature
{
	import com.lowoui_as.core.UIDialog;

	public class DialogYesNo extends UIDialog
	{
		public function DialogYesNo()
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
