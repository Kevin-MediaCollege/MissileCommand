package com.snakybo.misslecommand_prototype {
	import flash.display.MovieClip;
	import flash.events.Event;

	/** @author Kevin */
	public class Main extends MovieClip {
		public function Main() {
			var game:Game = new Game(this);
			
			addEventListener(Event.ENTER_FRAME, game.loop);
		}
	}
}
