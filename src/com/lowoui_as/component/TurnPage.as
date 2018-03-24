package com.lowoui_as.component 
{
	import com.lowoui_as.utils.PlaySound;
	//import com.business.Global;
	//import com.business.config.Lang;

	/**
	 * ...
	 * @author www.loywong.com
	 */
	class TurnPage extends MovieClip
	{
		public var totalPages:Number;
		public var currentPage:Number;
		
		private static var _this:Object;
		
		public function TurnPage()
		{
			_this = this;
			currentPage = 1;
			totalPages = 1;
			
			this["page"].selectable = false;
			
			this["btnPrev"]["tt"].text = Lang.Type.PersonalHome.PageGoPrev;
			this["btnNext"]["tt"].text = Lang.Type.PersonalHome.PageGoNext;
			
			this["btnPrev"]["btn"].onRelease = fRelease;
			this["btnNext"]["btn"].onRelease = fRelease;
		}
		
		private function fRelease()
		{
			if (this._parent._name=="btnPrev")
			{
				if (_this.currentPage > 1)
				{
					PlaySound.sounder.play("Button_Next", "onClick");
					_this.currentPage--;
					Global.mainMC._tempMain.currentOverItem = 999;
				}
			}
			else if(this._parent._name=="btnNext")
			{
				if (_this.currentPage < _this.totalPages)
				{
					PlaySound.sounder.play("Button_Next", "onClick");
					_this.currentPage++;
					Global.mainMC._tempMain.currentOverItem = 999;
				}
			}
			
			_this.updatePageShow();
			_this.updateBtnState();
			_this.updateContainerList();
		}
		private function updatePageShow()
		{
			_this["page"].text = String(_this.currentPage) + "/" + String(_this.totalPages);
		}
		private function updateBtnState()
		{		
			if (_this.totalPages == 0||_this.totalPages == 1)
			{
				_this["btnPrev"].setDisabled();
				_this["btnNext"].setDisabled();
			}
			else
			{
				if (_this.currentPage == 1)
				{
					_this["btnPrev"].setDisabled();
					_this["btnNext"].setEnable();
				}
				else if (_this.currentPage == _this.totalPages)
				{
					_this["btnPrev"].setEnable();
					_this["btnNext"].setDisabled();
				}
				else
				{
					_this["btnPrev"].setEnable();
					_this["btnNext"].setEnable();
				}
			}
		}
		
		//public functions
		public function initializePages($currentPage:Number, $totalPages:Number)
		{
			_this.currentPage = $currentPage;
			_this.totalPages = $totalPages;
			
			if ($totalPages == 0) this["page"].text = String(0) + "/" + String(0);
			else this["page"].text = String($currentPage) + "/" + String($totalPages);
			
			this.updateBtnState();
		}
		public function updateContainerList()
		{
			//
		}
	}
}
