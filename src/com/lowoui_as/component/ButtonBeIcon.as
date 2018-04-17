package com.lowoui_as.component 
{
	import com.lowoui_as.Extension;
	import com.lowoui_as.events.ButtonEvent;

	public class ButtonBeIcon extends Button
	{
		private var __icon:Object;
		
		public function ButtonBeIcon() 
		{
			__icon = this["icon"];
			Extension.setMcDisabled(__icon);
			
			this.addEventListener(ButtonEvent.OVER, onOver);
			this.addEventListener(ButtonEvent.OUT, onOut);
			//this.addEventListener(ButtonEvent.RELEASE_OUTSIDE, onOut);
			//this.addEventListener(ButtonEvent.CLICK, onOver);
			//this.addEventListener(ButtonEvent.SELECT, onSelect);
		}
		
		private function onOut(e:ButtonEvent):void 
		{
			__icon.gotoAndPlay("movie_out");
		}
		private function onOver(e:ButtonEvent):void 
		{
			__icon.gotoAndPlay("movie_in");
		}
		// private function onSelect(e:ButtonEvent):void 
		// {
		// 	if(this.selected){__icon.gotoAndPlay("movie_in");}
		// 	else             {__icon.gotoAndPlay("movie_out");}
		// }
	}
}