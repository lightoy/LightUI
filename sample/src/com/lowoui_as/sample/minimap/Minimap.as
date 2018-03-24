package com.lowoui_as.sample.minimap
{
	import com.greensock.easing.*;
	import com.greensock.TweenLite;
	import com.lowoui_as.core.UIMovie;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author www.loywong.com
	 */
	public class Minimap extends UIMovie
	{
		public static var viewName:String = "Minimap";
		
		//private var mapInfo:Array;
		//private var MapTexSize:uint;
		
		//private var PlayerIcon:Sprite;
		
		private var friendsIcons:Array;
		private var enemiesIcons:Array;
		//private var flagIcons:Array;
		//private var objectiveIcons:Array;
		
		private var showEnemiesArr:Array;
		private var showFriendsArr:Array;
		
		private var playerPos:Point;
		private var posScale:Number = 0.1; //0.1 = 200pix / 2000 ue
		
		private const MapWidth:int = 224;
		private const MapHeight:int = 145;
		
		//private var friendIcon:Class;
		//private var enemyIcon:Class;
		
		public function Minimap() 
		{
			super(170 / 2 + 5, 245 / 2 + 5, 0, 0, 0, 0);
			//trace(["minimap",thisWidth,thisHeight]);
			
			friendsIcons = [];
			enemiesIcons = [];
			
			showFriendsArr = [];
			showEnemiesArr = [];
			
			playerPos = new Point();
			
			//friendIcon = getDefinitionByName("MinimapFriendIcon") as Class;
			//enemyIcon = getDefinitionByName("MinimapEnemyIcon") as Class;
		}
		
		public function setMinimapInfo(name:String) : void
		{
			if (name != null && name != "") 
				this["mapCon"].visible = true;
			else 
				this["mapCon"].visible = false;
		}
		
		internal function updatePlayerPosition(wX:Number,wY:Number):void
		{
			playerPos.x = wX;
			playerPos.y = wY;
		}
		internal function updatePlayerRotation(angle:Number):void
		{
			this["playerRotation"].rotation = angle;
		}
		internal function setMinimapFriends(friendsArr:Array):void
		{
			showFriendsArr = [];
			var xLimit:Number = MapWidth / 2 / posScale;
			var yLimit:Number = MapHeight / 2 / posScale;
			
			for (var i:int = 0; i < friendsArr.length; i++) 
			{
				if( Math.abs(friendsArr[i][0]-playerPos.x)<yLimit &&
					Math.abs(friendsArr[i][1]-playerPos.y)<xLimit )
				{
					showFriendsArr.push(friendsArr[i]);
				}
			}
			
			updateAllObjects(showFriendsArr,"friend");
		}
		internal function setMinimapEnemies(enemiesArr:Array):void
		{
			showEnemiesArr = [];
			var xLimit:Number = MapWidth / 2 / posScale;
			var yLimit:Number = MapHeight / 2 / posScale;
			
			for (var i:int = 0; i < enemiesArr.length; i++) 
			{
				if( Math.abs(enemiesArr[i][0]-playerPos.x)<yLimit &&
					Math.abs(enemiesArr[i][1]-playerPos.y)<xLimit) 
				{
					showEnemiesArr.push(enemiesArr[i]);
				}
			}
			updateAllObjects(showEnemiesArr,"enemy");
		}
		
		private function updateAllObjects(objArr:Array,objType:String):void
		{
			if (objType == "friend")
			{
				updateCurrentObjects(objArr,friendsIcons,MinimapFriendIcon);
			}
			else if (objType == "enemy")
			{
				updateCurrentObjects(objArr,enemiesIcons,MinimapEnemyIcon);
			}
		}
		
		private function updateCurrentObjects(objArr:Array,currTypeIcons:Array,IconType:*):void
		{

			if (objArr.length > currTypeIcons.length)
			{
				for (var i:int = currTypeIcons.length; i < objArr.length; i++) 
				{
					var currIcon:*= new IconType();
					
					currTypeIcons.push(currIcon);
						
					this.addChild(currIcon);
				}
			}
			else
			{
				for (var j:int = objArr.length; j < currTypeIcons.length; j++) 
				{
					currTypeIcons[j].visible = false;
				}
			}

			for (var k:int = 0; k < objArr.length; k++) 
			{
				currTypeIcons[k].visible = true;
				setObjIconPos(objArr[k],currTypeIcons[k] as Object);
			}
		}
		
		private function setObjIconPos(posArr:Array,thisIcon:Object):void
		{
			thisIcon.x = (posArr[1]-playerPos.y) * posScale;
			thisIcon.y = -(posArr[0]-playerPos.x) * posScale;
		}
		
		/**inherit functions*/
		override public function inactiveView()
		{
			super.inactiveView();
			TweenLite.to(this, 0.5, {alpha:0.25, ease:Sine.easeOut} );
		}
		override public function activeView()
		{
			super.activeView();
			TweenLite.to(this, 0.3, {alpha:1, ease:Sine.easeOut} );
		}
	}
}
