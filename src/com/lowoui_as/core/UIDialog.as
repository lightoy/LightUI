package com.lowoui_as.core
{
	import com.greensock.TweenLite;
	import com.greensock.easing.*;
	import com.lowoui_as.Extension;
	import com.lowoui_as.SceneManager;
	import com.lowoui_as.WidgetManager;
	import com.lowoui_as.core.UIMovie;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	//import scaleform.gfx.Extensions;

	public class UIDialog  extends UIMovie
	{
		public static var dialogTitle:String        = "Dialog";
		public static var dialogInfo:String         = "";
		public static var dialogBtnYesFun:String    = "";
		public static var dialogBtnNoFun:String     = "";
		public static var dialogDurationTime:Number = 0;

		protected var a2u_yesFun:String = "";
		protected var a2u_noFun:String  = "";

		public var darkBgCon:MovieClip;
		public var dialogCon:MovieClip;

		public function UIDialog(top:int,right:int,bottom:int,left:int,centeru:int,centerv:int)
		{
			super(top, right, bottom, left, centeru, centerv);
		}

		override protected function initialize()
		{
			super.initialize();

			//setting ----------------
			//beDrag = true;
			//------------------------

			dialogCon = this;
			darkBgCon = this.parent["darkBg"];
			dialogCon.visible = false;
			darkBgCon.visible = false;

			dialogCon["title"].selectable = false;
			dialogCon["info"].selectable  = false;

			if (dialogCon["btnYes"] != null)
			{
				dialogCon["btnYes"].setName("YES");
				dialogCon["btnYes"].addEventListener(MouseEvent.CLICK, onBtn);
			}
			if (dialogCon["btnNo"] != null)
			{
				dialogCon["btnNo"].setName("NO");
				dialogCon["btnNo"].addEventListener(MouseEvent.CLICK, onBtn);
			}

			openAndUpdate();
		}

		private function onBtn(e:MouseEvent) : void
		{
			switch (e.currentTarget.name)
			{
				case "btnYes":
					callUS(a2u_yesFun);

					//Test
					//if(Extensions.isGFxPlayer)
					//SceneManager.ins.LoadScene("SelectCharacter");
					break;
				case "btnNo":
					callUS(a2u_noFun);
					break;
				default:
			}

			closeDialog();
		}

		protected function callUS(type:String) : void
		{
			ExternalInterface.call(type);
		}

		private function openDialog()
		{
			dialogCon.visible = true;
			darkBgCon.visible = true;

			//movie_in
			dialogCon.rotationY = 60;
			dialogCon.z         = -500;
			dialogCon.scaleX    = 0.1;
			dialogCon.alpha     = 0;
			darkBgCon.alpha     = 0;
			TweenLite.to(dialogCon, 0.6, { rotationY:0, alpha:1, scaleX:1, z:0, ease:Strong.easeOut } );
			TweenLite.to(darkBgCon, 0.3, { alpha:1, ease:Strong.easeOut } );

			dialogCon["bg"].gotoAndPlay("movie_in");

			//when this be laoded, play stage movie
			WidgetManager.inactiveWidgetView();
		}

		public function openAndUpdate()
		{
			openDialog();

			dialogCon["title"].text = dialogTitle;
			dialogCon["info"].text  = dialogInfo;
		}
		public function closeDialog()
		{
			TweenLite.to(dialogCon, 0.4, { alpha:0, z:-500, ease:Strong.easeOut, onComplete:Extension.setInvisible, onCompleteParams:[dialogCon] } );
			TweenLite.to(darkBgCon, 0.2, { alpha:0, ease:Strong.easeOut, onComplete:Extension.setInvisible, onCompleteParams:[darkBgCon] } );

			//play stage movie
			WidgetManager.activeWidgetView();
		}

		override public function resetPos(posInfo:Object) : void
		{
			super.resetPos(posInfo);

			darkBgCon.width   = stageWidth;
			darkBgCon.height  = stageHeight;
			darkBgCon.x       = stageWidth / 2;
			darkBgCon.y       = stageHeight / 2;

			this["bg"].height = stageHeight;
			this["bg"].x      = this["bg"].y = 0;
		}
	}
}
