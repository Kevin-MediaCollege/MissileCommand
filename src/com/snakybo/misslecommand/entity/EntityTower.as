package com.snakybo.misslecommand.entity {
	import com.snakybo.misslecommand.Game;
	import com.snakybo.misslecommand.utils.display.sAddChild;
	import com.snakybo.misslecommand.utils.display.sRemoveChild;
	import com.snakybo.misslecommand.utils.math.Coord;
	import com.snakybo.misslecommand.world.World;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/** @author Kevin Krol */
	public class EntityTower extends Entity {
		public static const TOWER_MISSILE:int = 10;	
		public static const TOWER_ROCKET:int = 11;
		
		public var destroyed:Boolean;
		
		private var mc_gun:MovieClip;		
		private var towerID:int;
		private var cooldown:int;
		
		private var buttonDown:Boolean;
		
		public function EntityTower(towerID:int, x:int, y:int, cooldown:int) {
			super(towerID, x, y);
			
			this.mc_gun = new MovieClip();
			
			switch(towerID) {
				case TOWER_MISSILE:
					this.mc_gun = new mc_tower_gatling_gun();
					break;
				case TOWER_ROCKET:
					this.mc_gun = new mc_tower_rocket_gun();
					break;
			}
			
			this.towerID = towerID;
			this.cooldown = cooldown;
			
			mc_gun.x = x;
			mc_gun.y = y - (mc_gun.height / 2) + 5;
			mc_gun.rotation = -mc_gun.rotation;
			
			sAddChild(mc_gun, Game.main, 1);
			
			Game.main.stage.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			Game.main.stage.addEventListener(MouseEvent.MOUSE_UP, onUp);
		}
		
		/** Loop towers */
		private var tick:int;
		public override function loop():void {
			tick++;
			
			if (destroyed) {
				Game.main.stage.removeEventListener(MouseEvent.MOUSE_DOWN, onDown);
				Game.main.stage.removeEventListener(MouseEvent.MOUSE_UP, onUp);
				
				World.towers.splice(World.towers.indexOf(this), 1);
				
				explode();
				
				sRemoveChild(mc_gun, Game.main);
			}
			
			mc_gun.rotation = Coord.getDegreeFromPoint(mc_gun.x, mc_gun.y, mouseX, mouseY) - 270;
			
			if (buttonDown) {
				if (tick >= cooldown) {
					switch(towerID) {
					case TOWER_MISSILE:
						World.missiles.push(new Entity(ENTITY_MISSILE, mc_gun.x, mc_gun.y, mc_gun.rotation, 6));
						break;
					case TOWER_ROCKET:
						World.missiles.push(new Entity(ENTITY_ROCKET, mc_gun.x, mc_gun.y, mc_gun.rotation, 15));
						break;
					}
					
					tick = 0;
				}
			}
		}
		
		/** On button down */
		private function onDown(e:MouseEvent):void {
			buttonDown = true;
		}
		
		/** On button up */
		private function onUp(e:MouseEvent):void {
			buttonDown = false;
		}
	}
}