package com.snakybo.misslecommand.entity {
	import com.snakybo.misslecommand.world.World;
	import flash.display.MovieClip;
	import com.snakybo.misslecommand.Game;
	import com.snakybo.misslecommand.util.Coord;
	
	/** @author Kevin Krol */
	public class Entity extends MovieClip {
		public static const ENTITY_ASTEROID:int = 1;
		public static const ENTITY_MISSILE:int = 2;
		public static const ENTITY_TOWER:int = 3
		public static const ENTITY_ROCKET:int = 4
		
		protected var mc:MovieClip;
		protected var speed:Number;
		
		private var entityID:int;
		
		private var explodeX:int;
		private var explodeY:int;
		
		public function Entity(entityID:int, mc:MovieClip, x:int, y:int, rotation:Number = NaN, speed:Number = NaN) {
			this.entityID = entityID;
			this.mc = mc;
			this.speed = speed;
			
			mc.x = x;
			mc.y = y;
			mc.rotation = rotation;	
			
			if (entityID == ENTITY_ROCKET) {
				explodeX = mouseX;
				explodeY = mouseY;
			}
			
			Game.main.addChild(mc);
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
					for each (var asteroid:EntityAsteroid in World.asteroids) {
						if (Coord.getDistance(mc.x, mc.y, asteroid.mc.x, asteroid.mc.y) < 30) {
							asteroid.explode();
							explode();
							
							break;
						}
					}
				} else if (entityID == ENTITY_ROCKET) {
					if (Coord.getDistance(mc.x, mc.y, explodeX, explodeY) < 15) {
						explode();
						
						for each(var asteroid2:EntityAsteroid in World.asteroids) {
							if (Coord.getDistance(mc.x, mc.y, asteroid2.mc.x, asteroid2.mc.y) < 50) {
								asteroid2.explode();
							}
						}
					}
				}
			} else {
				destroy();
			}
		}
		
		/** Destroy object */
		protected function destroy():void {
			Game.main.removeChild(mc);
			
			switch (entityID) {
			case 1:
				World.asteroids.splice(World.asteroids.indexOf(this), 1);
				break;
			case 2:
				World.missiles.splice(World.missiles.indexOf(this), 1);
				break;
			case 3:
				World.towers.splice(World.towers.indexOf(this), 1);
				break;
			case 4:
				World.missiles.splice(World.missiles.indexOf(this), 1);
				break;
			}
		}
		
		/** Explode object */
		protected function explode():void {
			World.explosions.push(new Explosion(mc.x, mc.y, entityID));
			
			destroy();
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