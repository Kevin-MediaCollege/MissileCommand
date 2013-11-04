package com.snakybo.misslecommand {
	import com.snakybo.misslecommand.world.World;
	import flash.display.MovieClip;
	import com.snakybo.misslecommand.sound.SoundManager;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import com.snakybo.misslecommand.utils.toggleFullscreen;

	/** @author Kevin Krol */
	public class Game extends MovieClip {
		public static var main:Main;
		
		private var asteroidSpawnDelay:int;
		
		private var world:World;
		
		public function Game(main:Main) {
			Game.main = main;
			
			asteroidSpawnDelay = 45;
			
			SoundManager.initialize();
			SoundManager.importSound("explosion", "explosion.mp3");
			
			world = new World();
			
			main.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		/** Game loop */
		private var tick:int;
		public function loop(e:Event):void {
			tick++;
			
			// Spawn new asteroids
			if ((tick % asteroidSpawnDelay) == 0 && World.towers.length > 0) {
				world.addAsteroid();
			}
			
			if ((tick % 200) == 0) {
				asteroidSpawnDelay--;
			}
			
			world.loop();
		}
		
		private function onKeyDown(e:KeyboardEvent):void { 
			switch(e.keyCode) {
			case Keyboard.F:
				toggleFullscreen(main.stage);
			}
		}
	}
}