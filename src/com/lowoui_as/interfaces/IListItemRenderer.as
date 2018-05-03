package com.lowoui_as.interfaces
{
	public interface IListItemRenderer
	{
		/**
		 * Set the list data to an itemRenderer when the list changes, either by scrolling, or refreshing.
		 * @param index The index of the data in the DataProvider that the itemRenderer represents
		 * @param label The string label for the itemRenderer, determined by the labelField or labelFunction of the list component.
		 * @param selected The selected state of the itemRenderer
		 */
		function setListData(index:Number, label:String, selected:Boolean):Void;

		/**
		 * The data in the DataProvider of the list component that the itemRenderer represents.
		 * @param data A generic data object.  This method is primarily just to store the value, but it can also customize the renderer based on its contents.
		 */
		function setData(data:Object):Void;
	}
}
