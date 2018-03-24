package com.lowoui_as.utils 
{
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class Transform3D 
	{
		
		public function Transform3D() 
		{
			
			if (_global.gfxPlayer != undefined) 
			{ 
				inventory.bg.gotoAndPlay("open");
			}

			_global.gfxExtensions = true;
			import gfx.motion.Tween;

			Tween.init();

			var zScale:Number = 3;

			var brot:Boolean = false;
			var ox:Number = 0;
			var oy:Number = 0;
			var orx:Number = 0;
			var ory:Number = 0;

			this.onMouseMove  = function()  {
				if (brot) {
					calcRotations();
				}	
			}

			var mouseListener:Object = new Object;
			mouseListener.onMouseDown = function(button : Number) {
				if (button == 2) {
					brot = true;
					ox = _root._xmouse;
					oy = _root._ymouse;
					orx = inventory._yrotation;
					ory = -inventory._xrotation;	
				}
			}
			mouseListener.onMouseUp = function(button : Number) {
				if (button == 2) {
					brot = false;
				}
			}
			Mouse.addListener(mouseListener);


			//
			////////////////////////////////////////////////////////////////////////////
			// 3D Transformation code
			////////////////////////////////////////////////////////////////////////////
			//

			function calcRotations():Void {
				rotX = orx + ((_root._xmouse - ox) / 1024) * 90;
				rotY = ory + ((_root._ymouse - oy) / 1024) * 90;

				inventory._yrotation = rotX;
				inventory._xrotation = -rotY;
			}
			
		}
		
	}

}