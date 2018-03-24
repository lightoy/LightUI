package com.lowoui_as.utils 
{
	import flash.filters.ColorMatrixFilter;
	
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class ColorFilter 
	{
		private static var _nRed : Number = 0.3086;
		private static var _nGreen : Number = 0.6094;
		private static var _nBlue : Number = 0.0820;
	
		public function ColorFilter() 
		{
			//ColorProperty
			//色相hue(取值范围为：-180~180)
			//setHue();
			//亮度Brightness(取值范围为：-255~255)
			//setBrightness();
			//灰度Grayscale
			//setGrayscale();
			//饱和度Saturation(饱和度级别一般范围为：0~3)
			//setSaturation();
			//对比度Contrast(取值范围为：0~1)
			//setContrast();
			//反相Invert
			//setInvert();
		}
		
		public static function setHue(hue:Number,obj:Object) : void
		{
			if (hue == 0 || isNaN(hue))
			{
				return;
			}
			hue = Math.min(180, Math.max(-180, hue)) / 180 * Math.PI;
			var cosVal:Number = Math.cos(hue);
			var sinVal:Number = Math.sin(hue);
			var lumR:Number = 0.213;
			var lumG:Number = 0.715;
			var lumB:Number = 0.072;
			var HueMatrix:Array = [lumR + cosVal * (1 - lumR) + sinVal * (-lumR), lumG + cosVal * (-lumG) + sinVal * (-lumG), lumB + cosVal * (-lumB) + sinVal * (1 - lumB), 0, 0, lumR + cosVal * (-lumR) + sinVal * (0.143), lumG + cosVal * (1 - lumG) + sinVal * (0.140), lumB + cosVal * (-lumB) + sinVal * (-0.283), 0, 0, lumR + cosVal * (-lumR) + sinVal * (-(1 - lumR)), lumG + cosVal * (-lumG) + sinVal * (lumG), lumB + cosVal * (1 - lumB) + sinVal * (lumB), 0, 0, 0, 0, 0, 1, 0];
			obj.filters = [new ColorMatrixFilter(HueMatrix)];
		}
		
		public static function setBrightness(offset:Number,obj:Object) : void
		{
			var Brightness_Matrix:Array = [1, 0, 0, 0, offset, 0, 1, 0, 0, offset, 0, 0, 1, 0, offset, 0, 0, 0, 1, 0];
			obj.filters = [new ColorMatrixFilter(Brightness_Matrix)];
		}
		public static function setGrayscale(yes:Boolean,obj:Object) : void
		{
			if (yes)
			{
				var Grayscale_Matrix:Array = [_nRed, _nGreen, _nBlue, 0, 0, _nRed, _nGreen, _nBlue, 0, 0, _nRed, _nGreen, _nBlue, 0, 0, 0, 0, 0, 1, 0];
				obj.filters = [new ColorMatrixFilter(Grayscale_Matrix)];
			}
			else
			{
				obj.filters = null;
			}
		}
		public static function setSaturation(nLevel:Number,obj:Object) : void
		{
			var srcRa:Number = (1 - nLevel) * _nRed + nLevel;
			var srcGa:Number = (1 - nLevel) * _nGreen;
			var srcBa:Number = (1 - nLevel) * _nBlue;
			var srcRb:Number = (1 - nLevel) * _nRed;
			var srcGb:Number = (1 - nLevel) * _nGreen + nLevel;
			var srcBb:Number = (1 - nLevel) * _nBlue;
			var srcRc:Number = (1 - nLevel) * _nRed;
			var srcGc:Number = (1 - nLevel) * _nGreen;
			var srcBc:Number = (1 - nLevel) * _nBlue + nLevel;
			var Saturation_Matrix:Array = [srcRa, srcGa, srcBa, 0, 0, srcRb, srcGb, srcBb, 0, 0, srcRc, srcGc, srcBc, 0, 0, 0, 0, 0, 1, 0];
			obj.filters = [new ColorMatrixFilter(Saturation_Matrix)];
		}
		public static function setContrast(nLevel:Number,obj:Object) : void
		{
			var Scale:Number = nLevel * 11;
			var Offset:Number = 63.5 - (nLevel * 698.5);
			var Contrast_Matrix:Array = [Scale, 0, 0, 0, Offset, 0, Scale, 0, 0, Offset, 0, 0, Scale, 0, Offset, 0, 0, 0, 1, 0];
			obj.filters = [new ColorMatrixFilter(Contrast_Matrix)];
		}
		public static function setInvert(yes:Boolean,obj:Object) : void
		{
			if (yes)
			{
				var Invert_Matrix:Array = [-1, 0, 0, 0, 255, 0, -1, 0, 0, 255, 0, 0, -1, 0, 255, 0, 0, 0, 1, 0];
				obj.filters = [new ColorMatrixFilter(Invert_Matrix)];
			}
		}
		
		//myColor = new Color(this);
		//myColorTransform = new Object;
		//myColorTransform.rb = red;
		//myColorTransform.gb = red;
		//myColorTransform.bb = red;
		//myColorTransform.aa = alpha;
		//myColor.setTransform(myColorTransform);
	}

}