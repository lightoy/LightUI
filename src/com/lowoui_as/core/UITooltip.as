package com.lowoui_as.core
{
	import com.greensock.easing.*;
	import com.greensock.TweenLite;
	import com.lowoui_as.Extension;
	import flash.display.MovieClip;
	import flash.geom.Point;

	public class UITooltip extends MovieClip
	{
		public function UIToolTip() {}

		public function openView(pos:Point,info:String) : void
		{
			trace("open a tooltip");
			if (!this.visible) { this.visible = true;}

			this.x = pos.x + this.width / 2 + 25;
			this.y = pos.y - 10;

			this["info"].text = info;

			this.rotationX = -179;
			this.alpha = 0;
			TweenLite.to(this, 0.3, { rotationX:0, alpha:1, ease:Sine.easeOut } );
		}
		public function closeView()
		{
			TweenLite.to(this, 0.2, { rotationX:179, alpha:0, ease:Sine.easeOut, onComplete:Extension.setInvisible, onCompleteParams:[this] } );
		}
	}
}
