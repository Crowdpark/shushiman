package com.crowdpark.sushiman.views.flashgui
{
	import flash.display.Sprite;

	/**
	 * @author sandberg
	 */
	public class FlashGUIView extends Sprite
	{
		private var _gui:GraphicGUI;
		private var _friendsList:Sprite;

		public function FlashGUIView()
		{
			_gui = new GraphicGUI();
			addChild(_gui);

			addFriendsList();

			score = 0;
			numLives =  3;
			numOctoPussies = 10;
		}

		private function addFriendsList():void
		{
			_friendsList = new Sprite();
			_friendsList.x = 50;
			_friendsList.y = 540;
			addChild(_friendsList);

			
			var n:int = 5;
			for(var i:int = 0; i<n; i++)
			{
				var win:FriendsWindow = new FriendsWindow();
				win.x = i * (win.width + FriendsWindow.MARGIN);
				win.y = 10;
				_friendsList.addChild(win);
			}
	
		}

		public function set score(value:int):void
		{
			_gui.hudView.score.text = value.toString();
		}
		
		public function set numLives(value:int):void
		{
			_gui.hudView.pills.text = value.toString();
		}
		
		public function set numOctoPussies(value:int):void
		{
			_gui.hudView.octopus.text = value.toString();
		}
		
	}
}
