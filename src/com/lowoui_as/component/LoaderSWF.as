package com.lowoui_as.component 
{
	import com.lowoui_as.events.MovieEvent;
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import com.lowoui_as.dialogs.YesDialog;
	import com.lowoui_as.dialogs.YesNoDialog;
	import com.lowoui_as.dialogs.NoticeDialog;
	
	public class LoaderSWF extends MovieClip
	{
		private var loader:Loader;
		
		public var contentCon:MovieClip;
		public var widgetWeight:int;
		
		public function LoaderSWF()
		{
		}
		public function loadSWF(_url:String) : void
		{
			if (loader == null)
			{
				loader = new Loader();
				this.addChild(loader);
			}
			else
			{
				loader.unloadAndStop();
			}
			
			contentCon = new MovieClip();
			
			loader.load(new URLRequest(_url));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete, false, 0, true );
		}
		
		private function loadComplete(e:Event) : void 
		{
			contentCon = loader.content as MovieClip;
		}
		public function unloadSWF()
		{
			loader.unloadAndStop();
		}
	}
}