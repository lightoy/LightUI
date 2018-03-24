package com.lowoui_as.component 
{
	import com.lowoui_as.events.ButtonGroupEvent;
	import com.lowoui_as.events.DropMenuEvent;
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	
	//import scaleform.gfx.Extensions;
	
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class Manager extends MovieClip
	{
		private	var _Button:Object;;
		private	var _ButtonBar:Object;
		private	var _ButtonGroup:Array;
		private	var _CheckBox:Object;
		private	var _DropdownMenu:Object;
		private	var _ListCon:Object;
		private	var _LoaderIMG:Object;
		private	var _LoaderSWF:Object;
		private	var _RatioBar:Object;
		private	var _ScrollBar:Object;
		private	var _Slider:Object;
		private	var _TextArea:Object;
		private	var _TextInput:Object;
		
		public function Manager() 
		{
			initialize();
			
			//if (Extensions.isGFxPlayer) {}
			if (stage) { addedToStage(null); }
			else       { addEventListener(Event.ADDED_TO_STAGE, addedToStage, false, 0, true); }
		}
		
		protected function addedToStage(evt:Event = null) : void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage, false);
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align     = StageAlign.TOP_LEFT;
			
			stage.addEventListener(Event.RESIZE, resizeStage);
			resizeStage();
		}
		public function initialize()
		{
			_Button       = this["btn0"];
			_ButtonGroup  = [ [this["btn1"],"Menu1"], [this["btn2"],"Menu2"], [this["btn3"],"Menu3"], [this["btn4"],"Menu4"] ];
			_CheckBox     = this["checkBoxCon"];
			_DropdownMenu = this["dropDownMenuCon"];
			_ScrollBar    = this["scrollBar"];
			_Slider       = this["sliderCon"];
			_TextArea     = this["textAreaCon"];
			_TextInput    = this["textInput"];
			
			
			/*if (Extensions.isGFxPlayer) 
			{
				trace("Component manager initialized......");
				this["cNameCon"].visible = true;
				this["bg"].visible       = true;
				
				_Button.visible       = true;
				for each (var _obj1:Object in _ButtonGroup) 
				{ _obj1[0].visible    = true; }
				_CheckBox.visible     = true;
				_DropdownMenu.visible = true;
				_ScrollBar.visible    = true;
				_Slider.visible       = true;
				_TextArea.visible     = true;
				_TextInput.visible    = true;
			}
			else
			{
				this["cNameCon"].visible = false;
				this["bg"].visible       = false;
				
				_Button.visible       = false;
				for each (var _obj2:Object in _ButtonGroup) 
				{ _obj2[0].visible    = false; }
				_CheckBox.visible     = false;
				_DropdownMenu.visible = false;
				_ScrollBar.visible    = false;
				_Slider.visible       = false;
				_TextArea.visible     = false;
				_TextInput.visible    = false;
			}*/
			
			_Button.setName("test btn");
			_Button.selected = true;
			//_Button.setIsSelected(true);
			//_TextInput._focus = true;
			_TextInput.setFocus(true);
			_Slider.value = 0.5;
			_CheckBox.setName("video");
			_CheckBox.setSelectedState(true);
			_CheckBox.setFocus(true);
			_TextArea.tWidth = 250;
			_TextArea.tHeight = 120;
			_TextArea.focus = false;
			_TextArea.text = "We wanted to share our current schedule for QA builds for the rest of 2013 so you have an idea of when things might be coming your way and can plan accordingly. The dates listed are when we plan to branch and begin testing, not when the build will be released. Testing can take multiple weeks in the some cases, so please keep that in mind.";
			
			_DropdownMenu.data = ["select01", "select02", "select03", "select04"];
			_DropdownMenu.value = "select02";
			_DropdownMenu.addEventListener(DropMenuEvent.SELECT,fOnDropdownMenuSelect);
			
			var _btnGroup:ButtonGroup = new ButtonGroup();
			_btnGroup.addButton(_ButtonGroup);
			_btnGroup.value = "Menu2";
			_btnGroup.addEventListener(ButtonGroupEvent.BUTTON_SELECT, fOnBtnSelect);
			
			_ListCon = this["listCon"];
			_ListCon.setConStyle(getDefinitionByName("btn") as Class, 230, 34, 2, 4);
		}
		
		private function fOnDropdownMenuSelect(e:DropMenuEvent):void 
		{
			trace("dropDownMenuCon.value:"+e.target.value);
		}
		private function fOnBtnSelect(e:ButtonGroupEvent):void 
		{
			trace("_btnGroup.value:"+e.target.value);
		}
		private function resizeStage()
		{
			this["bg"].width  = stage.stageWidth;
			this["bg"].height = stage.stageHeight;
			this["bg"].x = stage.stageWidth / 2;
			this["bg"].y = stage.stageHeight / 2;
		}
	}

}