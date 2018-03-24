package com.lowoui_as.component 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class RatioBar extends MovieClip
	{		
		//
		public function RatioBar()
		{		
			this["bar"]._x = -(this["bg"]._width - 4) / 2;
		}
		
		public function updateRatioBarValue(effectiveValue:uint,maxValue:uint)
		{
			this["bar"]._width = Math.floor((this["bg"]._width - 6) * effectiveValue / maxValue);
		}
	}
}
