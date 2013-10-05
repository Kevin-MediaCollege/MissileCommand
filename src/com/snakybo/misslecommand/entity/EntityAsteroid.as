package com.snakybo.misslecommand.entity {
	import com.snakybo.misslecommand.world.World;
	import flash.display.MovieClip;
	
	/** @author Kevin Krol */
	public class EntityAsteroid extends Entity {
		private const asteroids:Array = [new mc_asteroid_small(), new mc_asteroid_medium(), new mc_asteroid_large()];
		
		public function EntityAsteroid(x:int, y:int, rotation:Number, speed:Number) {
			var rand:int = int(Math.random() * asteroids.length);
			
			super(ENTITY_ASTEROID, asteroids[rand], x, y, rotation, speed);
		}
	}
}