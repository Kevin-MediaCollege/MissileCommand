package com.snakybo.misslecommand.world {
	import flash.display.MovieClip;
	import com.snakybo.misslecommand.Game;
	
	/** @author Kevin Krol */
	public class WorldBackground extends MovieClip {
		private var background:MovieClip;
		
		public function WorldBackground() {
			background = new mc_background();
			
			background.y = 0;
			
			Game.main.addChild(background);
		}
	}
}