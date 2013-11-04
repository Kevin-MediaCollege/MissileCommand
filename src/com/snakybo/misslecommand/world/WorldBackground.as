package com.snakybo.misslecommand.world {
	import com.snakybo.misslecommand.Game;
	import com.snakybo.misslecommand.utils.display.sAddChild;
	import flash.display.MovieClip;
	
	/** @author Kevin Krol */
	public class WorldBackground extends MovieClip {
		private var background:MovieClip;
		
		public function WorldBackground() {
			background = new mc_background();
			
			background.y = 0;
			
			sAddChild(background, Game.main);
		}
	}
}