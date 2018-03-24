package com.lowoui_as.component 
{
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.net.URLRequest;
	//import flash.events.Event;
	//import com.business.constants.Hud;
	
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class LoaderIMG extends Sprite
	{
		private var loader:Loader;
		private var imgWidth:Number;
		private var imgHeight:Number;
		
		public function LoaderIMG(imgClass:String) 
		{
			imgWidth = Hud["img_"+imgClass].imgWidth;
			imgHeight = Hud["img_"+imgClass].imgHeight;
		}
		
		private function initLoader()
		{
			loader = new Loader();			
			loader.x = -imgWidth/2;
			loader.y = -imgHeight/2;
			this.addChild(loader);
		}
		protected function load(url:String):void 
		{
			if (url == null||url == "") 
			{
				visible = false;
				return; 
			}
			else
			{
				if (loader == null) { initLoader(); }
				
				loader.unload();
				
				visible = true;
				loader.load( new URLRequest(url) );
				//loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete, false, 0, true );
			}           
		}
		/*private function loadComplete(evt:Event) : void
		{
			var obj:Object = evt.target.content;
			obj.x = -obj.width/2;
			obj.y = -obj.height/2;
		}*/
	}

}