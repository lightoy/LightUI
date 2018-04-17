package com.lowoui_as.utils 
{
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BlurFilter;
	
	public class Filters 
	{
		
		public function Filters() 
		{
			// there are nine filters for movie containter inactive state
			
			//1 斜角滤镜 (BevelFilter)
			//2 模糊滤镜 (BlurFilter)
			//3 投影滤镜 (DropShadowFilter)
			//4 发光滤镜 (GlowFilter)
			//5 渐变斜角滤镜 (GradienBevelFilter)
			//6 渐变发光滤镜 (GradienBevelFilter)
			//7 颜色矩阵滤镜 (ColorMatrixFilter)
			//8 卷积滤镜 (ConvolutionFilter)
			//9 置换图滤镜 (DisplacementMapFilter)
		}
		
		public static function setBeveFilter(mc:Object, bValue:Number) : void
		{
		}
		public static function setBlurFilter(mc:Object, bValue:Number) : void
		{
			//
			var blur:BlurFilter = new BlurFilter();
			blur.blurX = bValue;
			blur.blurY = bValue;
			blur.quality = BitmapFilterQuality.MEDIUM;
			
			if (bValue != 0){ mc.filters = [blur]; }
			else            { mc.filters = [blur]; mc.filters = null; }
		}
	}
}