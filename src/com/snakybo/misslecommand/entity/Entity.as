package com.snakybo.misslecommand.entity {
	import com.snakybo.misslecommand.Game;
	import com.snakybo.misslecommand.utils.display.sAddChild;
	import com.snakybo.misslecommand.utils.display.sRemoveChild;
	import com.snakybo.misslecommand.utils.math.Coord;
	import com.snakybo.misslecommand.world.World;
	import com.snakybo.misslecommand.sound.SoundManager;
	import flash.display.MovieClip;
	
	/** @author Kevin Krol */
	public class Entity extends MovieClip {
		public static const ENTITY_ASTEROID:int = 1;
		public static const ENTITY_MISSILE:int = 2;
		public static const ENTITY_ROCKET:int = 3;
		
		public static var asteroidsDestroyed:int = 0;
		
		protected var mc:MovieClip;
		protected var speed:Number;
		
		private var entityID:int;
		
		private var asteroids:Array = [new mc_asteroid_small(), new mc_asteroid_medium(), new mc_asteroid_large()];
		
		private var explodeX:int;
		private var explodeY:int;
		private var isExploding:Boolean;
		
		public function Entity(entityID:int, x:int, y:int, rotation:Number = NaN, speed:Number = NaN) {
			this.mc = new MovieClip();
			
			switch(entityID) {
			case ENTITY_ASTEROID:
				var rand:int = Math.floor(Math.random() * asteroids.length);
				this.mc = asteroids[rand];
				break;
			case ENTITY_MISSILE:
				this.mc = new mc_tower_gatling_missile();
				break;
			case ENTITY_ROCKET:
				this.mc = new mc_tower_rocket_missile();
				break;
			case EntityTower.TOWER_MISSILE:
				this.mc = new mc_tower_gatling();
				break;
			case EntityTower.TOWER_ROCKET:
				this.mc = new mc_tower_rocket();
			}
			
			this.entityID = entityID;
			this.speed = speed;
			
			mc.x = x;
			mc.y = y;
			mc.rotation = rotation;	
			
			if (entityID == ENTITY_ROCKET) {
				explodeX = mouseX;
				explodeY = mouseY;
			}
			
			sAddChild(mc, Game.main, 2);
		}
		
		/** Loop entities */
		public function loop():void {
			mc.x = Coord.getNextX(mc.x, (mc.rotation - 90), speed);
			mc.y = Coord.getNextY(mc.y, (mc.rotation - 90), speed);
			
			if (mc.x < (1280 + mc.width) && mc.x > -mc.width && mc.y < (720 + mc.height) && mc.y > -mc.height) {
				if (entityID == ENTITY_ASTEROID) {
					for each (var tower:EntityTower in World.towers) {
						if (Coord.getDistance(mc.x, mc.y, tower.mc.x, tower.mc.y) < 65) {
							tower.destroyed = true;
							explode();
							
							break;
						}	
					}
				} else if (entityID == ENTITY_MISSILE) {
					for each (var asteroid:Entity in World.asteroids) {
						if (Coord.getDistance(mc.x, mc.y, asteroid.mc.x, asteroid.mc.y) < 30) {
							asteroid.explode();
							destroy();
							
							break;
						}
					}
				} else if (entityID == ENTITY_ROCKET) {
					if (Coord.getDistance(mc.x, mc.y, explodeX, explodeY) < 15) {
						if (!isExploding) {
							isExploding = true;
							
							explode();
							
							for each(var asteroid2:Entity in World.asteroids) {
								if (Coord.getDistance(mc.x, mc.y, asteroid2.mc.x, asteroid2.mc.y) < 50) {
									asteroid2.explode();
								}
							}
						}
					}
				}
			} else {
				destroy(true);
			}
		}
		
		/** Destroy object */
		protected function destroy(outOfScreen:Boolean = false):void {
			sRemoveChild(mc, Game.main);
			
			switch (entityID) {
			case ENTITY_ASTEROID:
				if(!outOfScreen) asteroidsDestroyed++;
				World.asteroids.splice(World.asteroids.indexOf(this), 1);
				break;
			case ENTITY_MISSILE || ENTITY_ROCKET:
				World.missiles.splice(World.missiles.indexOf(this), 1);
				break;
			}
		}
		
		/** Explode object */
		protected function explode(outOfScreen:Boolean = false):void {
			SoundManager.playSound("explosion");
			
			World.explosions.push(new Explosion(mc.x, mc.y, entityID));
			
			destroy(outOfScreen);
		}
		
		/** Set X */
		protected function setX(x:int):void {
			mc.x = this.x;
		}
		
		/** Set Y */
		protected function setY(y:int):void {
			mc.y = this.y;
		}
		
		/** Set Direction */
		protected function setRotation(rotation:Number):void {
			mc.rotation = rotation;
		}
		
		/** Set speed */
		protected function setSpeed(speed:Number):void {
			this.speed = speed;
		}
	}
}