package com.snakybo.misslecommand.world {
	import com.snakybo.misslecommand.Game;
	import com.snakybo.misslecommand.gui.GuiText;
	import com.snakybo.misslecommand.utils.display.sAddChild;
	import flash.display.MovieClip;
	import com.snakybo.misslecommand.entity.Entity;
	import com.snakybo.misslecommand.utils.cookie.Cookie;
	
	/** @author Kevin Krol */
	public class WorldHandler extends MovieClip {
		private var background:MovieClip;
		private var score:GuiText;
		private var highScore:GuiText;
		
		public function WorldHandler() {
			background = new mc_background();
			
			background.y = 0;
			
			sAddChild(background, Game.main);
			
			score = new GuiText("Score: 0", 15, 5, 40);
			
			if (Cookie.isCookieSet("missileCommand", "highscore")) {
				highScore =  new GuiText("Highscore: " + Cookie.getCookie("missileCommand", "highScore"), 15, 45, 40);
			}
		}
		
		public function update():void {
			score.setText("Score: " + Entity.asteroidsDestroyed.toString());
		}
	}
}