package com.snakybo.misslecommand.world {
	import com.snakybo.misslecommand.entity.EntityAsteroid;
	import com.snakybo.misslecommand.entity.Explosion;
	import flash.display.MovieClip;
	import com.snakybo.misslecommand.entity.Entity;
	import com.snakybo.misslecommand.entity.EntityTower;
	import com.snakybo.misslecommand.entity.EntityTowerGatling;
	import com.snakybo.misslecommand.entity.EntityTowerRocket;
	import com.snakybo.misslecommand.Game;
	
	/** @author Kevin Krol */
	public class World extends MovieClip {
		public static var towers:Vector.<EntityTower>;
		public static var asteroids:Vector.<Entity>;
		public static var missiles:Vector.<Entity>;
		public static var explosions:Vector.<Explosion>;
		
		public function World() {
			towers = new Vector.<EntityTower>;
			asteroids = new Vector.<Entity>;
			missiles = new Vector.<Entity>;
			explosions = new Vector.<Explosion>;
			
			new WorldBackground();
			
			addTower(EntityTowerGatling, 112);
			addTower(EntityTowerRocket, 287);
			addTower(EntityTowerGatling, 462);
			
			addTower(EntityTowerGatling, 812);
			addTower(EntityTowerRocket, 987);
			addTower(EntityTowerGatling, 1162);
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
			
			asteroids.push(new EntityAsteroid(x, -15, getRotation(), speed));
		}
		
		/** Add tower */
		public function addTower(tower:Class, x:int):void {
			towers.push(new tower(x, 696));
		}
	}
}