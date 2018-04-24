package com.lowoui_as.feature
{
	import com.lowoui_as.core.UIMovie;
	import com.lowoui_as.animation.Particles;

	public class Bg extends UIMovie
	{

		public function Bg()
		{
			super(0, 0, 0, 0, 0, 0);
		}
		override protected function initialize()
		{
			super.initialize();

			//
		}
		override public function resetPos(posInfo:Object) : void
		{
			this.width = stageWidth;
			this.height = stageHeight;
			this.x = stageWidth / 2;
			this.y = stageHeight / 2;
		}
	}
}
