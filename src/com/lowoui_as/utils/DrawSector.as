/*
 *Create by Geordi 14th Feb 2008
 *function DrawSector is drawing a sector in the flash by actionscript 3 
*/

package com.lowoui_as.utils
{
	import flash.display.MovieClip;
	import flash.display.Shape;

	public class DrawSector
	{
		public function DrawSector() 
		{
			//var stag:Sprite=new Sprite();
			//addChild(stag);
			//var moviec:MovieClip=new MovieClip;
			//stag.addChild(moviec);
			//var S_angle:int = 60;
			
			/* S_angle is expressed as a number between 0 and 360 degrees. it will draw a 60 
			* degree sector in this example, but you could change it to what ever you want 
			*/
			//DrawSector(moviec,200,200,100,S_angle,270,0xffcc00);
		}
		
		/*
		* mc the movieclip: the container of the sector.
		* x,y the center position of the sector
		* r the radius of the sector
		* angle the angle of the sector
		* startFrom the start degree counting point : 270 top, 180 left, 0 right, 90 bottom , 
		* it is counting from top in this example. 
		* color the fil lin color of the sector
		*/

		/*
		 * moviec是扇形所在影片剪辑的名字 should be shape
		 * 第2，3个参数是扇形原点的横纵坐标
		 * 第4个参数是扇形的半径
		 * 第5个参数S_angle是扇形的角度
		 * 第6个参数是扇形的起始角度
		 * 第7个参数0xffcc00是扇形的颜色
		 */
		public static function fDrawSector(mc:MovieClip, x:Number = 200, y:Number = 200, r:Number = 100, angle:Number = 27, startFrom:Number = 270, color:Number = 0xff0000):void 
		{
			mc.graphics.beginFill(color,50);
			//remove this line to unfill the sector
			/* the border of the secetor with color 0xff0000 (red) , you could replace it with any color 
			* you want like 0x00ff00(green) or 0x0000ff (blue).
			*/
			mc.graphics.lineStyle(0,0xff0000);
			mc.graphics.moveTo(x,y);
			angle=(Math.abs(angle)>360)?360:angle;
			var n:Number=Math.ceil(Math.abs(angle)/45);
			var angleA:Number=angle/n;
			angleA=angleA*Math.PI/180;
			startFrom=startFrom*Math.PI/180;
			mc.graphics.lineTo(x+r*Math.cos(startFrom),y+r*Math.sin(startFrom));
			for (var i = 1; i <= n; i++) 
			{
				startFrom+=angleA;
				var angleMid=startFrom-angleA/2;
				var bx=x+r/Math.cos(angleA/2)*Math.cos(angleMid);
				var by=y+r/Math.cos(angleA/2)*Math.sin(angleMid);
				var cx=x+r*Math.cos(startFrom);
				var cy=y+r*Math.sin(startFrom);
				mc.graphics.curveTo(bx,by,cx,cy);
			}
			if (angle != 360) 
			{
				mc.graphics.lineTo(x,y);
			}
			mc.graphics.endFill();// if you want a sector without filling color , please remove this line.
		}
	}
}