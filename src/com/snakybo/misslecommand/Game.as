package com.snakybo.misslecommand {
	import com.snakybo.misslecommand.entity.EntityAsteroid;
	import com.snakybo.misslecommand.world.World;
	import flash.display.MovieClip;
	import flash.events.Event;

	/** @author Kevin Krol */
	public class Game extends MovieClip {
		public static var main:Main;
		
		private var asteroidSpawnDelay:int;
		
		private var world:World;
		
		public function Game(main:Main) {
			Game.main = main;
			
			asteroidSpawnDelay = 45;
			
			world = new World();
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
	}
}