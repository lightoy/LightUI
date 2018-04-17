package com.lowoui_as.utils 
{
	import flash.display.FrameLabel;
	import flash.display.MovieClip;

	public class FrameByLable extends MovieClip
	{
		
		public function FrameByLable() 
		{
			
		}
		public static function labelFrame(mc:MovieClip,labelName:String):uint
		{
			var _frame:uint;
			var labels:Array = mc.currentLabels;
			for (var i:uint = 0; i < labels.length; i++)
			{
				var label:FrameLabel = labels[i];
				//trace("frame" + label.frame + ":" + label.name);
				if (label.name == labelName)
				{
					_frame = label.frame;
					break;
				}
			}
				
			return _frame;
		}
	}

}