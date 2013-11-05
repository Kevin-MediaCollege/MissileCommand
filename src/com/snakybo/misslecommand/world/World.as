package com.snakybo.misslecommand.world {
	import com.snakybo.misslecommand.entity.Entity;
	import com.snakybo.misslecommand.entity.EntityTower;
	import com.snakybo.misslecommand.entity.Explosion;
	import flash.display.MovieClip;
	
	/** @author Kevin Krol */
	public class World extends MovieClip {
		public static var towers:Vector.<EntityTower>;
		public static var asteroids:Vector.<Entity>;
		public static var missiles:Vector.<Entity>;
		public static var explosions:Vector.<Explosion>;
		
		private var worldHandler:WorldHandler;
		
		public function World() {
			towers = new Vector.<EntityTower>;
			asteroids = new Vector.<Entity>;
			missiles = new Vector.<Entity>;
			explosions = new Vector.<Explosion>;
			
			worldHandler = new WorldHandler();
			
			towers.push(new EntityTower(EntityTower.TOWER_MISSILE, 112, 696, 5));
			towers.push(new EntityTower(EntityTower.TOWER_ROCKET, 287, 696, 15));
			towers.push(new EntityTower(EntityTower.TOWER_MISSILE, 462, 696, 5));
			
			towers.push(new EntityTower(EntityTower.TOWER_MISSILE, 812, 696, 5));
			towers.push(new EntityTower(EntityTower.TOWER_ROCKET, 987, 696, 15));
			towers.push(new EntityTower(EntityTower.TOWER_MISSILE, 1162, 696, 5));
		}
		
		/** World loop */
		public function loop():void {
			for each (var asteroid:Entity in asteroids) {
				asteroid.loop();
			}
			
			for each (var missile:Entity in missiles) {
				missile.loop();
			}
			
			for each (var tower:EntityTower in towers) {
				tower.loop();
			}
			
			for each (var explosion:Explosion in explosions) {
				explosion.loop();
			}
			
			worldHandler.update();
		}
		
		/** Add asteroid */
		public function addAsteroid():void {
			function getRotation():Number {
				var rotation:Number = Math.random() * 180 + 90;
				
				if (rotation <= 135) {
					rotation += 40;
				} else if (rotation >= 225) {
					rotation -= 40;
				}
				
				return rotation;
			}
			
			var x:int = Math.floor(Math.random() * 1280);
			var speed:Number = (Math.random() * 10) + 1;
			
			asteroids.push(new Entity(Entity.ENTITY_ASTEROID, x, -15, getRotation(), speed));
		}
	}
}