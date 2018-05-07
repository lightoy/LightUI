package com.lowoui_as.sample.chapter
{
	import com.greensock.easing.*;
	import com.greensock.TweenLite;
	import com.lowoui_as.config.ConfigLang;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class ChapterSelectCon extends MovieClip
	{
		private var charptersArr:Vector.<DisplayObjectContainer>;
		private var charptersInfoArr:Vector.<String>;
		private var charptersLockArr:Vector.<Boolean>;
		private var currIdex:uint;

		//setting
		private const scale:Number = 330/400;

		private var _isDrag:Boolean;

		private var __charpterDetailCon:MovieClip;

		public function ChapterSelectCon()
		{
			charptersArr     = new Vector.<DisplayObjectContainer>();
			charptersInfoArr = new Vector.<String>();
			charptersLockArr = new Vector.<Boolean>();

			_isDrag = false;

			for (var i:int = 0; i < 6; i++)
				charptersArr.push(this["charpter_" + (i + 1)]);

			charptersInfoArr.push(  ConfigLang.Type.Charpters_Name1,
									ConfigLang.Type.Charpters_Name2,
									ConfigLang.Type.Charpters_Name3,
									ConfigLang.Type.Charpters_Name4,
									ConfigLang.Type.Charpters_Name5,
									ConfigLang.Type.Charpters_Name6
									);
			charptersLockArr.push(true, false, false, false, false, false);

			for each(var obj:Object in charptersArr)
			{
				var idx:uint = charptersArr.indexOf(obj);
				if (charptersLockArr[idx])
				{
					obj.gotoAndStop("enabled");
					obj["imgCon"].visible = true;
					obj["imgConGray"].visible = false;
					obj["imgCon"].gotoAndStop(idx + 1);
				}
				else
				{
					obj.gotoAndStop("disabled");
					obj["imgCon"].visible = false;
					obj["imgConGray"].visible = true;
					obj["imgConGray"].gotoAndStop(idx + 1);
				}

				obj.setName(charptersInfoArr[idx]);
				//ColorFilter.setGrayscale(true, obj["imgCon"]);
				obj.x = 200 + 400 * idx;
				obj.scaleX = scale;
				obj.scaleY = scale;
				obj.addEventListener(MouseEvent.MOUSE_OVER, onCharpterOver, false, 0, true);
				obj.addEventListener(MouseEvent.CLICK, onCharpterClick, false, 0, true);
			}
		}

		private function onCharpterOver(e:MouseEvent):void
		{
			//trace("charpter over...");
		}

		private function onCharpterClick(e:MouseEvent):void
		{
			if(!_isDrag) openCharpterDetail();
		}

		public function openCharpterDetail():void
		{
			if (__charpterDetailCon == null)
			{__charpterDetailCon = this["root"]["charpterDetailCon"]; }

			__charpterDetailCon.openView();
		}

		public function updatePos(moveX:Number):void
		{
			for each (var obj:Object in charptersArr)
			{
				obj.x += moveX;
			}
		}

		public function updateShow(idx:uint):void
		{
			currIdex = idx;

			for each (var obj:DisplayObjectContainer in charptersArr)
			{
				if (obj.scaleX == 1)
				{
					obj.scaleX = scale;
					obj.scaleY = scale;
					//ColorFilter.setGrayscale(true, obj["imgCon"]);
				}

				var _idx:uint = charptersArr.indexOf(obj);
				if (_idx == currIdex)
				{
					obj.scaleX = 1;
					obj.scaleY = 1;
					//ColorFilter.setGrayscale(false, charptersArr[_idx]["imgCon"]);
				}
				var tarX:int = 0 + (_idx - currIdex) * (200 + 180 + 12);
				TweenLite.to(obj, 0.3, { delay:0, x:tarX, ease:Sine.easeOut } );
			}
		}
	}
}
