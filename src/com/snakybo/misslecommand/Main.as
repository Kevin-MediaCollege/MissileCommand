package com.snakybo.misslecommand {
	import com.snakybo.misslecommand.Game;
	import com.snakybo.misslecommand.util.Vector3;
	import flash.display.Sprite;
	import com.snakybo.misslecommand.util.Vector2;
	import flash.events.Event;
	
	/** @author Kevin Krol */
	public class Main extends Sprite {
		public function Main() {
			if (stage) {
				init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		/** Initialize */
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
			var game:Game = new Game(this);
			
			addEventListener(Event.ENTER_FRAME, game.loop);
		}
	}
}