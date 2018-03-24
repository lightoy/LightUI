package com.lowoui_as.dialogs 
{
	import com.lowoui_as.dialogs.Dialog;
	import com.greensock.TweenLite;
	import fl.motion.easing.*;
	
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class NoticeDialog extends Dialog
	{
		
		public function NoticeDialog() 
		{
			super(0, 0, 0, 0, 1, 1);
		}
		
		/**
		 * params : dialogDurationTime
		 * -1 : no end notice
		 * >0 : n seconds later, call for closing this.
		 */
		override public function openAndUpdate()
		{
			super.openAndUpdate();
			
			if (dialogDurationTime > 0)
			{
				TweenLite.to(this, dialogDurationTime, { ease:Sine.easeOut, onComplete:closeDialog } );
			}
		}
	}

}